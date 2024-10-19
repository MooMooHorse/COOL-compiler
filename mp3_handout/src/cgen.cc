/*********************************************************************
 Intermediate code generator for COOL: SKELETON

 The following code is assisted by Github Copilot.

 Read the comments carefully and add code to build an LLVM program
*********************************************************************/

#define EXTERN
#include "cgen.h"
#include <fstream>
#include <sstream>
#include <string>
#define MP3

extern int cgen_debug, curr_lineno;

/*********************************************************************
 For convenience, a large number of symbols are predefined here.
 These symbols include the primitive type and method names, as well
 as fixed names used by the runtime system. Feel free to add your
 own definitions as you see fit.
*********************************************************************/
EXTERN Symbol
    // required classes
    Object,
    IO, String, Int, Bool, Main,

    // class methods
    cool_abort, type_name, cool_copy, out_string, out_int, in_string, in_int,
    length, concat, substr,

    // class members
    val,

    // special symbols
    No_class,  // symbol that can't be the name of any user-defined class
    No_type,   // If e : No_type, then no code is generated for e.
    SELF_TYPE, // Special code is generated for new SELF_TYPE.
    self,      // self generates code differently than other references

    // extras
    arg, arg2, newobj, Mainmain, prim_string, prim_int, prim_bool;

// Initializing the predefined symbols.
static void initialize_constants(void)
{
    Object = idtable.add_string("Object");
    IO = idtable.add_string("IO");
    String = idtable.add_string("String");
    Int = idtable.add_string("Int");
    Bool = idtable.add_string("Bool");
    Main = idtable.add_string("Main");

    cool_abort = idtable.add_string("abort");
    type_name = idtable.add_string("type_name");
    cool_copy = idtable.add_string("copy");
    out_string = idtable.add_string("out_string");
    out_int = idtable.add_string("out_int");
    in_string = idtable.add_string("in_string");
    in_int = idtable.add_string("in_int");
    length = idtable.add_string("length");
    concat = idtable.add_string("concat");
    substr = idtable.add_string("substr");

    val = idtable.add_string("val");

    No_class = idtable.add_string("_no_class");
    No_type = idtable.add_string("_no_type");
    SELF_TYPE = idtable.add_string("SELF_TYPE");
    self = idtable.add_string("self");

    arg = idtable.add_string("arg");
    arg2 = idtable.add_string("arg2");
    newobj = idtable.add_string("_newobj");
    Mainmain = idtable.add_string("main");
    prim_string = idtable.add_string("sbyte*");
    prim_int = idtable.add_string("int");
    prim_bool = idtable.add_string("bool");
}

/*********************************************************************

  CgenClassTable methods

*********************************************************************/

// CgenClassTable constructor orchestrates all code generation
CgenClassTable::CgenClassTable(Classes classes, std::ostream &s)
    : nds(0), current_tag(0)
{
    if (cgen_debug)
        std::cerr << "Building CgenClassTable" << std::endl;
    ct_stream = &s;
    // Make sure we have a scope, both for classes and for constants
    enterscope();

    // Create an inheritance tree with one CgenNode per class.
    install_basic_classes();
    install_classes(classes);
    build_inheritance_tree();

    // First pass
    setup();

    // Second pass
    code_module();
    // Done with code generation: exit scopes
    exitscope();
}

