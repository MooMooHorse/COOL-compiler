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

/**
 * @brief MP2 typeName to op_type_id
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
    *ct_stream << R"(declare %Object* @Object_new()
declare %Object* @Object_abort(%Object*)
declare %String* @Object_type_name(%Object*)
declare %Object* @Object_copy(%Object*)
declare %IO* @IO_new()
declare %IO* @IO_out_string(%IO*, %String*)
declare %IO* @IO_out_int(%IO*, i32)
declare %String* @IO_in_string(%IO*)
declare i32 @IO_in_int(%IO*)
declare %String* @String_new()
declare i32 @String_length(%String*)
declare %String* @String_concat(%String*, %String*)
declare %String* @String_substr(%String*, i32, i32)
declare %Int* @Int_new()
declare void @Int_init(%Int*, i32)
declare %Bool* @Bool_new()
declare void @Bool_init(%Bool*, i1)
)";

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
    c->code_class();
    for (auto child : c->get_children())
    {
        code_classes(child);
    }
}
#endif

// Create global definitions for constant Cool objects
void CgenClassTable::code_constants()
{
#ifdef MP3
    // TODO: add code here
    stringtable.code_string_table(*ct_stream, this);
#endif
}

// Create LLVM entry point. This function will initiate our Cool program
// by generating the code to execute (new Main).main()
//
void CgenClassTable::code_main()
{
    /** MP2
         Equivalent LR code:
            @.str = internal constant [25 x i8] c"Main.main() returned %d\n"

            define i32 @main() {
            entry:
                %tmp.0 = call i32 @Main_main( )
                %tmp.1 = getelementptr [25 x i8], [25 x i8]* @.str, i32 0, i32 0
                %tmp.2 = call i32(i8*, ... ) @printf(i8* %tmp.1, i32 %tmp.0)
                ret i32 0
            }
        MP3
        define i32 @main() {
        entry:
            %main.obj = call %Main*() @Main_new( )
            %main.retval = call i32(%Main*) @Main.main( %Main* %main.obj )
            ret i32 0
        }
    **/
    ValuePrinter vp(*ct_stream);
    op_type i32_type(INT32);
    vp.define(i32_type, "main", {});
    vp.begin_block("entry");
    
#ifdef MP3
    operand main_obj = vp.call({}, op_type("Main", 1), "Main_new", true, {});
    vp.call(
        {op_type("Main", 1)},
        i32_type,
        "Main_main",
        true,
        {main_obj}
    );

    vp.ret(int_value(0));
    vp.end_define();
// MP3
#else
// MP2
// Get the address of the string "Main_main() returned %d\n" using
// getelementptr

