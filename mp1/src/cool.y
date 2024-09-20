/*
 *  cool.y
 *              Parser definition for the COOL language.
 *
 */
%{
#include <iostream>
#include "cool_tree.h"
#include "utils.h"

/* Add your own C declarations here */

/************************************************************************/
/*                DONT CHANGE ANYTHING IN THIS SECTION                  */

extern int yylex();           /* the entry point to the lexer  */
extern int curr_lineno;
extern std::string curr_filename;
Program ast_root;            /* the result of the parse  */
int omerrs = 0;              /* number of errors in lexing and parsing */

/*
   The parser will always call the yyerror function when it encounters a parse
   error. The given yyerror implementation (see below) justs prints out the
   location in the file where the error was found. You should not change the
   error message of yyerror, since it will be used for grading puproses.
*/
void yyerror(const char *s);

/*
   The VERBOSE_ERRORS flag can be used in order to provide more detailed error
   messages. You can use the flag like this:

     if (VERBOSE_ERRORS)
       fprintf(stderr, "semicolon missing from end of declaration of class\n");

   By default the flag is set to 0. If you want to set it to 1 and see your
   verbose error messages, invoke your parser with the -v flag.

   You should try to provide accurate and detailed error messages. A small part
   of your grade will be for good quality error messages.
*/
extern int VERBOSE_ERRORS;
%}

/* A union of all the types that can be the result of parsing actions. */
%union {
  bool boolean;
  Symbol symbol;
  Program program;
  Class_ class_;
  Classes classes;
  Feature feature;
  Features features;
  Formal formal;
  Formals formals;
  Case case_;
  Cases cases;
  Expression expression;
  Expressions expressions;
  char *error_msg;
}

/* 
   Declare the terminals; a few have types for associated lexemes.
   The token ERROR is never used in the parser; thus, it is a parse
   error when the lexer returns it.

   The integer following token declaration is the numeric constant used
   to represent that token internally.  Typically, Bison generates these
   on its own, but we give explicit numbers to prevent version parity
   problems (bison 1.25 and earlier start at 258, later versions -- at
   257)
*/
%token CLASS 258 ELSE 259 FI 260 IF 261 IN 262 
%token INHERITS 263 LET 264 LOOP 265 POOL 266 THEN 267 WHILE 268
%token CASE 269 ESAC 270 OF 271 DARROW 272 NEW 273 ISVOID 274
%token <symbol>  STR_CONST 275 INT_CONST 276 
%token <boolean> BOOL_CONST 277
%token <symbol>  TYPEID 278 OBJECTID 279 
%token ASSIGN 280 NOT 281 LE 282 FOR 283 ERROR 284

/*  DON'T CHANGE ANYTHING ABOVE THIS LINE, OR YOUR PARSER WONT WORK       */
/**************************************************************************/

/* Complete the nonterminal list below, giving a type for the semantic
  value of each non terminal. (See section 3.6 in the bison 
  documentation for details). */

/* Declare types for the grammar's non-terminals. */
%type <program> program
%type <classes> class_list
%type <class_> class
%type <features> feature_list
%type <feature> feature
%type <formal> formal
%type <formals> formal_list
%type <formals> formal_list_nonempty
%type <expression> expr
%type <expressions> expr_list
%type <case_> case
%type <cases> case_list 
%type <expressions> expr_list_nonempty
%type <expression> optional_assign
%type <expressions> expr_seq
%type <expression> let_bindings_list
%type <expression> for_expr

/* Precedence declarations go here. */
%left IN
%right ASSIGN
%right NOT
%nonassoc LE '<' '='
%left '+' '-'
%left '*' '/'
%left ISVOID
%right '~' /* Unary negation */
%left '@'
%left '.' 

%%
/* 
   Save the root of the abstract syntax tree in a global variable.
*/
program : class_list { ast_root = program($1); }
        ;

class_list
        : class ';'           /* single class */
                { $$ = single_Classes($1); }
        | class_list class ';'/* several classes */
                { $$ = append_Classes($1,single_Classes($2)); }
        ;

/* If no parent is specified, the class inherits from the Object class. */
class:
    CLASS TYPEID '{' feature_list '}'
        {
            $$ = class_(
                $2, /* Class name */
                idtable.add_string("Object"), /* Inherits from Object by default */
                $4, /* Features */
                stringtable.add_string(curr_filename) /* Filename */
            );
        }
    | CLASS TYPEID INHERITS TYPEID '{' feature_list '}'
        {
            $$ = class_(
                $2, /* Class name */
                $4, /* Parent class */
                $6, /* Features */
                stringtable.add_string(curr_filename) /* Filename */
            );
        }
    | CLASS error '{' feature_list '}'
        {
            yyerrok;
        } 
    ;


/* Feature list may be empty, but no empty features in list. */
feature_list:
    /* Empty feature list */
        { $$ = nil_Features(); }
    | feature_list feature ';'
        { $$ = append_Features($1, single_Features($2)); }
    | feature_list error ';'
        {
            yyerrok;
            $$ = $1;
        }
    ;

feature:
    OBJECTID '(' formal_list ')' ':' TYPEID '{' expr '}'
        {
            $$ = method(
                $1, /* Method name */
                $3, /* Formals */
                $6, /* Return type */
                $8  /* Method body */
            );
        }
  | OBJECTID ':' TYPEID optional_assign
        {
            $$ = attr(
                $1, /* Attribute name */
                $3, /* Type */
                $4  /* Initialization expression */
            );
        }
    ;

formal_list:
    /* Empty formal list */
    { $$ = nil_Formals(); }
    | formal_list_nonempty { $$ = $1; }
    ;