// Creates AST nodes for the basic classes and installs them in the class list
void CgenClassTable::install_basic_classes()
{
    // The tree package uses these globals to annotate the classes built below.
    curr_lineno = 0;
    Symbol filename = stringtable.add_string("<basic class>");

    //
    // A few special class names are installed in the lookup table but not
    // the class list. Thus, these classes exist, but are not part of the
    // inheritance hierarchy.

    // No_class serves as the parent of Object and the other special classes.
    Class_ noclasscls = class_(No_class, No_class, nil_Features(), filename);
    install_special_class(new CgenNode(noclasscls, CgenNode::Basic, this));
    delete noclasscls;

#ifdef MP3
    // SELF_TYPE is the self class; it cannot be redefined or inherited.
    Class_ selftypecls = class_(SELF_TYPE, No_class, nil_Features(), filename);
    install_special_class(new CgenNode(selftypecls, CgenNode::Basic, this));
    delete selftypecls;
    //
    // Primitive types masquerading as classes. This is done so we can
    // get the necessary Symbols for the innards of String, Int, and Bool
    //
    Class_ primstringcls =
        class_(prim_string, No_class, nil_Features(), filename);
    install_special_class(new CgenNode(primstringcls, CgenNode::Basic, this));
    delete primstringcls;
#endif
    Class_ primintcls = class_(prim_int, No_class, nil_Features(), filename);
    install_special_class(new CgenNode(primintcls, CgenNode::Basic, this));
    delete primintcls;
    Class_ primboolcls = class_(prim_bool, No_class, nil_Features(), filename);
    install_special_class(new CgenNode(primboolcls, CgenNode::Basic, this));
    delete primboolcls;
    //
    // The Object class has no parent class. Its methods are
    //    cool_abort() : Object    aborts the program
    //    type_name() : Str        returns a string representation of class name
    //    copy() : SELF_TYPE       returns a copy of the object
    //
    // There is no need for method bodies in the basic classes---these
    // are already built in to the runtime system.
    //
    Class_ objcls = class_(
        Object, No_class,
        append_Features(
            append_Features(single_Features(method(cool_abort, nil_Formals(),
                                                   Object, no_expr())),
                            single_Features(method(type_name, nil_Formals(),
                                                   String, no_expr()))),
            single_Features(
                method(cool_copy, nil_Formals(), SELF_TYPE, no_expr()))),
        filename);
    install_class(new CgenNode(objcls, CgenNode::Basic, this));
    delete objcls;

    //
    // The Int class has no methods and only a single attribute, the
    // "val" for the integer.
    //
    Class_ intcls = class_(
        Int, Object, single_Features(attr(val, prim_int, no_expr())), filename);
    install_class(new CgenNode(intcls, CgenNode::Basic, this));
    delete intcls;

    //
    // Bool also has only the "val" slot.
    //
    Class_ boolcls = class_(
        Bool, Object, single_Features(attr(val, prim_bool, no_expr())), filename);
    install_class(new CgenNode(boolcls, CgenNode::Basic, this));
    delete boolcls;

#ifdef MP3
    //
    // The class String has a number of slots and operations:
    //       val                                  the string itself
    //       length() : Int                       length of the string
    //       concat(arg: Str) : Str               string concatenation
    //       substr(arg: Int, arg2: Int): Str     substring
    //
    Class_ stringcls =
        class_(String, Object,
               append_Features(
                   append_Features(
                       append_Features(
                           single_Features(attr(val, prim_string, no_expr())),
                           single_Features(
                               method(length, nil_Formals(), Int, no_expr()))),
                       single_Features(method(concat,
                                              single_Formals(formal(arg, String)),
                                              String, no_expr()))),
                   single_Features(
                       method(substr,
                              append_Formals(single_Formals(formal(arg, Int)),
                                             single_Formals(formal(arg2, Int))),
                              String, no_expr()))),
               filename);
    install_class(new CgenNode(stringcls, CgenNode::Basic, this));
    delete stringcls;
#endif

#ifdef MP3
    //
    // The IO class inherits from Object. Its methods are
    //        out_string(Str) : SELF_TYPE          writes a string to the output
    //        out_int(Int) : SELF_TYPE               "    an int    "  "     "
    //        in_string() : Str                    reads a string from the input
    //        in_int() : Int                         "   an int     "  "     "
    //
    Class_ iocls = class_(
        IO, Object,
        append_Features(
            append_Features(
                append_Features(
                    single_Features(method(out_string,
                                           single_Formals(formal(arg, String)),
                                           SELF_TYPE, no_expr())),
                    single_Features(method(out_int,
                                           single_Formals(formal(arg, Int)),
                                           SELF_TYPE, no_expr()))),
                single_Features(
                    method(in_string, nil_Formals(), String, no_expr()))),
            single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
        filename);
    install_class(new CgenNode(iocls, CgenNode::Basic, this));
    delete iocls;
#endif
}

// install_classes enters a list of classes in the symbol table.
void CgenClassTable::install_classes(Classes cs)
{
    for (auto cls : cs)
    {
        install_class(new CgenNode(cls, CgenNode::NotBasic, this));
    }
}

// Add this CgenNode to the class list and the lookup table
void CgenClassTable::install_class(CgenNode *nd)
{
    Symbol name = nd->get_name();
    if (!this->find(name))
    {
        // The class name is legal, so add it to the list of classes
        // and the symbol table.
        nds.push_back(nd);
        this->insert(name, nd);
    }
}

// Add this CgenNode to the special class list and the lookup table
void CgenClassTable::install_special_class(CgenNode *nd)
{
    Symbol name = nd->get_name();
    if (!this->find(name))
    {
        // The class name is legal, so add it to the list of special classes
        // and the symbol table.
        special_nds.push_back(nd);
        this->insert(name, nd);
    }
}

// CgenClassTable::build_inheritance_tree
void CgenClassTable::build_inheritance_tree()
{
    for (auto node : nds)
        set_relations(node);
}

// CgenClassTable::set_relations
// Takes a CgenNode and locates its, and its parent's, inheritance nodes
// via the class table. Parent and child pointers are added as appropriate.
//
void CgenClassTable::set_relations(CgenNode *nd)
{
    Symbol parent = nd->get_parent();
    auto parent_node = this->find(parent);
    if (!parent_node)
    {
        throw std::runtime_error("Class " + nd->get_name()->get_string() +
                                 " inherits from an undefined class " +
                                 parent->get_string());
    }
    nd->set_parent(parent_node);
}

// Sets up declarations for extra functions needed for code generation
// You should not need to modify this code for MP2
void CgenClassTable::setup_external_functions()
{
    ValuePrinter vp(*ct_stream);
    // setup function: external int strcmp(sbyte*, sbyte*)
    op_type i32_type(INT32), i8ptr_type(INT8_PTR), vararg_type(VAR_ARG);
    std::vector<op_type> strcmp_args;
    strcmp_args.push_back(i8ptr_type);
    strcmp_args.push_back(i8ptr_type);
    vp.declare(*ct_stream, i32_type, "strcmp", strcmp_args);

    // setup function: external int printf(sbyte*, ...)
    std::vector<op_type> printf_args;
    printf_args.push_back(i8ptr_type);
    printf_args.push_back(vararg_type);
    vp.declare(*ct_stream, i32_type, "printf", printf_args);

    // setup function: external void abort(void)
    op_type void_type(VOID);
    std::vector<op_type> abort_args;
    vp.declare(*ct_stream, void_type, "abort", abort_args);

    // setup function: external i8* malloc(i32)
    std::vector<op_type> malloc_args;
    malloc_args.push_back(i32_type);
    vp.declare(*ct_stream, i8ptr_type, "malloc", malloc_args);

#ifdef MP3
    // TODO: add code here
#endif
}

void CgenClassTable::setup_classes(CgenNode *c, int depth)
{
    c->setup(current_tag++, depth);
    for (auto child : c->get_children())
    {
        setup_classes(child, depth + 1);
    }
    c->set_max_child(current_tag - 1);
}

// The code generation first pass. Define these two functions to traverse
// the tree and setup each CgenNode
void CgenClassTable::setup()
{
    setup_external_functions();
    setup_classes(root(), 0);
}

// The code generation second pass. Add code here to traverse the tree and
// emit code for each CgenNode
void CgenClassTable::code_module()
{
    code_constants();

#ifndef MP3
    // This must be after code_constants() since that emits constants
    // needed by the code() method for expressions
    CgenNode *mainNode = getMainmain(root());
    mainNode->codeGenMainmain();
#endif
    code_main();

#ifdef MP3
    code_classes(root());
#endif
}

#ifdef MP3
void CgenClassTable::code_classes(CgenNode *c)
{
    // TODO: add code here
}
#endif

// Create global definitions for constant Cool objects
void CgenClassTable::code_constants()
{
#ifdef MP3
    // TODO: add code here
#endif
}

// Create LLVM entry point. This function will initiate our Cool program
// by generating the code to execute (new Main).main()
//
void CgenClassTable::code_main()
{
    /**
         Equivalent LR code:
            @.str = internal constant [25 x i8] c"Main.main() returned %d\n"

            define i32 @main() {
            entry:
                %tmp.0 = call i32 @Main_main( )
                %tmp.1 = getelementptr [25 x i8], [25 x i8]* @.str, i32 0, i32 0
                %tmp.2 = call i32(i8*, ... ) @printf(i8* %tmp.1, i32 %tmp.0)
                ret i32 0
            }
    **/

    ValuePrinter vp(*ct_stream);
    op_type i32_type(INT32);
    op_arr_type i8_arr_type(INT8, 25);
    const_value main_printf_string(i8_arr_type, "Main.main() returned %d\n", true);
    global_value main_printf_string_global(i8_arr_type.get_ptr_type(), "main.printout.str");
    operand str_addr(op_type(INT8_PTR), "tpm"); // this is to make the output exactly match the reference output
    // Step 1: Define the constant string for "Main.main() returned %d\n"

    vp.init_constant("main.printout.str", main_printf_string);

    // Step 2: Define the main function
    vp.define(i32_type, "main", std::vector<operand>());
    vp.begin_block("entry");

    // Step 3: Call Main_main and store the result
    operand main_result = vp.call({}, i32_type, "Main.main", true, {});
    // std::cerr << main_result.get_name() << std::endl;
    // Step 4: Get the address of the string "Main.main() returned %d\n"
    vp.getelementptr(*ct_stream, i8_arr_type, main_printf_string_global, int_value(0), int_value(0), str_addr);

    // Step 5: Call printf with the string and the return value of Main_main()
    std::vector<operand> printf_args = {str_addr, main_result};
    std::vector<op_type> printf_arg_types = {INT8_PTR, VAR_ARG};
    vp.call(printf_arg_types, i32_type, "printf", true, printf_args);

    // Step 6: Return 0
    vp.ret(const_value(i32_type, std::to_string(0), false)); // Use 'false' because it's not an internal constant

    // Step 7: End the block
    vp.end_define();

#ifdef MP3
// MP3
#else
// MP2
// Get the address of the string "Main_main() returned %d\n" using
// getelementptr

// Call printf with the string address of "Main_main() returned %d\n"
// and the return value of Main_main() as its arguments

// Insert return 0
#endif
}

// Get the root of the class tree.
CgenNode *CgenClassTable::root()
{
    auto root = this->find(Object);
    if (!root)
    {
        throw std::runtime_error("Class Object is not defined.");
    }
    return root;
}

#ifndef MP3
// Special-case functions used for the method Int Main::main() for
// MP2 only.
CgenNode *CgenClassTable::getMainmain(CgenNode *c)
{
    if (c && !c->basic())
        return c; // Found it!
    for (auto child : c->get_children())
    {
        if (CgenNode *foundMain = this->getMainmain(child))
            return foundMain; // Propagate it up the recursive calls
    }
    return 0; // Make the recursion continue
}
#endif

/*********************************************************************

  StrTable / IntTable methods

 Coding string, int, and boolean constants

 Cool has three kinds of constants: strings, ints, and booleans.
 This section defines code generation for each type.

 All string constants are listed in the global "stringtable" and have
 type stringEntry. stringEntry methods are defined both for string
 constant definitions and references.

 All integer constants are listed in the global "inttable" and have
 type IntEntry. IntEntry methods are defined for Int constant references only.

 Since there are only two Bool values, there is no need for a table.
 The two booleans are represented by instances of the class BoolConst,
 which defines the definition and reference methods for Bools.

*********************************************************************/

// Create definitions for all String constants
void StrTable::code_string_table(std::ostream &s, CgenClassTable *ct)
{
    for (auto &[_, entry] : this->_table)
    {
        entry.code_def(s, ct);
    }
}

// generate code to define a global string constant
void StringEntry::code_def(std::ostream &s, CgenClassTable *ct)
{
#ifdef MP3
    // TODO: add code here
#endif
}

/*********************************************************************

  CgenNode methods

*********************************************************************/

//
// Class setup. You may need to add parameters to this function so that
// the classtable can provide setup information (such as the class tag
// that should be used by this class).
//
// Things that setup should do:
//  - layout the features of the class
//  - create the types for the class and its vtable
//  - create global definitions used by the class such as the class vtable
//
void CgenNode::setup(int tag, int depth)
{
    this->tag = tag;
#ifdef MP3
    layout_features();

    // TODO: add code here

#endif
}

#ifdef MP3
// Laying out the features involves creating a Function for each method
// and assigning each attribute a slot in the class structure.
void CgenNode::layout_features()
{
    // TODO: add code here
}

// Class codegen. This should performed after every class has been setup.
// Generate code for each method of the class.
void CgenNode::code_class()
{
    // No code generation for basic classes. The runtime will handle that.
    if (basic())
    {
        return;
    }
    // TODO: add code here
}

void CgenNode::code_init_function(CgenEnvironment *env)
{
    // TODO: add code here
}

#else

// code-gen function main() in class Main
void CgenNode::codeGenMainmain()
{
    // In Phase 1, this can only be class Main. Get method_class for main().
    assert(std::string(this->name->get_string()) == std::string("Main"));
    method_class *mainMethod = (method_class *)features->nth(features->first());

    // TODO: add code here to generate the function `int Mainmain()`.
    // Generally what you need to do are:
    // -- setup or create the environment, env, for translating this method
    // -- invoke mainMethod->code(env) to translate the method

    // Create the environment and value printer
    CgenEnvironment env(*ct_stream, this);
    ValuePrinter vp(*ct_stream);

    // Define the function: int Main_main()
    vp.define(op_type(INT32), "Main.main", {});

    // Begin the entry block
    vp.begin_block("entry");

    mainMethod->make_alloca(&env);

    // Generate the code for the main method
    mainMethod->code(&env);
    /**
     * Based on reference codegen for main method, the code should look like:
     *  abort:
     *  call void @abort(  )
     *  unreachable
     */
    // Define the abort block
    vp.begin_block("abort");

    // Call the abort function
    operand abort_res(op_type(VOID), "abort_res");
    vp.call(*env.cur_stream, {}, "abort", true, {}, abort_res);

    // Unreachable
    vp.unreachable();

    // End the block
    vp.end_define();
}

#endif

/*********************************************************************

  CgenEnvironment functions

*********************************************************************/

// Look up a CgenNode given a symbol
CgenNode *CgenEnvironment::type_to_class(Symbol t)
{
    return t == SELF_TYPE ? get_class()
                          : get_class()->get_classtable()->find_in_scopes(t);
}

/*********************************************************************

  APS class methods

    Fill in the following methods to produce code for the
    appropriate expression. You may add or remove parameters
    as you wish, but if you do, remember to change the parameters
    of the declarations in `cool-tree.handcode.h'.

*********************************************************************/

void program_class::cgen(const std::optional<std::string> &outfile)
{
    initialize_constants();
    if (outfile)
    {
        std::ofstream s(*outfile);
        if (!s.good())
        {
            std::cerr << "Cannot open output file " << *outfile << std::endl;
            exit(1);
        }
        class_table = new CgenClassTable(classes, s);
    }
    else
    {
        class_table = new CgenClassTable(classes, std::cout);
    }
}

// Create a method body
void method_class::code(CgenEnvironment *env)
{
    if (cgen_debug)
    {
        std::cerr << "method" << std::endl;
    }

    ValuePrinter vp(*env->cur_stream);
    // TODO: add code here

    op_type i32_type(INT32);
    // vp.define(i32_type, this->name->get_string(), {});

    // vp.begin_block("entry");

    this->expr->make_alloca(env);

    operand res = this->expr->code(env);

    vp.ret(res);

    // vp.end_define();
}

// Codegen for expressions. Note that each expression has a value.

operand assign_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);

    if (cgen_debug)
        std::cerr << "assign" << std::endl;

    operand lhs = this->expr->code(env);
    operand *rhs = env->find_in_scopes(this->name);

    if (lhs.is_empty())
    {
        lhs = const_value(rhs->get_type().get_deref_type(), "0", true);
    }

    vp.store(lhs, *rhs);

    return lhs;
}

