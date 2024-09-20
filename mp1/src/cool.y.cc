/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1


/* Substitute the variable and function names.  */
#define yyparse         cool_yyparse
#define yylex           cool_yylex
#define yyerror         cool_yyerror
#define yydebug         cool_yydebug
#define yynerrs         cool_yynerrs
#define yylval          cool_yylval
#define yychar          cool_yychar

/* First part of user prologue.  */
#line 6 "cool.y"

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

#line 118 "cool.y.cc"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "cool.y.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_CLASS = 3,                      /* CLASS  */
  YYSYMBOL_ELSE = 4,                       /* ELSE  */
  YYSYMBOL_FI = 5,                         /* FI  */
  YYSYMBOL_IF = 6,                         /* IF  */
  YYSYMBOL_IN = 7,                         /* IN  */
  YYSYMBOL_INHERITS = 8,                   /* INHERITS  */
  YYSYMBOL_LET = 9,                        /* LET  */
  YYSYMBOL_LOOP = 10,                      /* LOOP  */
  YYSYMBOL_POOL = 11,                      /* POOL  */
  YYSYMBOL_THEN = 12,                      /* THEN  */
  YYSYMBOL_WHILE = 13,                     /* WHILE  */
  YYSYMBOL_CASE = 14,                      /* CASE  */
  YYSYMBOL_ESAC = 15,                      /* ESAC  */
  YYSYMBOL_OF = 16,                        /* OF  */
  YYSYMBOL_DARROW = 17,                    /* DARROW  */
  YYSYMBOL_NEW = 18,                       /* NEW  */
  YYSYMBOL_ISVOID = 19,                    /* ISVOID  */
  YYSYMBOL_STR_CONST = 20,                 /* STR_CONST  */
  YYSYMBOL_INT_CONST = 21,                 /* INT_CONST  */
  YYSYMBOL_BOOL_CONST = 22,                /* BOOL_CONST  */
  YYSYMBOL_TYPEID = 23,                    /* TYPEID  */
  YYSYMBOL_OBJECTID = 24,                  /* OBJECTID  */
  YYSYMBOL_ASSIGN = 25,                    /* ASSIGN  */
  YYSYMBOL_NOT = 26,                       /* NOT  */
  YYSYMBOL_LE = 27,                        /* LE  */
  YYSYMBOL_FOR = 28,                       /* FOR  */
  YYSYMBOL_ERROR = 29,                     /* ERROR  */
  YYSYMBOL_30_ = 30,                       /* '<'  */
  YYSYMBOL_31_ = 31,                       /* '='  */
  YYSYMBOL_32_ = 32,                       /* '+'  */
  YYSYMBOL_33_ = 33,                       /* '-'  */
  YYSYMBOL_34_ = 34,                       /* '*'  */
  YYSYMBOL_35_ = 35,                       /* '/'  */
  YYSYMBOL_36_ = 36,                       /* '~'  */
  YYSYMBOL_37_ = 37,                       /* '@'  */
  YYSYMBOL_38_ = 38,                       /* '.'  */
  YYSYMBOL_39_ = 39,                       /* ';'  */
  YYSYMBOL_40_ = 40,                       /* '{'  */
  YYSYMBOL_41_ = 41,                       /* '}'  */
  YYSYMBOL_42_ = 42,                       /* '('  */
  YYSYMBOL_43_ = 43,                       /* ')'  */
  YYSYMBOL_44_ = 44,                       /* ':'  */
  YYSYMBOL_45_ = 45,                       /* ','  */
  YYSYMBOL_YYACCEPT = 46,                  /* $accept  */
  YYSYMBOL_program = 47,                   /* program  */
  YYSYMBOL_class_list = 48,                /* class_list  */
  YYSYMBOL_class = 49,                     /* class  */
  YYSYMBOL_feature_list = 50,              /* feature_list  */
  YYSYMBOL_feature = 51,                   /* feature  */
  YYSYMBOL_formal_list = 52,               /* formal_list  */
  YYSYMBOL_formal_list_nonempty = 53,      /* formal_list_nonempty  */
  YYSYMBOL_formal = 54,                    /* formal  */
  YYSYMBOL_expr = 55,                      /* expr  */
  YYSYMBOL_for_expr = 56,                  /* for_expr  */
  YYSYMBOL_let_bindings_list = 57,         /* let_bindings_list  */
  YYSYMBOL_expr_list = 58,                 /* expr_list  */
  YYSYMBOL_expr_list_nonempty = 59,        /* expr_list_nonempty  */
  YYSYMBOL_case_list = 60,                 /* case_list  */
  YYSYMBOL_case = 61,                      /* case  */
  YYSYMBOL_expr_seq = 62,                  /* expr_seq  */
  YYSYMBOL_optional_assign = 63            /* optional_assign  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  7
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   484

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  46
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  18
/* YYNRULES -- Number of rules.  */
#define YYNRULES  67
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  176

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   285


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      42,    43,    34,    32,    45,    33,    38,    35,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    44,    39,
      30,    31,     2,     2,    37,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    40,     2,    41,    36,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,     2
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   125,   125,   129,   131,   137,   146,   155,   165,   166,
     168,   176,   185,   197,   198,   202,   204,   206,   211,   219,
     225,   227,   229,   231,   239,   241,   243,   245,   247,   249,
     251,   253,   255,   257,   259,   261,   263,   265,   267,   269,
     271,   273,   275,   277,   279,   281,   286,   288,   293,   295,
     297,   305,   306,   311,   313,   315,   320,   329,   331,   333,
     338,   346,   351,   353,   355,   360,   370,   371
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "CLASS", "ELSE", "FI",
  "IF", "IN", "INHERITS", "LET", "LOOP", "POOL", "THEN", "WHILE", "CASE",
  "ESAC", "OF", "DARROW", "NEW", "ISVOID", "STR_CONST", "INT_CONST",
  "BOOL_CONST", "TYPEID", "OBJECTID", "ASSIGN", "NOT", "LE", "FOR",
  "ERROR", "'<'", "'='", "'+'", "'-'", "'*'", "'/'", "'~'", "'@'", "'.'",
  "';'", "'{'", "'}'", "'('", "')'", "':'", "','", "$accept", "program",
  "class_list", "class", "feature_list", "feature", "formal_list",
  "formal_list_nonempty", "formal", "expr", "for_expr",
  "let_bindings_list", "expr_list", "expr_list_nonempty", "case_list",
  "case", "expr_seq", "optional_assign", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-131)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-52)