// Call printf with the string address of "Main_main() returned %d\n"
    op_arr_type i8_arr_type(INT8, 25);
    const_value main_printf_string(i8_arr_type, "Main.main() returned %d\n", true);
    global_value main_printf_string_global(i8_arr_type.get_ptr_type(), "main.printout.str");
    operand str_addr(op_type(INT8_PTR), "tpm"); // this is to make the output exactly match the reference output
    // Step 1: Define the constant string for "Main.main() returned %d\n"

    vp.init_constant("main.printout.str", main_printf_string);

    // Step 2: Define the main function

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
    ValuePrinter vp(s);
    std::string lit_name = "str." + std::to_string(this->index);
    std::string obj_name = "String." + std::to_string(this->index);

    vp.init_constant(lit_name, // constant name
        const_value( // constant value
            op_arr_type(INT8, this->str.length() + 1),
            this->str,
            true
        )
    );

    vp.init_struct_constant(
        global_value(op_type("String"), obj_name), // constant def
        {op_type("_String_vtable", 1), op_type(INT8_PTR)}, // struct types
        { // struct values
            const_value(op_type("_String_vtable", 1), "@_String_vtable_prototype", false),
            const_value(op_arr_type(INT8, this->str.length() + 1), "@" + lit_name, false)
        }
    );
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
    ValuePrinter vp(*ct_stream);

    vp.init_constant("str." + this->name->get_string(), const_value(op_arr_type(INT8, this->name->get_string().length() + 1), this->name->get_string(), true));

    // Define Type for the class (vtable ptr  + attributes)
    op_type vtable_ptr_type = op_type(this->get_vtable_type_name(), 1);
    std::vector<op_type> obj_types;
    obj_types.push_back(vtable_ptr_type);
    for(auto attr: this->attr_table) {
        AttrEntry* attr_entry = dynamic_cast<AttrEntry*>(attr);
        obj_types.push_back(attr_entry->type);
    }
    vp.type_define(this->name->get_string(), obj_types);

    // Define Vtable type
    std::vector<op_type> vtable_types;
    for(auto entry: this->vtable) {
        if(dynamic_cast<MethodEntry*>(entry)) {
            MethodEntry* method_entry = dynamic_cast<MethodEntry*>(entry);
            std::vector<op_type> func_arg_types;
            for(const operand& arg: method_entry->args) {
                func_arg_types.push_back(arg.get_type());
            }
            vtable_types.push_back(op_func_type(method_entry->ret_type, func_arg_types));
        } else if (dynamic_cast<ConstEntry*>(entry)) {
            ConstEntry* const_entry = dynamic_cast<ConstEntry*>(entry);
            vtable_types.push_back(const_entry->type);
        } else{
            std::cerr << "Unknown entry type in vtable" << std::endl;
        }
    }
    vp.type_define(this->get_vtable_type_name(), vtable_types);

    // Define Vtable (prototype)
    std::vector<const_value> vtable_vals;
    for(auto entry: this->vtable) {
        if(dynamic_cast<MethodEntry*>(entry)) {
            MethodEntry* method_entry = dynamic_cast<MethodEntry*>(entry);
            vtable_vals.push_back(method_entry->init);
        } else if (dynamic_cast<ConstEntry*>(entry)) {
            ConstEntry* const_entry = dynamic_cast<ConstEntry*>(entry);
            vtable_vals.push_back(const_entry->value);
        } else{
            std::cerr << "Unknown entry type in vtable" << std::endl;
        }
    }

    vp.init_struct_constant(
        global_value(op_type(this->get_vtable_type_name()), this->get_vtable_name()),
        vtable_types, vtable_vals
    );

#endif
}

#ifdef MP3


int CgenNode::get_vtable_entry(Symbol name) {
    // std::cerr << "get_vtable_entry: " << name->get_string() << std::endl;
    for (int i = 0; i < (int)this->vtable.size(); i++) {
        std::cerr << vtable[i]->name << std::endl;
        if (vtable[i]->name == name->get_string()) {
            return i;
        }
    }
    return -1;
}

op_type symbol2op_type(Symbol s, CgenNode* _class) {
    if(s->get_string() == "int") { // prim_int
        return op_type(INT32);
    } else if (s->get_string() == "Int") { // AST
        return op_type(INT32);
    } else if (s->get_string() == "bool") { // prim_bool
        return op_type(INT1);
    } else if (s->get_string() == "Bool") { // AST
        return op_type(INT1);
    } else if (s->get_string() == "SELF_TYPE") {
        return op_type(_class->get_type_name()).get_ptr_type();
    } else if (s->get_string() == "sbyte*") { // prim_string
        return op_type(INT8_PTR);
    } else if (s->get_string() == "sbyte") { 
        return op_type(INT8);
    } else { // Pass by Reference for other types
        return op_type(s->get_string()).get_ptr_type();
    }
}


CgenNode* CgenEnvironment::op_type2class(op_type type) {
    while(type.is_ptr()) {
      type = type.get_deref_type();
    }
    if(type.get_id() == INT32) {
      return this->type_to_class(Int);
    } else if(type.get_id() == INT1) {
      return this->type_to_class(Bool);
    } 
    // std::cerr << "op_type2class: " << type.get_name() << std::endl;
    Symbol class_type = idtable.lookup_string(type.get_name().substr(1));
    return this->type_to_class(class_type);
}

// Retrieve the class tag from an object record.
// src is the object we need the tag from.
// src_class is the CgenNode for the *static* class of the expression.
// You need to look up and return the class tag for it's dynamic value
operand get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env)
{
    // ADD CODE HERE (MP3 ONLY)
    ValuePrinter vp(*env->cur_stream);

    operand vtable_ptr_addr = vp.getelementptr(
        src.get_type().get_deref_type(),
        src,
        int_value(0),
        int_value(0),
        op_type(src_cls->get_vtable_type_name(), 2)
    );

    operand vtable_ptr = vp.load(
        op_type(src_cls->get_vtable_type_name(), 1),
        vtable_ptr_addr
    );

    return vtable_ptr;
}