operand cond_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    if (cgen_debug)
        std::cerr << "cond" << std::endl;

    operand *result = env->remove_alloca();

    operand cond = this->pred->code(env);

    // Create the blocks
    std::string then_label = env->new_label("then", true);
    std::string else_label = env->new_label("else", true);
    std::string merge_label = env->new_label("ifcont", true);

    // Branch based on the condition
    vp.branch_cond(cond, then_label, else_label);

    // Emit the 'then' code
    vp.begin_block(else_label);
    operand els = this->else_exp->code(env);
    vp.store(els, *result);
    vp.branch_uncond(merge_label);

    vp.begin_block(then_label);
    operand then = this->then_exp->code(env);
    vp.store(then, *result);
    vp.branch_uncond(merge_label);

    vp.begin_block(merge_label);
    operand loaded_result = vp.load(result->get_type().get_deref_type(), *result);

    return loaded_result;
}

operand loop_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    if (cgen_debug)
        std::cerr << "loop" << std::endl;

    std::string header_label = env->new_label("loop", true);
    std::string body_label = env->new_label("loop.body", true);
    std::string end_label = env->new_label("loop.end", true);

    vp.branch_uncond(header_label);

    vp.begin_block(header_label);
    operand cond = this->pred->code(env);
    vp.branch_cond(cond, body_label, end_label);

    vp.begin_block(body_label);
    operand body = this->body->code(env);
    vp.branch_uncond(header_label);

    vp.begin_block(end_label);

    // For MP2 the return value of loop  is i32 0
    return int_value(0);
}