#define yytable_value_is_error(Yyn) \
  ((Yyn) == YYTABLE_NINF)

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      13,    10,    25,    13,    31,    37,    -3,  -131,    46,  -131,
    -131,    29,  -131,  -131,    33,    41,    34,    53,   -16,  -131,
      55,  -131,  -131,  -131,    12,    75,  -131,    58,    61,    64,
      68,    67,  -131,    94,  -131,    97,   100,    80,     3,   232,
    -131,  -131,  -131,   102,  -131,  -131,   232,     5,   232,   232,
     105,   232,  -131,  -131,  -131,    51,   232,   232,   175,   232,
     437,  -131,    89,   303,    85,    87,  -131,   269,   323,  -131,
      42,   232,    47,   110,   437,    42,   101,   372,    96,   332,
     232,   232,   232,   232,   232,   232,   232,   118,   119,   232,
     232,     5,   122,   232,    14,   437,   103,   437,    99,   104,
      94,   232,  -131,   107,  -131,   385,  -131,   446,   446,   446,
      66,    66,    42,    42,   112,   111,   360,   251,  -131,    94,
     294,   115,   117,     7,  -131,   232,  -131,   207,    39,   398,
    -131,  -131,   131,    47,  -131,   232,    -5,  -131,   139,   142,
     127,  -131,  -131,   437,  -131,   437,   232,   143,  -131,   126,
     128,   260,   232,     5,  -131,   152,  -131,   411,   129,  -131,
      47,  -131,  -131,   437,  -131,   232,   232,   132,   424,   346,
    -131,  -131,   130,   175,   138,  -131
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,     2,     0,     0,     0,     1,     0,     3,
       8,     0,     8,     4,     0,     0,     0,     0,     0,     7,
       0,     8,     5,    10,     0,     0,     9,     0,     0,     0,
       0,    14,    15,    66,     6,     0,     0,     0,     0,     0,
      12,    18,    19,     0,    17,    16,     0,     0,     0,     0,
       0,     0,    43,    42,    44,    41,     0,     0,     0,     0,
      67,    45,     0,     0,     0,     0,    27,     0,     0,    29,
      30,     0,     0,     0,    39,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    20,     0,    53,     0,    52,
      66,     0,    62,     0,    26,     0,    40,    37,    36,    38,
      31,    32,    33,    34,     0,     0,     0,     0,    50,    66,
       0,     0,     0,     0,    57,     0,    23,     0,     0,     0,
      64,    63,     0,     0,    11,     0,     0,    25,     0,     0,
       0,    28,    58,    56,    55,    54,     0,     0,    65,     0,
       0,     0,     0,     0,    60,     0,    59,     0,     0,    47,
       0,    22,    24,    48,    49,     0,     0,     0,     0,     0,
      21,    61,     0,     0,     0,    46
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -131,  -131,  -131,   169,     2,  -131,  -131,  -131,   -14,   -39,
      30,   -90,  -130,  -131,  -131,   -74,     9,   -28
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     2,     3,     4,    14,    20,    30,    31,    32,    97,
      61,    66,    98,    99,   123,   124,    78,    40
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      60,   118,   152,   150,    44,    11,    64,    63,   140,    67,
      68,     5,    70,    28,    16,   121,     1,    74,    75,    77,
      79,    41,   141,    27,    45,     7,    24,    29,    25,    65,
     167,   122,    95,     6,    17,    17,    29,    12,   122,   105,
     153,   107,   108,   109,   110,   111,   112,   113,    96,   142,
     116,   117,    15,    46,   120,   -13,    47,    18,    18,    17,
      48,    49,   129,   164,   154,    50,    51,    52,    53,    54,
       9,    55,   128,    56,    19,    22,    71,    10,   146,    87,
      88,    21,    18,    57,   147,    13,   143,    58,   145,    59,
     -51,   136,    23,    72,    26,    73,   151,   103,    33,    34,
      85,    86,    46,    87,    88,    47,    35,   157,    36,    48,
      49,    37,    38,   163,    50,    51,    52,    53,    54,    39,
      55,    29,    56,    42,    43,    62,   168,   169,    69,    89,
      91,    92,    57,   100,    77,   105,    58,   104,    59,   103,
     101,   114,   126,   115,    46,   119,   130,    47,   125,   127,
     132,    48,    49,   133,   138,   149,    50,    51,    52,    53,
      54,   139,    55,   122,    56,   155,   156,   158,   160,   165,
     173,   161,     8,    73,    57,   170,    76,   159,    58,   175,
      59,    46,   174,     0,    47,     0,     0,     0,    48,    49,
       0,     0,     0,    50,    51,    52,    53,    54,     0,    55,
       0,    56,     0,     0,     0,     0,     0,     0,   144,     0,
       0,    57,     0,    46,     0,    58,    47,    59,     0,     0,
      48,    49,     0,     0,     0,    50,    51,    52,    53,    54,
       0,    55,     0,    56,     0,     0,     0,     0,    46,     0,
       0,    47,     0,    57,     0,    48,    49,    58,     0,    59,
      50,    51,    52,    53,    54,   135,    55,     0,    56,     0,
       0,     0,     0,     0,     0,   162,     0,     0,    57,     0,
       0,     0,    58,     0,    59,     0,     0,     0,    80,    93,
       0,    81,    82,    83,    84,    85,    86,    80,    87,    88,
      81,    82,    83,    84,    85,    86,    80,    87,    88,    81,
      82,    83,    84,    85,    86,   137,    87,    88,     0,     0,
       0,     0,     0,     0,     0,    90,     0,     0,     0,     0,
       0,    80,     0,     0,    81,    82,    83,    84,    85,    86,
      80,    87,    88,    81,    82,    83,    84,    85,    86,    94,
      87,    88,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,    81,    82,    83,    84,    85,    86,    80,
      87,    88,    81,    82,    83,    84,    85,    86,     0,    87,
      88,     0,     0,    80,     0,   106,    81,    82,    83,    84,
      85,    86,     0,    87,    88,     0,     0,    80,     0,   172,
      81,    82,    83,    84,    85,    86,     0,    87,    88,    80,
       0,   134,    81,    82,    83,    84,    85,    86,     0,    87,
      88,   102,    80,     0,     0,    81,    82,    83,    84,    85,
      86,     0,    87,    88,   131,    80,     0,     0,    81,    82,
      83,    84,    85,    86,     0,    87,    88,   148,    80,     0,
       0,    81,    82,    83,    84,    85,    86,     0,    87,    88,
     166,    80,     0,     0,    81,    82,    83,    84,    85,    86,
       0,    87,    88,   171,    80,     0,     0,    81,    82,    83,
      84,    85,    86,   -52,    87,    88,   -52,   -52,    83,    84,
      85,    86,     0,    87,    88
};