operand default_val(op_type type, ValuePrinter* vp) {
    switch (type.get_id()) {
    case INT32:
        return const_value(type, "0", false);
    case INT1:
        return const_value(type, "0", false);
    case INT8_PTR:
        return const_value(type, "null", false);
    default: // default to null
        return vp->bitcast(null_value(op_type(INT8_PTR)), type);
    }
}

// Laying out the features involves creating a Function for each method
// and assigning each attribute a slot in the class structure.
void CgenNode::layout_features()
{
    /**
     * vtable for object
     *  struct _Object_vtable {
     *   int tag;
     *   int size;
     *   const char *name;
     *   Object *(*abort_object)(Object *self);
     *   String *(*type_name_object)(Object *self);
     *   Object *(*copy_object)(Object *self);
     *   .... // self-defined methods
     *   };
     * 
     * vtable for other classes
     * struct _ClassName_vtable {
     *   int tag;
     *   int size;
     *   const char *name;
     *   .... // methods inherited from parent class
     *   .... // self-defined methods
     * };
     */

    // install tag, size and name
    op_type i32_type(INT32);
    op_type new_method_type(this->get_type_name() + "* () ", 1);
    op_type class_name_str_type(INT8_PTR);
    const_value class_name_str(op_arr_type(INT8, this->name->get_string().length() + 1), "@str." + this->name->get_string(), true);

    ConstEntry* tag_entry = new ConstEntry("tag", i32_type, int_value(this->tag));
    ConstEntry* size_entry = new ConstEntry("size", i32_type, const_value(i32_type, "ptrtoint (%" + this->name->get_string() + "* getelementptr (%" + this->name->get_string() + ", %" + this->name->get_string() + "* null, i32 1) to i32)", false)); // global constant because other classes may use it
    ConstEntry* name_entry = new ConstEntry("name", class_name_str_type, class_name_str);

    vtable.push_back(tag_entry);
    vtable.push_back(size_entry);
    vtable.push_back(name_entry);

    // install new method
    ConstEntry* new_entry = new ConstEntry("new", 
        new_method_type, 
        const_value(new_method_type, "@" + this->get_type_name() + "_new", false)
    );

    vtable.push_back(new_entry);

    // iterate through parent's vtable & attr_vtable and copy it to current class's vtable
    for (int i = this->DEFAULT_METHODS; i < (int)parentnd->vtable.size(); i++) {
        vtable.push_back(parentnd->vtable[i]);
    }
    for (int i = 0; i < (int)parentnd->attr_table.size(); i++) {
        attr_table.push_back(parentnd->attr_table[i]);
    }


    for(int _feature = features->first(); features->more(_feature); _feature = features->next(_feature)) {
        Feature feature = features->nth(_feature);
        if(dynamic_cast<method_class*>(feature)) {
            method_class* method = dynamic_cast<method_class*>(feature);
            std::string global_method_name = this->get_type_name() + "_" + method->get_name()->get_string();

            const_value init(op_type(global_method_name),  "@" + global_method_name, false);
            std::vector<operand> func_args = {operand(op_type(this->get_type_name(), 1), "self")};
            
            Formals formals = method->get_formals();
            for (int _formal = formals->first(); formals->more(_formal); _formal = formals->next(_formal)) {
                Formal formal = formals->nth(_formal);
                func_args.push_back(operand(
                    symbol2op_type(formal->get_type_decl(), this),
                    formal->get_name()->get_string())
                );
            }

            VtableEntry* entry = new MethodEntry(method, func_args, symbol2op_type(method->get_return_type(), this), init);
            int v_ind = get_vtable_entry(method->get_name());
            if (-1 == v_ind) {
                vtable.push_back(entry);
            } else {
                delete vtable[v_ind];
                vtable[v_ind] = entry;
            }
        } else if(dynamic_cast<attr_class*>(feature)) {
            attr_class* attr = dynamic_cast<attr_class*>(feature);
            VtableEntry* entry = new AttrEntry(attr, symbol2op_type(attr->get_type_decl(), this), attr->get_init());
            attr_table.push_back(entry);
        }
    }
    // std::cerr << "Class" << this->name->get_string() << " vtable size: " << vtable.size() << std::endl;
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
    CgenEnvironment env(*ct_stream, this);
    ValuePrinter vp(*ct_stream);

    this->code_init_function(&env);
    
    // new function
    vp.define(op_type(this->get_type_name(), 1), this->get_type_name() + "_new", {});

    std::string okay_label = env.new_ok_label();
    
    vp.begin_block("entry");

    operand self_ptr = vp.alloca_mem(op_type(this->get_type_name(), 1));
    env.add_binding(self, &self_ptr);
    
    operand size_ptr = vp.getelementptr(
        this->get_vtable_type_name(),
        const_value(op_type(this->get_vtable_type_name(), 1), "@" + this->get_vtable_name(), true),
        int_value(0),
        int_value(1),
        op_type(INT32_PTR)
    );
    operand size = vp.load(op_type(INT32), size_ptr);
    operand casted_new_obj_ptr = vp.bitcast(
        vp.malloc_mem(size),
        op_type(this->get_type_name(), 1)
    );
    vp.branch_cond(
        vp.icmp(EQ, casted_new_obj_ptr, const_value(op_type("null"), "null", false)), 
        "abort", 
        okay_label 
    );
    vp.begin_block(okay_label);
    // assign value to vtable ptr in the new object
    operand new_obj_vtable_ptr = vp.getelementptr(
        this->get_type_name(),
        casted_new_obj_ptr,
        int_value(0),
        int_value(0),
        op_type(this->get_vtable_type_name(), 2)
    );

    vp.store(
        global_value(
            op_type(this->get_vtable_type_name(), 1),
            this->get_vtable_name()
        ),
        new_obj_vtable_ptr
    );

    vp.store(casted_new_obj_ptr, self_ptr);
    
    for(auto entry: this->attr_table) {
        if(dynamic_cast<AttrEntry*>(entry)) {
            AttrEntry* attr_entry = dynamic_cast<AttrEntry*>(entry);
            attr_entry->attr->make_alloca(&env); // for init->code
        }
    }

    int attr_offset = 1; // first one is vtable ptr
    for(auto entry: this->attr_table) {
        if(dynamic_cast<AttrEntry*>(entry)) {
            AttrEntry* attr_entry = dynamic_cast<AttrEntry*>(entry);
            operand val = attr_entry->init->code(&env);
            operand attr_ptr = vp.getelementptr(
                this->get_type_name(),
                casted_new_obj_ptr,
                int_value(0),
                int_value(attr_offset++),
                attr_entry->type.get_ptr_type()
            );
            if(attr_entry->init->no_code()) {
                vp.store(default_val(attr_entry->type, &vp), attr_ptr);
            } else {
                vp.store(conform(val, attr_entry->type, &env), attr_ptr);
            }
        }
    }

    vp.ret(casted_new_obj_ptr);

    vp.begin_block("abort");
    vp.call({}, op_type(VOID), "abort", true, {});
    vp.unreachable();
    vp.end_define();

}   