operand block_class::code(CgenEnvironment *env)
{
    operand last_result;

    if (cgen_debug)
        std::cerr << "block" << std::endl;

    /* The following loop  is generated by Copilot */
    for (int i = this->body->first(); this->body->more(i); i = this->body->next(i))
    {
        last_result = this->body->nth(i)->code(env);
    }

    return last_result;
}

operand let_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    if (cgen_debug)
        std::cerr << "let" << std::endl;

    env->open_scope();

    operand *rhs = env->remove_alloca(); // at make_alloca, we add alloca to the queue, so we need to get it popped out
    env->add_binding(this->identifier, rhs);

    operand lhs = this->init->code(env);

    if (lhs.is_empty())
    {
        lhs = const_value(rhs->get_type().get_deref_type(), "0", true);
    }

    // store the value of the rhs into the lhs
    vp.store(lhs, *rhs);

    operand result = this->body->code(env);

    env->close_scope();

    // free the memory allocated for lhs
    delete rhs;

    return result;
}

operand plus_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    operand lhs = this->e1->code(env);
    operand rhs = this->e2->code(env);
    operand result = vp.add(lhs, rhs);

    if (cgen_debug)
        std::cerr << "plus" << std::endl;

    return result;
}

operand sub_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    operand lhs = this->e1->code(env);
    operand rhs = this->e2->code(env);
    operand result = vp.sub(lhs, rhs);

    if (cgen_debug)
        std::cerr << "sub" << std::endl;

    return result;
}