static const yytype_int16 yycheck[] =
{
      39,    91,     7,   133,     1,     8,     1,    46,     1,    48,
      49,     1,    51,     1,    12,     1,     3,    56,    57,    58,
      59,    35,    15,    21,    38,     0,    42,    24,    44,    24,
     160,    24,    71,    23,     1,     1,    24,    40,    24,    78,
      45,    80,    81,    82,    83,    84,    85,    86,     1,   123,
      89,    90,    23,     6,    93,    43,     9,    24,    24,     1,
      13,    14,   101,   153,   138,    18,    19,    20,    21,    22,
      39,    24,   100,    26,    41,    41,    25,    40,    39,    37,
      38,    40,    24,    36,    45,    39,   125,    40,   127,    42,
      43,   119,    39,    42,    39,    44,   135,     1,    23,    41,
      34,    35,     6,    37,    38,     9,    45,   146,    44,    13,
      14,    43,    45,   152,    18,    19,    20,    21,    22,    25,
      24,    24,    26,    23,    44,    23,   165,   166,    23,    40,
      45,    44,    36,    23,   173,   174,    40,    41,    42,     1,
      39,    23,    43,    24,     6,    23,    39,     9,    45,    45,
      38,    13,    14,    42,    39,    24,    18,    19,    20,    21,
      22,    44,    24,    24,    26,    23,    39,    24,    42,    17,
      40,    43,     3,    44,    36,    43,     1,   147,    40,    41,
      42,     6,   173,    -1,     9,    -1,    -1,    -1,    13,    14,
      -1,    -1,    -1,    18,    19,    20,    21,    22,    -1,    24,
      -1,    26,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
      -1,    36,    -1,     6,    -1,    40,     9,    42,    -1,    -1,
      13,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      -1,    24,    -1,    26,    -1,    -1,    -1,    -1,     6,    -1,
      -1,     9,    -1,    36,    -1,    13,    14,    40,    -1,    42,
      18,    19,    20,    21,    22,     4,    24,    -1,    26,    -1,
      -1,    -1,    -1,    -1,    -1,     5,    -1,    -1,    36,    -1,
      -1,    -1,    40,    -1,    42,    -1,    -1,    -1,    27,    10,
      -1,    30,    31,    32,    33,    34,    35,    27,    37,    38,
      30,    31,    32,    33,    34,    35,    27,    37,    38,    30,
      31,    32,    33,    34,    35,    11,    37,    38,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    12,    -1,    -1,    -1,    -1,
      -1,    27,    -1,    -1,    30,    31,    32,    33,    34,    35,
      27,    37,    38,    30,    31,    32,    33,    34,    35,    16,
      37,    38,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      27,    -1,    -1,    30,    31,    32,    33,    34,    35,    27,
      37,    38,    30,    31,    32,    33,    34,    35,    -1,    37,
      38,    -1,    -1,    27,    -1,    43,    30,    31,    32,    33,
      34,    35,    -1,    37,    38,    -1,    -1,    27,    -1,    43,
      30,    31,    32,    33,    34,    35,    -1,    37,    38,    27,
      -1,    41,    30,    31,    32,    33,    34,    35,    -1,    37,
      38,    39,    27,    -1,    -1,    30,    31,    32,    33,    34,
      35,    -1,    37,    38,    39,    27,    -1,    -1,    30,    31,
      32,    33,    34,    35,    -1,    37,    38,    39,    27,    -1,
      -1,    30,    31,    32,    33,    34,    35,    -1,    37,    38,
      39,    27,    -1,    -1,    30,    31,    32,    33,    34,    35,
      -1,    37,    38,    39,    27,    -1,    -1,    30,    31,    32,
      33,    34,    35,    27,    37,    38,    30,    31,    32,    33,
      34,    35,    -1,    37,    38
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,    47,    48,    49,     1,    23,     0,    49,    39,
      40,     8,    40,    39,    50,    23,    50,     1,    24,    41,
      51,    40,    41,    39,    42,    44,    39,    50,     1,    24,
      52,    53,    54,    23,    41,    45,    44,    43,    45,    25,
      63,    54,    23,    44,     1,    54,     6,     9,    13,    14,
      18,    19,    20,    21,    22,    24,    26,    36,    40,    42,
      55,    56,    23,    55,     1,    24,    57,    55,    55,    23,
      55,    25,    42,    44,    55,    55,     1,    55,    62,    55,
      27,    30,    31,    32,    33,    34,    35,    37,    38,    40,
      12,    45,    44,    10,    16,    55,     1,    55,    58,    59,
      23,    39,    39,     1,    41,    55,    43,    55,    55,    55,
      55,    55,    55,    55,    23,    24,    55,    55,    57,    23,
      55,     1,    24,    60,    61,    45,    43,    45,    63,    55,
      39,    39,    38,    42,    41,     4,    63,    11,    39,    44,
       1,    15,    61,    55,     1,    55,    39,    45,    39,    24,
      58,    55,     7,    45,    61,    23,    39,    55,    24,    56,
      42,    43,     5,    55,    57,    17,    39,    58,    55,    55,
      43,    39,    43,    40,    62,    41
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    46,    47,    48,    48,    49,    49,    49,    50,    50,
      50,    51,    51,    52,    52,    53,    53,    53,    53,    54,
      55,    55,    55,    55,    55,    55,    55,    55,    55,    55,
      55,    55,    55,    55,    55,    55,    55,    55,    55,    55,
      55,    55,    55,    55,    55,    55,    56,    56,    57,    57,
      57,    58,    58,    59,    59,    59,    59,    60,    60,    60,
      60,    61,    62,    62,    62,    62,    63,    63
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     3,     5,     7,     5,     0,     3,
       3,     9,     4,     0,     1,     1,     3,     3,     3,     3,
       3,     8,     6,     4,     7,     5,     3,     2,     5,     2,
       2,     3,     3,     3,     3,     2,     3,     3,     3,     2,
       3,     1,     1,     1,     1,     1,    12,     6,     6,     6,
       3,     0,     1,     1,     3,     3,     3,     1,     2,     3,
       3,     6,     2,     3,     3,     4,     0,     2
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* program: class_list  */
#line 125 "cool.y"
                     { ast_root = program((yyvsp[0].classes)); }
#line 1332 "cool.y.cc"
    break;

  case 3: /* class_list: class ';'  */
#line 130 "cool.y"
                { (yyval.classes) = single_Classes((yyvsp[-1].class_)); }
#line 1338 "cool.y.cc"
    break;

  case 4: /* class_list: class_list class ';'  */
#line 132 "cool.y"
                { (yyval.classes) = append_Classes((yyvsp[-2].classes),single_Classes((yyvsp[-1].class_))); }
#line 1344 "cool.y.cc"
    break;

  case 5: /* class: CLASS TYPEID '{' feature_list '}'  */
#line 138 "cool.y"
        {
            (yyval.class_) = class_(
                (yyvsp[-3].symbol), /* Class name */
                idtable.add_string("Object"), /* Inherits from Object by default */
                (yyvsp[-1].features), /* Features */
                stringtable.add_string(curr_filename) /* Filename */
            );
        }
#line 1357 "cool.y.cc"
    break;

  case 6: /* class: CLASS TYPEID INHERITS TYPEID '{' feature_list '}'  */
#line 147 "cool.y"
        {
            (yyval.class_) = class_(
                (yyvsp[-5].symbol), /* Class name */
                (yyvsp[-3].symbol), /* Parent class */
                (yyvsp[-1].features), /* Features */
                stringtable.add_string(curr_filename) /* Filename */
            );
        }
#line 1370 "cool.y.cc"
    break;

  case 7: /* class: CLASS error '{' feature_list '}'  */
#line 156 "cool.y"
        {
            yyerrok;
        }
#line 1378 "cool.y.cc"
    break;

  case 8: /* feature_list: %empty  */
#line 165 "cool.y"
        { (yyval.features) = nil_Features(); }
#line 1384 "cool.y.cc"
    break;

  case 9: /* feature_list: feature_list feature ';'  */
#line 167 "cool.y"
        { (yyval.features) = append_Features((yyvsp[-2].features), single_Features((yyvsp[-1].feature))); }
#line 1390 "cool.y.cc"
    break;

  case 10: /* feature_list: feature_list error ';'  */
#line 169 "cool.y"
        {
            yyerrok;
            (yyval.features) = (yyvsp[-2].features);
        }
#line 1399 "cool.y.cc"
    break;

  case 11: /* feature: OBJECTID '(' formal_list ')' ':' TYPEID '{' expr '}'  */
#line 177 "cool.y"
        {
            (yyval.feature) = method(
                (yyvsp[-8].symbol), /* Method name */
                (yyvsp[-6].formals), /* Formals */
                (yyvsp[-3].symbol), /* Return type */
                (yyvsp[-1].expression)  /* Method body */
            );
        }
#line 1412 "cool.y.cc"
    break;

  case 12: /* feature: OBJECTID ':' TYPEID optional_assign  */
#line 186 "cool.y"
        {
            (yyval.feature) = attr(
                (yyvsp[-3].symbol), /* Attribute name */
                (yyvsp[-1].symbol), /* Type */
                (yyvsp[0].expression)  /* Initialization expression */
            );
        }
#line 1424 "cool.y.cc"
    break;

  case 13: /* formal_list: %empty  */
#line 197 "cool.y"
    { (yyval.formals) = nil_Formals(); }
#line 1430 "cool.y.cc"
    break;

  case 14: /* formal_list: formal_list_nonempty  */
#line 198 "cool.y"
                           { (yyval.formals) = (yyvsp[0].formals); }
#line 1436 "cool.y.cc"
    break;

  case 15: /* formal_list_nonempty: formal  */
#line 203 "cool.y"
        { (yyval.formals) = single_Formals((yyvsp[0].formal)); }
#line 1442 "cool.y.cc"
    break;

  case 16: /* formal_list_nonempty: formal_list_nonempty ',' formal  */
#line 205 "cool.y"
        { (yyval.formals) = append_Formals((yyvsp[-2].formals), single_Formals((yyvsp[0].formal))); }
#line 1448 "cool.y.cc"
    break;

  case 17: /* formal_list_nonempty: formal_list_nonempty ',' error  */
#line 207 "cool.y"
        {
            yyerrok;
            (yyval.formals) = (yyvsp[-2].formals);  /* Skip the erroneous formal and continue */
        }
#line 1457 "cool.y.cc"
    break;

  case 18: /* formal_list_nonempty: error ',' formal  */
#line 212 "cool.y"
        {
            yyerrok;
            (yyval.formals) = single_Formals((yyvsp[0].formal));  /* Skip the erroneous formal and continue */
        }
#line 1466 "cool.y.cc"
    break;

  case 19: /* formal: OBJECTID ':' TYPEID  */
#line 220 "cool.y"
        { (yyval.formal) = formal((yyvsp[-2].symbol), (yyvsp[0].symbol)); }
#line 1472 "cool.y.cc"
    break;

  case 20: /* expr: OBJECTID ASSIGN expr  */
#line 226 "cool.y"
        { (yyval.expression) = assign((yyvsp[-2].symbol), (yyvsp[0].expression)); }
#line 1478 "cool.y.cc"
    break;

  case 21: /* expr: expr '@' TYPEID '.' OBJECTID '(' expr_list ')'  */
#line 228 "cool.y"
        { (yyval.expression) = static_dispatch((yyvsp[-7].expression), (yyvsp[-5].symbol), (yyvsp[-3].symbol), (yyvsp[-1].expressions)); }
#line 1484 "cool.y.cc"
    break;

  case 22: /* expr: expr '.' OBJECTID '(' expr_list ')'  */
#line 230 "cool.y"
        { (yyval.expression) = dispatch((yyvsp[-5].expression), (yyvsp[-3].symbol), (yyvsp[-1].expressions)); }
#line 1490 "cool.y.cc"
    break;

  case 23: /* expr: OBJECTID '(' expr_list ')'  */
#line 232 "cool.y"
        {
            (yyval.expression) = dispatch(
                object(idtable.add_string("self")), /* Receiver is 'self' */
                (yyvsp[-3].symbol), /* Method name */
                (yyvsp[-1].expressions)  /* Arguments */
            );
        }
#line 1502 "cool.y.cc"
    break;

  case 24: /* expr: IF expr THEN expr ELSE expr FI  */
#line 240 "cool.y"
        { (yyval.expression) = cond((yyvsp[-5].expression), (yyvsp[-3].expression), (yyvsp[-1].expression)); }
#line 1508 "cool.y.cc"
    break;

  case 25: /* expr: WHILE expr LOOP expr POOL  */
#line 242 "cool.y"
        { (yyval.expression) = loop((yyvsp[-3].expression), (yyvsp[-1].expression)); }
#line 1514 "cool.y.cc"
    break;

  case 26: /* expr: '{' expr_seq '}'  */
#line 244 "cool.y"
        { (yyval.expression) = block((yyvsp[-1].expressions)); }
#line 1520 "cool.y.cc"
    break;

  case 27: /* expr: LET let_bindings_list  */
#line 246 "cool.y"
        { (yyval.expression) = (yyvsp[0].expression); }
#line 1526 "cool.y.cc"
    break;

  case 28: /* expr: CASE expr OF case_list ESAC  */
#line 248 "cool.y"
        { (yyval.expression) = typcase((yyvsp[-3].expression), (yyvsp[-1].cases)); }
#line 1532 "cool.y.cc"
    break;

  case 29: /* expr: NEW TYPEID  */
#line 250 "cool.y"
        { (yyval.expression) = new_((yyvsp[0].symbol)); }
#line 1538 "cool.y.cc"
    break;

  case 30: /* expr: ISVOID expr  */
#line 252 "cool.y"
        { (yyval.expression) = isvoid((yyvsp[0].expression)); }
#line 1544 "cool.y.cc"
    break;

  case 31: /* expr: expr '+' expr  */
#line 254 "cool.y"
        { (yyval.expression) = plus((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1550 "cool.y.cc"
    break;

  case 32: /* expr: expr '-' expr  */
#line 256 "cool.y"
        { (yyval.expression) = sub((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1556 "cool.y.cc"
    break;

  case 33: /* expr: expr '*' expr  */
#line 258 "cool.y"
        { (yyval.expression) = mul((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1562 "cool.y.cc"
    break;

  case 34: /* expr: expr '/' expr  */
#line 260 "cool.y"
        { (yyval.expression) = divide((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1568 "cool.y.cc"
    break;

  case 35: /* expr: '~' expr  */
#line 262 "cool.y"
        { (yyval.expression) = neg((yyvsp[0].expression)); }
#line 1574 "cool.y.cc"
    break;

  case 36: /* expr: expr '<' expr  */
#line 264 "cool.y"
        { (yyval.expression) = lt((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1580 "cool.y.cc"
    break;

  case 37: /* expr: expr LE expr  */
#line 266 "cool.y"
        { (yyval.expression) = leq((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1586 "cool.y.cc"
    break;

  case 38: /* expr: expr '=' expr  */
#line 268 "cool.y"
        { (yyval.expression) = eq((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1592 "cool.y.cc"
    break;

  case 39: /* expr: NOT expr  */
#line 270 "cool.y"
        { (yyval.expression) = comp((yyvsp[0].expression)); }
#line 1598 "cool.y.cc"
    break;

  case 40: /* expr: '(' expr ')'  */
#line 272 "cool.y"
        { (yyval.expression) = (yyvsp[-1].expression); }
#line 1604 "cool.y.cc"
    break;

  case 41: /* expr: OBJECTID  */
#line 274 "cool.y"
        { (yyval.expression) = object((yyvsp[0].symbol)); }
#line 1610 "cool.y.cc"
    break;

  case 42: /* expr: INT_CONST  */
#line 276 "cool.y"
        { (yyval.expression) = int_const((yyvsp[0].symbol)); }
#line 1616 "cool.y.cc"
    break;

  case 43: /* expr: STR_CONST  */
#line 278 "cool.y"
        { (yyval.expression) = string_const((yyvsp[0].symbol)); }
#line 1622 "cool.y.cc"
    break;

  case 44: /* expr: BOOL_CONST  */
#line 280 "cool.y"
        { (yyval.expression) = bool_const((yyvsp[0].boolean)); }
#line 1628 "cool.y.cc"
    break;

  case 45: /* expr: for_expr  */
#line 282 "cool.y"
        { (yyval.expression) = (yyvsp[0].expression); }
#line 1634 "cool.y.cc"
    break;

  case 46: /* for_expr: OBJECTID ':' TYPEID optional_assign ';' expr ';' expr ')' '{' expr_seq '}'  */
#line 287 "cool.y"
        { (yyval.expression) = let((yyvsp[-11].symbol), (yyvsp[-9].symbol), (yyvsp[-8].expression), loop((yyvsp[-6].expression), block(append_Expressions(single_Expressions((yyvsp[-4].expression)), (yyvsp[-1].expressions))))); }
#line 1640 "cool.y.cc"
    break;

  case 47: /* for_expr: OBJECTID ':' TYPEID optional_assign ',' for_expr  */
#line 289 "cool.y"
        { (yyval.expression) = let((yyvsp[-5].symbol), (yyvsp[-3].symbol), (yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1646 "cool.y.cc"
    break;

  case 48: /* let_bindings_list: OBJECTID ':' TYPEID optional_assign IN expr  */
#line 294 "cool.y"
        { (yyval.expression) = let((yyvsp[-5].symbol), (yyvsp[-3].symbol), (yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1652 "cool.y.cc"
    break;

  case 49: /* let_bindings_list: OBJECTID ':' TYPEID optional_assign ',' let_bindings_list  */
#line 296 "cool.y"
        { (yyval.expression) = let((yyvsp[-5].symbol), (yyvsp[-3].symbol), (yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1658 "cool.y.cc"
    break;

  case 50: /* let_bindings_list: error ',' let_bindings_list  */
#line 298 "cool.y"
        { yyerrok; (yyval.expression) = (yyvsp[0].expression); }
#line 1664 "cool.y.cc"
    break;

  case 51: /* expr_list: %empty  */
#line 305 "cool.y"
        { (yyval.expressions) = nil_Expressions(); }
#line 1670 "cool.y.cc"
    break;

  case 52: /* expr_list: expr_list_nonempty  */
#line 307 "cool.y"
        { (yyval.expressions) = (yyvsp[0].expressions); }
#line 1676 "cool.y.cc"
    break;

  case 53: /* expr_list_nonempty: expr  */
#line 312 "cool.y"
        { (yyval.expressions) = single_Expressions((yyvsp[0].expression)); }
#line 1682 "cool.y.cc"
    break;

  case 54: /* expr_list_nonempty: expr_list_nonempty ',' expr  */
#line 314 "cool.y"
        { (yyval.expressions) = append_Expressions((yyvsp[-2].expressions), single_Expressions((yyvsp[0].expression))); }
#line 1688 "cool.y.cc"
    break;

  case 55: /* expr_list_nonempty: expr_list_nonempty ',' error  */
#line 316 "cool.y"
        {
            yyerrok;
            (yyval.expressions) = (yyvsp[-2].expressions);  /* Skip the erroneous expression and continue */
        }
#line 1697 "cool.y.cc"
    break;

  case 56: /* expr_list_nonempty: error ',' expr  */
#line 321 "cool.y"
        {
            yyerrok;
            (yyval.expressions) = single_Expressions((yyvsp[0].expression));
        }
#line 1706 "cool.y.cc"
    break;

  case 57: /* case_list: case  */
#line 330 "cool.y"
        { (yyval.cases) = single_Cases((yyvsp[0].case_)); }
#line 1712 "cool.y.cc"
    break;

  case 58: /* case_list: case_list case  */
#line 332 "cool.y"
        { (yyval.cases) = append_Cases((yyvsp[-1].cases), single_Cases((yyvsp[0].case_))); }
#line 1718 "cool.y.cc"
    break;

  case 59: /* case_list: case_list error ';'  */
#line 334 "cool.y"
        {
            yyerrok;
            (yyval.cases) = (yyvsp[-2].cases);  /* Skip the erroneous case and continue */
        }
#line 1727 "cool.y.cc"
    break;

  case 60: /* case_list: error ';' case  */
#line 339 "cool.y"
        {
            yyerrok;
            (yyval.cases) = single_Cases((yyvsp[0].case_));  /* Skip the erroneous case and continue */
        }
#line 1736 "cool.y.cc"
    break;

  case 61: /* case: OBJECTID ':' TYPEID DARROW expr ';'  */
#line 347 "cool.y"
        { (yyval.case_) = branch((yyvsp[-5].symbol), (yyvsp[-3].symbol), (yyvsp[-1].expression)); }
#line 1742 "cool.y.cc"
    break;

  case 62: /* expr_seq: expr ';'  */
#line 352 "cool.y"
        { (yyval.expressions) = single_Expressions((yyvsp[-1].expression)); }
#line 1748 "cool.y.cc"
    break;

  case 63: /* expr_seq: expr_seq expr ';'  */
#line 354 "cool.y"
        { (yyval.expressions) = append_Expressions((yyvsp[-2].expressions), single_Expressions((yyvsp[-1].expression))); }
#line 1754 "cool.y.cc"
    break;

  case 64: /* expr_seq: expr_seq error ';'  */
#line 356 "cool.y"
        {
            yyerrok;
            (yyval.expressions) = (yyvsp[-2].expressions); /* Skip the erroneous expression and continue */
        }
#line 1763 "cool.y.cc"
    break;

  case 65: /* expr_seq: error ';' expr ';'  */
#line 361 "cool.y"
        {
            yyerrok;
            (yyval.expressions) = single_Expressions((yyvsp[-1].expression)); /* Skip the erroneous expression and continue */
        }
#line 1772 "cool.y.cc"
    break;

  case 66: /* optional_assign: %empty  */
#line 370 "cool.y"
        { (yyval.expression) = no_expr(); }
#line 1778 "cool.y.cc"
    break;

  case 67: /* optional_assign: ASSIGN expr  */
#line 372 "cool.y"
        { (yyval.expression) = (yyvsp[0].expression); }
#line 1784 "cool.y.cc"
    break;


#line 1788 "cool.y.cc"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 378 "cool.y"


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