void CgenNode::code_init_function(CgenEnvironment *env)
{
    // TODO: add code here
    ValuePrinter vp(*env->cur_stream);

    for(auto entry: this->vtable) {
        if(dynamic_cast<MethodEntry*>(entry)) {
            MethodEntry* method_entry = dynamic_cast<MethodEntry*>(entry);
            method_entry->method->code(env);
        }
    }

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

    // TODO: add code here
    ValuePrinter vp(*env->cur_stream);
    op_type i32_type(INT32);
    std::string class_name = env->get_class()->get_type_name();
    std::vector<operand> args({operand(op_type(class_name, 1), "self")});
    env->open_scope();

    std::vector<operand*> stack_ptr;
    std::vector<Symbol> arg_names({self});
    int arg_index = 0;

    for (int i = formals->first(); formals->more(i); i = formals->next(i))
    {
        Formal formal = formals->nth(i);
        args.push_back(operand(symbol2op_type(formal->get_type_decl(), env->get_class()), formal->get_name()->get_string()));
        arg_names.push_back(formal->get_name());
    }
    // std::cerr << class_name << " " << this->name->get_string() << std::endl;

    vp.define(symbol2op_type(this->return_type, env->get_class()), class_name + "_" + this->name->get_string(), args);

    for(const operand& arg: args) {
        operand ret = vp.alloca_mem(arg.get_type());
        stack_ptr.push_back(new operand(ret));
        env->add_binding(arg_names[arg_index++], stack_ptr.back());
        vp.store(arg, ret);
    } 

    this->expr->make_alloca(env);

    operand res = this->expr->code(env);

    if(res.is_empty()) {
        vp.ret(default_val(symbol2op_type(this->return_type, env->get_class()), &vp));
    } else {
        vp.ret(res);
    }

    
    vp.begin_block("abort");
    vp.call({}, op_type(VOID), "abort", true, {});
    vp.unreachable();
    vp.end_define();

    while (!stack_ptr.empty()) {
        delete stack_ptr.back();
        stack_ptr.pop_back();
    }

    env->close_scope();

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

using std::string;
using std::cerr;
using std::endl;


#ifdef WORKING_ON_COND


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

#endif

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
    int method_offset = -1;
    ValuePrinter vp(*env->cur_stream);

    operand obj = expr->code(env);

    if(obj.get_type().get_id() == INT1 || obj.get_type().get_id() == INT32) {
        obj = conform(obj, op_type(obj.get_type().get_name(), 1), env);
    } else {
        std::string okay_label = env->new_ok_label();
        operand check_null = vp.icmp(EQ, obj, null_value(obj.get_type()));
        vp.branch_cond(check_null, "abort", okay_label);
        vp.begin_block(okay_label);
    }


    std::vector<operand> args({obj});
    std::vector<op_type> arg_types({obj.get_type()});
    for (int i = actual->first(); actual->more(i); i = actual->next(i))
    {
        operand arg = actual->nth(i)->code(env);
        args.push_back(arg);
    }

    CgenNode* _class = env->op_type2class(obj.get_type());
    CgenNode::MethodEntry* method = NULL;

    if(~method_offset) {
        method = dynamic_cast<CgenNode::MethodEntry*>(_class->vtable[method_offset]);
    }

    if(!method) {
        std::cerr << "Method not found: " << this->name->get_string() << std::endl;
        exit(1);
    }

    for(int i = 0; i < (int) args.size(); i++) {
        args[i] = conform(args[i], method->args[i].get_type(), env);
        arg_types.push_back(args[i].get_type());
    }

    std::string real_func_name = _class->get_type_name() + "_" + method->method->get_name()->get_string();

    operand res = vp.call(arg_types, method->ret_type, real_func_name, true, args);

    return res;
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
    int index = stringtable.lookup_string(this->token->get_string())->get_index();
    return global_value(
        op_type("String", 1),
        "String." + std::to_string(index)
    );
#endif
}