operand mul_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    operand lhs = this->e1->code(env);
    operand rhs = this->e2->code(env);
    operand result = vp.mul(lhs, rhs);

    if (cgen_debug)
        std::cerr << "mul" << std::endl;

    return result;
}

operand divide_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    operand lhs = this->e1->code(env);
    operand rhs = this->e2->code(env);

    if (cgen_debug)
        std::cerr << "div" << std::endl;
    std::string no_abort = env->new_ok_label();
    // if division by zero, abort
    operand zero = int_value(0);
    operand cond = vp.icmp(EQ, rhs, zero);
    vp.branch_cond(cond, "abort", no_abort);

    vp.begin_block(no_abort);
    operand result = vp.div(lhs, rhs);

    return result;
}

operand neg_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    operand rhs = this->e1->code(env);
    operand result = vp.sub(int_value(0), rhs);

    if (cgen_debug)
        std::cerr << "neg" << std::endl;

    return result;
}

operand lt_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    operand lhs = this->e1->code(env);
    operand rhs = this->e2->code(env);
    operand result = vp.icmp(LT, lhs, rhs);

    if (cgen_debug)
        std::cerr << "lt" << std::endl;

    return result;
}

operand eq_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    operand lhs = this->e1->code(env);
    operand rhs = this->e2->code(env);
    operand result = vp.icmp(EQ, lhs, rhs);
    if (cgen_debug)
        std::cerr << "eq" << std::endl;

    return result;
}