formal_list_nonempty:
    formal
        { $$ = single_Formals($1); }
    | formal_list_nonempty ',' formal
        { $$ = append_Formals($1, single_Formals($3)); }
    | formal_list_nonempty ',' error
        {
            yyerrok;
            $$ = $1;  /* Skip the erroneous formal and continue */
        }
    | error ',' formal
        {
            yyerrok;
            $$ = single_Formals($3);  /* Skip the erroneous formal and continue */
        }
    ;

formal:
    OBJECTID ':' TYPEID
        { $$ = formal($1, $3); }
    ;

/* reference cool manual section 10, figure 1 */
expr:
    OBJECTID ASSIGN expr
        { $$ = assign($1, $3); }
    | expr '@' TYPEID '.' OBJECTID '(' expr_list ')'  /* Static dispatch */
        { $$ = static_dispatch($1, $3, $5, $7); }
    | expr '.' OBJECTID '(' expr_list ')'   /* Dispatch */
        { $$ = dispatch($1, $3, $5); }
    | OBJECTID '(' expr_list ')'            /* Implicit dispatch (self) */
        {
            $$ = dispatch(
                object(idtable.add_string("self")), /* Receiver is 'self' */
                $1, /* Method name */
                $3  /* Arguments */
            );
        }
    | IF expr THEN expr ELSE expr FI
        { $$ = cond($2, $4, $6); }
    | WHILE expr LOOP expr POOL
        { $$ = loop($2, $4); }
    | '{' expr_seq '}'
        { $$ = block($2); }
    | LET let_bindings_list 
        { $$ = $2; }
    | CASE expr OF case_list ESAC
        { $$ = typcase($2, $4); }
    | NEW TYPEID
        { $$ = new_($2); }
    | ISVOID expr
        { $$ = isvoid($2); }
    | expr '+' expr
        { $$ = plus($1, $3); }
    | expr '-' expr
        { $$ = sub($1, $3); }
    | expr '*' expr
        { $$ = mul($1, $3); }
    | expr '/' expr
        { $$ = divide($1, $3); }
    | '~' expr
        { $$ = neg($2); }
    | expr '<' expr
        { $$ = lt($1, $3); }
    | expr LE expr
        { $$ = leq($1, $3); }
    | expr '=' expr
        { $$ = eq($1, $3); }
    | NOT expr /* logical negation: complement */
        { $$ = comp($2); }
    | '(' expr ')'
        { $$ = $2; }
    | OBJECTID
        { $$ = object($1); }
    | INT_CONST
        { $$ = int_const($1); }
    | STR_CONST
        { $$ = string_const($1); }
    | BOOL_CONST
        { $$ = bool_const($1); }
    | for_expr
        { $$ = $1; }
    ;

for_expr: 
    OBJECTID ':' TYPEID optional_assign  ';' expr ';' expr ')' '{' expr_seq '}'
        { $$ = let($1, $3, $4, loop($6, block(append_Expressions(single_Expressions($8), $11)))); }
    | OBJECTID ':' TYPEID optional_assign ',' for_expr
        { $$ = let($1, $3, $4, $6); }


let_bindings_list :
      OBJECTID ':' TYPEID optional_assign IN expr
        { $$ = let($1, $3, $4, $6); }
    | OBJECTID ':' TYPEID optional_assign ',' let_bindings_list
        { $$ = let($1, $3, $4, $6); }
    | error ',' let_bindings_list 
        { yyerrok; $$ = $3; }
    ;

/* Dispatch list */

expr_list:
    /* Empty expression list */
        { $$ = nil_Expressions(); }
    | expr_list_nonempty
        { $$ = $1; }
    ;

expr_list_nonempty:
    expr
        { $$ = single_Expressions($1); }
    | expr_list_nonempty ',' expr
        { $$ = append_Expressions($1, single_Expressions($3)); }
    | expr_list_nonempty ',' error
        {
            yyerrok;
            $$ = $1;  /* Skip the erroneous expression and continue */
        }
    | error ',' expr
        {
            yyerrok;
            $$ = single_Expressions($3);
        }
    ;

/* Case list */
case_list:
    case
        { $$ = single_Cases($1); }
    | case_list case
        { $$ = append_Cases($1, single_Cases($2)); }
    | case_list error ';'
        {
            yyerrok;
            $$ = $1;  /* Skip the erroneous case and continue */
        }
    | error ';' case
        {
            yyerrok;
            $$ = single_Cases($3);  /* Skip the erroneous case and continue */
        }
    ;

case:
    OBJECTID ':' TYPEID DARROW expr ';' /* not sure about the semicolon */
        { $$ = branch($1, $3, $5); }

/* Sequence of expressions */
expr_seq:
    expr ';'
        { $$ = single_Expressions($1); }
    | expr_seq expr ';'
        { $$ = append_Expressions($1, single_Expressions($2)); }
    | expr_seq error ';'
        {
            yyerrok;
            $$ = $1; /* Skip the erroneous expression and continue */
        }
    | error ';' expr ';'
        {
            yyerrok;
            $$ = single_Expressions($3); /* Skip the erroneous expression and continue */
        }
    ;

/* Optional assignment */
optional_assign:
    /* No initialization */
        { $$ = no_expr(); }
  | ASSIGN expr
        { $$ = $2; }
    ;



/* end of grammar */
%%

/* This function is called automatically when Bison detects a parse error. */
void yyerror(const char *s) {
  std::cerr << "\"" << curr_filename << "\", line " << curr_lineno << ": " << s
            << " at or near ";
  print_cool_token(std::cerr, yychar, true);
  std::cerr << std::endl;
  omerrs++;

  if (omerrs > 20) {
    if (VERBOSE_ERRORS) {
      std::cerr << "More than 20 errors\n";
    }
    exit(1);
  }
}