operand dispatch_class::code(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "dispatch" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // dynamic dispatch
    int method_offset = -1;
    ValuePrinter vp(*env->cur_stream);
    operand obj = this->expr->code(env);
    // std::cerr << "Method found: " << this->name->get_string() << std::endl;
    CgenNode* _class = env->op_type2class(obj.get_type());

    
    method_offset = _class->get_vtable_entry(this->name);
    CgenNode::MethodEntry* method = NULL;
    if(~method_offset) {
        method = dynamic_cast<CgenNode::MethodEntry*>(_class->vtable[method_offset]);
    }

    if(!method) {
        std::cerr << "Method not found: " << this->name->get_string() << std::endl;
        exit(1);
    }


    if(obj.get_type().get_id() == INT1 || obj.get_type().get_id() == INT32) {
        obj = conform(obj, op_type(obj.get_type().get_name(), 1), env);
    } else {
        std::string okay_label = env->new_ok_label();
        operand check_null = vp.icmp(EQ, obj, null_value(obj.get_type()));
        vp.branch_cond(check_null, "abort", okay_label);
        vp.begin_block(okay_label);
    }

    operand vtable_ptr = get_class_tag(obj, _class, env); // CRITICAL STEP: dynamic vtable lookup

    std::vector<operand> args({obj});
    std::vector<op_type> arg_types;
    for (int i = this->actual->first(); this->actual->more(i); i = this->actual->next(i))
    {
        operand arg = this->actual->nth(i)->code(env);
        args.push_back(arg);
    }

    for(int i = 0; i < (int) args.size(); i++) {
        args[i] = conform(args[i], method->args[i].get_type(), env);
        arg_types.push_back(args[i].get_type());
    }

    op_func_ptr_type dynamic_called_method_type = op_func_ptr_type(method->ret_type, arg_types);

    operand method_ptr = vp.getelementptr(
        op_type(_class->get_vtable_type_name()),
        vtable_ptr,
        int_value(0),
        int_value(method_offset),
        dynamic_called_method_type
    );


    // The thing is the load is not supporting op_func_ptr_type
    operand dynamic_called_method(dynamic_called_method_type.get_deref_type(), env->new_name());
    vp.load(*env->cur_stream, dynamic_called_method.get_type(), method_ptr, dynamic_called_method);


    operand res = vp.call(arg_types, method->ret_type, dynamic_called_method.get_name().substr(1), false, args);

    return res;
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
    ValuePrinter vp(*env->cur_stream);
    CgenNode* _class;
    if(this->get_type() == SELF_TYPE) {
        _class = env->get_class();
    } else {
        _class = env->type_to_class(this->type_name);
    }

    return vp.call(
        {},
        op_type(_class->get_type_name(), 1),   
        _class->get_type_name() + "_new",
        true,
        {}
    );
#endif
}