operand leq_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    operand lhs = this->e1->code(env);
    operand rhs = this->e2->code(env);
    operand result = vp.icmp(LE, lhs, rhs);

    if (cgen_debug)
        std::cerr << "leq" << std::endl;

    return result;
}

operand comp_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    operand rhs = this->e1->code(env);
    operand result = vp.xor_in(rhs, bool_value(true, true));

    if (cgen_debug)
        std::cerr << "complement" << std::endl;

    return result;
}

operand int_const_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    if (cgen_debug)
        std::cerr << "Integer Constant" << std::endl;

    return int_value(std::stoll(token->get_string()));
}

operand bool_const_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    if (cgen_debug)
        std::cerr << "Boolean Constant" << std::endl;

    return bool_value(this->val, true);
}

operand object_class::code(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    if (cgen_debug)
        std::cerr << "Object" << std::endl;

    operand *rhs = env->find_in_scopes(this->name);

    // emit load instruction
    operand result = vp.load(rhs->get_type().get_deref_type(), *rhs);

    return result;
}

operand no_expr_class::code(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "No_expr" << std::endl;

    return operand();
}

// Retrieve the class tag from an object record.
// src is the object we need the tag from.
// src_class is the CgenNode for the *static* class of the expression.
// You need to look up and return the class tag for it's dynamic value
operand get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env)
{
    // ADD CODE HERE (MP3 ONLY)
    return operand();
}

operand typcase_class::code(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "typecase::code()" << endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    ValuePrinter vp(*env->cur_stream);
    CgenClassTable *ct = env->get_class()->get_classtable();

    string header_label = env->new_label("case.hdr.", false);
    string exit_label = env->new_label("case.exit.", false);

    // Generate code for expression to select on, and get its static type
    operand code_val = expr->code(env);
    operand expr_val = code_val;
    string code_val_t = code_val.get_typename();
    op_type join_type = env->type_to_class(type)->get_type_name();
    CgenNode *cls = env->type_to_class(expr->get_type());

    // Check for case on void, which gives a runtime error
    if (code_val.get_type().get_id() != INT32 &&
        code_val.get_type().get_id() != INT1)
    {
        op_type bool_type(INT1), empty_type;
        null_value null_op(code_val.get_type());
        operand icmp_result(bool_type, env->new_name());
        vp.icmp(*env->cur_stream, EQ, code_val, null_op, icmp_result);
        string ok_label = env->new_ok_label();
        vp.branch_cond(icmp_result, "abort", ok_label);
        vp.begin_block(ok_label);
    }

    operand tag = get_class_tag(expr_val, cls, env);
    vp.branch_uncond(header_label);
    string prev_label = header_label;
    vp.begin_block(header_label);

    env->branch_operand = alloca_op;

    std::vector<operand> values;
    env->next_label = exit_label;

    // Generate code for the branches
    for (int i = ct->get_num_classes() - 1; i >= 0; --i)
    {
        for (auto case_branch : cases)
        {
            if (i == ct->find_in_scopes(case_branch->get_type_decl())->get_tag())
            {
                string prefix = string("case.") + itos(i) + ".";
                string case_label = env->new_label(prefix, false);
                vp.branch_uncond(case_label);
                vp.begin_block(case_label);
                operand val = case_branch->code(expr_val, tag, join_type, env);
                values.push_back(val);
            }
        }
    }

    // Abort if there was not a branch covering the actual type
    vp.branch_uncond("abort");

    // Done with case expression: get final result
    env->new_label("", true);
    vp.begin_block(exit_label);
    operand final_result(alloca_type, env->new_name());
    alloca_op.set_type(alloca_op.get_type().get_ptr_type());
    vp.load(*env->cur_stream, alloca_op.get_type().get_deref_type(),
            alloca_op, final_result);
    alloca_op.set_type(alloca_op.get_type().get_deref_type());

    if (cgen_debug)
        cerr << "Done typcase::code()" << endl;
    return final_result;
#endif
}

// Handle one branch of a Cool case expression.
// If the source tag is >= the branch tag
// and <= (max child of the branch class) tag,
// then the branch is a superclass of the source.
// See the MP3 handout for more information about our use of class tags.
operand branch_class::code(operand expr_val, operand tag, op_type join_type,
                           CgenEnvironment *env)
{
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    operand empty;
    ValuePrinter vp(*env->cur_stream);
    if (cgen_debug)
        cerr << "In branch_class::code()" << endl;

    CgenNode *cls = env->get_class()->get_classtable()->find_in_scopes(type_decl);
    int my_tag = cls->get_tag();
    int max_child = cls->get_max_child();

    // Generate unique labels for branching into >= branch tag and <= max child
    string sg_label =
        env->new_label(string("src_gte_br") + "." + itos(my_tag) + ".", false);
    string sl_label =
        env->new_label(string("src_lte_mc") + "." + itos(my_tag) + ".", false);
    string exit_label =
        env->new_label(string("br_exit") + "." + itos(my_tag) + ".", false);

    int_value my_tag_val(my_tag);
    op_type old_tag_t(tag.get_type()), i32_t(INT32);
    tag.set_type(i32_t);

    // Compare the source tag to the class tag
    operand icmp_result = vp.icmp(LT, tag, my_tag_val);
    vp.branch_cond(icmp_result, exit_label, sg_label);
    vp.begin_block(sg_label);
    int_value max_child_val(max_child);

    // Compare the source tag to max child
    operand icmp2_result = vp.icmp(GT, tag, max_child_val);
    vp.branch_cond(icmp2_result, exit_label, sl_label);
    vp.begin_block(sl_label);
    tag.set_type(old_tag_t);

    // Handle casts of *arbitrary* types to Int or Bool.  We need to:
    // (a) cast expr_val to boxed type (struct Int* or struct Bool*)
    // (b) unwrap value field from the boxed type
    // At run-time, if source object is not Int or Bool, this will never
    // be invoked (assuming no bugs in the type checker).
    if (cls->get_type_name() == "Int")
    {
        expr_val = conform(expr_val, op_type(cls->get_type_name(), 1), env);
    }
    else if (cls->get_type_name() == "Bool")
    {
        expr_val = conform(expr_val, op_type(cls->get_type_name(), 1), env);
    }

    // If the case expression is of the right type, make a new local
    // variable for the type-casted version of it, which can be used
    // within the expression to evaluate on this branch.
    operand conf_result = conform(expr_val, alloca_type, env);
    vp.store(conf_result, alloca_op);
    env->open_scope();
    env->add_binding(name, alloca_op);

    // Generate code for the expression to evaluate on this branch
    operand val = conform(expr->code(env), join_type.get_ptr_type(), env);
    operand conformed = conform(val, env->branch_operand.get_type(), env);
    env->branch_operand.set_type(env->branch_operand.get_type().get_ptr_type());
    // Store result of the expression evaluated
    vp.store(conformed, env->branch_operand);
    env->branch_operand.set_type(env->branch_operand.get_type().get_deref_type());
    env->close_scope();
    // Branch to case statement exit label
    vp.branch_uncond(env->next_label);
    vp.begin_block(exit_label);
    if (cgen_debug)
        cerr << "Done branch_class::code()" << endl;
    return conformed;
#endif
}

void typcase_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "typecase::make_alloca()" << endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    ValuePrinter vp(*env->cur_stream);
    expr->make_alloca(env);

    // Get result type of case expression
    branch_class *b = (branch_class *)cases->nth(cases->first());
    string case_result_type = b->get_expr()->get_type()->get_string();
    if (case_result_type == "SELF_TYPE")
        case_result_type = env->get_class()->get_type_name();

    // Allocate space for result of case expression
    alloca_type = op_type(case_result_type, 1);
    alloca_op = operand(alloca_type, env->new_name());
    vp.alloca_mem(*env->cur_stream, alloca_type, alloca_op);

    for (auto case_branch : cases)
    {
        case_branch->make_alloca(env);
    }
#endif
}

void branch_class::make_alloca(CgenEnvironment *env)
{
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    ValuePrinter vp(*env->cur_stream);
    if (cgen_debug)
        cerr << "In branch_class::make_alloca()" << endl;

    CgenNode *cls = env->get_class()->get_classtable()->find_in_scopes(type_decl);
    alloca_type = op_type(cls->get_type_name(), 1);

    if (cls->get_type_name() == "Int")
    {
        alloca_type = op_type(INT32);
    }
    else if (cls->get_type_name() == "Bool")
    {
        alloca_type = op_type(INT1);
    }

    alloca_op = vp.alloca_mem(alloca_type);

    expr->make_alloca(env);

    if (cgen_debug)
        cerr << "Done branch_class::make_alloca()" << endl;
#endif
}

//*****************************************************************
// The next few functions are for node types not supported in Phase 1
// but these functions must be defined because they are declared as
// methods via the Expression_SHARED_EXTRAS hack.
//*****************************************************************

operand static_dispatch_class::code(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "static dispatch" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here and replace `return operand()`
    return operand();
#endif
}

operand string_const_class::code(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "string_const" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here and replace `return operand()`
    return operand();
#endif
}

operand dispatch_class::code(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "dispatch" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here and replace `return operand()`
    return operand();
#endif
}

// Handle a Cool case expression (selecting based on the type of an object)
operand typcase_class::code(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "typecase::code()" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here and replace `return operand()`
    return operand();
#endif
}

operand new__class::code(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "newClass" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here and replace `return operand()`
    return operand();
#endif
}

operand isvoid_class::code(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "isvoid" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here and replace `return operand()`
    return operand();
#endif
}