operand isvoid_class::code(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "isvoid" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    ValuePrinter vp(*env->cur_stream);

    operand val = this->e1->code(env);

    if(!val.get_type().is_ptr()) {
        return bool_value(false, true);
    }

    return vp.icmp(EQ, val, null_value(val.get_type()));
#endif
}

// Create the LLVM Function corresponding to this method.
void method_class::layout_feature(CgenNode *cls)
{
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // won't do anything here, did it in the layout()   
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
    
    // won't do anything here, did it in the layout()   
#endif
}

void attr_class::code(CgenEnvironment *env)
{
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
    // wont't do anything here
#endif
}

/*
 * Definitions of make_alloca
 */



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
    operand *_alloca = new operand(symbol2op_type(this->type_decl, env->get_class()).get_ptr_type(), env->new_name());
    vp.alloca_mem(*env->cur_stream, op_type(symbol2op_type(this->type_decl, env->get_class())), *_alloca); // emit an alloca command
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
#endif
}

void isvoid_class::make_alloca(CgenEnvironment *env)
{
    if (cgen_debug)
        std::cerr << "isvoid" << std::endl;
#ifndef MP3
    assert(0 && "Unsupported case for phase 1");
#else
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
    this->init->make_alloca(env);
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
    if(src.get_type().get_name() == type.get_name()) {
        return src;
    }

    ValuePrinter vp(*env->cur_stream);

    if(src.get_type().is_ptr() && type.is_ptr()) {
        return vp.bitcast(src, type);
    }

    // boxing
    if(src.get_type().is_ptr() && src.get_type().is_int_object() && type.get_id() == INT32) {
        operand dest_ptr = vp.getelementptr(
            src.get_type().get_deref_type(),
            src,
            int_value(0),
            int_value(1),
            {INT32_PTR}
        );
        return vp.load(type, dest_ptr);
    }

    if(src.get_type().is_ptr() && src.get_type().is_bool_object() && type.get_id() == INT1) {
        operand dest_ptr = vp.getelementptr(
            src.get_type().get_deref_type(),
            src,
            int_value(0),
            int_value(1),
            {INT1_PTR}
        );
        return vp.load(type, dest_ptr);
    }

    // unboxing
    if(!src.get_type().is_ptr() && src.get_type().get_id() == INT32 && type.is_int_object()) {
        operand dest_obj = vp.alloca_mem(type);
        vp.call(
            {op_type(INT32).get_ptr_type(), op_type(INT32)},
            op_type(VOID),
            "Int_init",
            true,
            {dest_obj, src}
        );
        return dest_obj;
    }

    if(!src.get_type().is_ptr() && src.get_type().get_id() == INT1 && type.is_bool_object()) {
        operand dest_obj = vp.alloca_mem(type);
        vp.call(
            {op_type(INT1).get_ptr_type(), op_type(INT1)},
            op_type(VOID),
            "Bool_init",
            true,
            {dest_obj, src}
        );
        return dest_obj;
    }

    std::cerr << "conform error" << std::endl;

    return operand();
}
#endif