// Create the LLVM Function corresponding to this method.
void method_class::layout_feature(CgenNode *cls)
{
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

// Handle one branch of a Cool case expression.
// If the source tag is >= the branch tag
// and <= (max child of the branch class) tag,
// then the branch is a superclass of the source.
// See the MP3 handout for more information about our use of class tags.
operand branch_class::code(operand expr_val, operand tag, op_type join_type,
                           CgenEnvironment *env)
{
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here and replace `return operand()`
    return operand();
#endif
}

// Assign this attribute a slot in the class structure
void attr_class::layout_feature(CgenNode *cls)
{
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

void attr_class::code(CgenEnvironment *env)
{
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

/*
 * Definitions of make_alloca
 */

/**
 * @brief at MP2, only support Int and Bool type
 */
op_type_id _optype_name_to_op_type_id(const std::string &name)
{
    if (name == "Int")
    {
        return INT32;
    }
    else if (name == "Bool")
    {
        return INT1;
    }
    else
    {
        return VOID;
    }
}

void assign_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "assign" << std::endl;

    // TODO: add code here
    this->expr->make_alloca(env);
}

void cond_class::make_alloca(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);
    if (cgen_debug)
        std::cerr << "cond" << std::endl;

    // MP2 assumes the branches to be of the same type
    op_type _type = op_type(_optype_name_to_op_type_id(this->then_exp->get_type()->get_string()));
    operand *_alloca = new operand(_type.get_ptr_type(), env->new_name());
    vp.alloca_mem(*env->cur_stream, _type, *_alloca); // emit an alloca command
    env->add_alloca(_alloca);

    this->pred->make_alloca(env);
    this->then_exp->make_alloca(env);
    this->else_exp->make_alloca(env);
}

void loop_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "loop" << std::endl;

    this->pred->make_alloca(env);
    this->body->make_alloca(env);
}

void block_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "block" << std::endl;

    for (int i = this->body->first(); this->body->more(i); i = this->body->next(i))
    {
        this->body->nth(i)->make_alloca(env);
    }
}

void let_class::make_alloca(CgenEnvironment *env)
{
    ValuePrinter vp(*env->cur_stream);

    if (cgen_debug)
        std::cerr << "let" << std::endl;

    env->open_scope();
    operand *_alloca = new operand(op_type(_optype_name_to_op_type_id(this->type_decl->get_string())).get_ptr_type(), env->new_name());
    vp.alloca_mem(*env->cur_stream, op_type(_optype_name_to_op_type_id(this->type_decl->get_string())), *_alloca); // emit an alloca command
    env->add_alloca(_alloca);
    this->init->make_alloca(env);
    this->body->make_alloca(env);
    env->close_scope();
}

void plus_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "plus" << std::endl;

    this->e1->make_alloca(env);
    this->e2->make_alloca(env);
}

void sub_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "sub" << std::endl;

    this->e1->make_alloca(env);
    this->e2->make_alloca(env);
}

void mul_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "mul" << std::endl;

    this->e1->make_alloca(env);
    this->e2->make_alloca(env);
}

void divide_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "div" << std::endl;

    this->e1->make_alloca(env);
    this->e2->make_alloca(env);
}

void neg_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "neg" << std::endl;

    this->e1->make_alloca(env);
}

void lt_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "lt" << std::endl;

    this->e1->make_alloca(env);

    this->e2->make_alloca(env);
}

void eq_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "eq" << std::endl;

    this->e1->make_alloca(env);

    this->e2->make_alloca(env);
}

void leq_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "leq" << std::endl;

    this->e1->make_alloca(env);

    this->e2->make_alloca(env);
}

void comp_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "complement" << std::endl;

    this->e1->make_alloca(env);
}

void int_const_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "Integer Constant" << std::endl;
}

void bool_const_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "Boolean Constant" << std::endl;
}

void object_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "Object" << std::endl;
}

void no_expr_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "No_expr" << std::endl;
}

void static_dispatch_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "static dispatch" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
        // TODO: add code here
#endif
}

void string_const_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "string_const" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
        // TODO: add code here
#endif
}

void dispatch_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "dispatch" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
        // TODO: add code here
#endif
}

void typcase_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "typecase::make_alloca()" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
        // TODO: add code here
#endif
}

void new__class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "newClass" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
        // TODO: add code here
#endif
}

void isvoid_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "isvoid" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
        // TODO: add code here
#endif
}

void branch_class::make_alloca(CgenEnvironment *env)
{
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

void method_class::make_alloca(CgenEnvironment *env) { return; }

void attr_class::make_alloca(CgenEnvironment *env)
{
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

#ifdef MP3
// conform - If necessary, emit a bitcast or boxing/unboxing operations
// to convert an object to a new type. This can assume the object
// is known to be (dynamically) compatible with the target type.
// It should only be called when this condition holds.
// (It's needed by the supplied code for typecase)
operand conform(operand src, op_type type, CgenEnvironment *env)
{
    // TODO: add code here
    return operand();
}
#endif
