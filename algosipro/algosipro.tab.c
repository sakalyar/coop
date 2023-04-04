/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
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
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.5.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "algosipro.y"

  #define _POSIX_C_SOURCE 200809L
  #include <stdlib.h>
  #include <stdio.h>
  #include <string.h>
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <fcntl.h>
  #include <unistd.h>
  #include <stdarg.h>
  #include <limits.h>
  #include <assert.h>
  #include "stable.h"
  #include "type_synth.h"

  #define MAX_VAR_STRLEN 255
  #define MAXBUF 255

/*
//enlve les end dans le if et dowhile
arguments_to_free = argument
current_label_number = num_label
NUMERIC = NUM
push_var = push_registre
pop_var = pop_registre
BG = DEB
END = FIN
create_label = creer_label
new_label_number = numero_label
A faire:




concentre toi plus sur la partie instr
expr c'est bon

*/

  // Stack
  #define STACK_SIZE 1024
  int stack[STACK_SIZE];
  size_t stack_index = 0;
  
  //La fonction push ajoute un nouvel élément e au sommet de la pile.
  void push(int e);
  
  //La fonction pop retire l'élément en haut de la pile et le retourne.
  int pop();
  //La fonction top retourne l'élément en haut de la pile sans le retirer
  int top();

  int yylex(void);
  void yyerror(char const *);
 
  int num_label = 0;
  int numero_label();
  void creer_label(char *buf, size_t buf_size, const char *format, ...);
  int argument = 0;

  /**
   récupérer la valeur d'une variable à partir de son nom et la pousser en haut sur la pile.
   */
  //important
  void get_asm_var(const char *name);

  /**
   * Push or pop var in asipro and update the symbol table.
   */
  void push_registre(const char *registry);
  void pop_registre(const char *registry);
  symbol_table_entry *ste = NULL;
  

#line 145 "algosipro.tab.c"

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

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
#ifndef YY_YY_ALGOSIPRO_TAB_H_INCLUDED
# define YY_YY_ALGOSIPRO_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NUMBER = 258,
    VARNAME = 259,
    DEB = 260,
    FIN = 261,
    SET = 262,
    RETURN = 263,
    IF = 264,
    FI = 265,
    ELSE = 266,
    DOWHILE = 267,
    OD = 268,
    DOFORI = 269,
    OU = 270,
    ET = 271,
    INF = 272,
    INFEG = 273,
    SUP = 274,
    SUPEG = 275,
    VRAI = 276,
    FAUX = 277,
    EG = 278,
    NEG = 279,
    CALL = 280,
    NON = 281
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 75 "algosipro.y"

  type_synth s;
  int integer;
  char var_name[MAX_VAR_STRLEN + 1];

#line 230 "algosipro.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_ALGOSIPRO_TAB_H_INCLUDED  */



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
typedef yytype_int8 yy_state_t;

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
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
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

#if ! defined yyoverflow || YYERROR_VERBOSE

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
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


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
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   183

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  36
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  17
/* YYNRULES -- Number of rules.  */
#define YYNRULES  43
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  98

#define YYUNDEFTOK  2
#define YYMAXUTOK   281


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      34,    35,    27,    25,    33,    26,     2,    28,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    31,     2,    32,     2,     2,     2,     2,
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
      29,    30
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    99,    99,   111,    99,   118,   119,   122,   124,   125,
     129,   140,   156,   173,   182,   191,   200,   215,   227,   234,
     245,   258,   279,   291,   299,   314,   329,   344,   364,   369,
     376,   417,   460,   505,   546,   587,   627,   670,   714,   755,
     772,   778,   779,   783
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "NUMBER", "VARNAME", "DEB", "FIN", "SET",
  "RETURN", "IF", "FI", "ELSE", "DOWHILE", "OD", "DOFORI", "OU", "ET",
  "INF", "INFEG", "SUP", "SUPEG", "VRAI", "FAUX", "EG", "NEG", "'+'",
  "'-'", "'*'", "'/'", "CALL", "NON", "'{'", "'}'", "','", "'('", "')'",
  "$accept", "algo", "$@1", "$@2", "block_instr", "lparam", "param",
  "instr", "if", "esle", "fi", "begin_while", "while", "elihw", "expr",
  "lexpr", "tmp_expr", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,    43,    45,    42,    47,   280,
     281,   123,   125,    44,    40,    41
};
# endif

#define YYPACT_NINF (-23)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      10,     3,    33,    31,   -23,    11,   -23,    13,    43,   -23,
      17,    15,   -23,    43,     2,   -23,    20,    22,    23,   -23,
      49,     2,    52,    16,    16,    27,   -23,   -23,    48,   -23,
     -23,   -23,   -23,    34,    16,    16,    58,    76,    16,    56,
      84,   -23,    44,    16,    16,    16,    16,    16,    16,    16,
      16,    16,    16,    16,    16,   -23,   -23,    94,    16,    57,
     -23,   143,   155,   -20,   -20,   -20,   -20,    14,    14,   -10,
     -10,   -23,   -23,     2,   -23,   112,    66,    87,     2,   -23,
      16,   -23,   -23,   -23,   130,    73,    74,     2,    96,   102,
     -23,    16,   -23,   -23,   -23,   -23,   106,   -23
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,     0,     1,     0,     2,     0,     7,    10,
       0,     8,     3,     7,     0,     9,     0,     0,     0,    19,
       0,     5,     0,     0,     0,     0,     4,     6,     0,    23,
      22,    28,    29,     0,     0,     0,     0,     0,     0,     0,
       0,    38,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    12,    16,     0,     0,     0,
      40,    36,    37,    30,    31,    32,    33,    34,    35,    24,
      25,    26,    27,     0,    20,     0,     0,    17,     0,    11,
       0,    17,    18,    21,    43,     0,    41,     0,     0,     0,
      39,     0,    18,    13,    15,    42,     0,    14
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -23,   -23,   -23,   -23,   -21,   110,   -23,   -23,   -23,    53,
      32,   -23,   -23,   -23,   -22,    42,   -23
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     2,     7,    14,    20,    10,    11,    21,    73,    82,
      88,    25,    78,    89,    84,    85,    86
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      27,    36,    37,    49,    50,    51,    52,    53,    54,    16,
      17,    18,    41,    42,    19,     1,    57,    53,    54,    29,
      30,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,     4,     3,     5,    75,    31,    32,    51,
      52,    53,    54,     6,     8,    33,    34,     9,    13,    12,
      35,    22,    77,    23,    24,    26,    28,    83,    38,    43,
      44,    45,    46,    47,    48,    40,    92,    49,    50,    51,
      52,    53,    54,    43,    44,    45,    46,    47,    48,    60,
      39,    49,    50,    51,    52,    53,    54,    58,    59,    76,
      55,    43,    44,    45,    46,    47,    48,    80,    81,    49,
      50,    51,    52,    53,    54,    90,    93,    91,    56,    43,
      44,    45,    46,    47,    48,    94,    97,    49,    50,    51,
      52,    53,    54,    15,    96,     0,    74,    43,    44,    45,
      46,    47,    48,    95,    87,    49,    50,    51,    52,    53,
      54,     0,     0,     0,    79,    43,    44,    45,    46,    47,
      48,     0,     0,    49,    50,    51,    52,    53,    54,    44,
      45,    46,    47,    48,     0,     0,    49,    50,    51,    52,
      53,    54,    45,    46,    47,    48,     0,     0,    49,    50,
      51,    52,    53,    54
};

static const yytype_int8 yycheck[] =
{
      21,    23,    24,    23,    24,    25,    26,    27,    28,     7,
       8,     9,    34,    35,    12,     5,    38,    27,    28,     3,
       4,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,     0,    31,     4,    58,    21,    22,    25,
      26,    27,    28,    32,    31,    29,    30,     4,    33,    32,
      34,    31,    73,    31,    31,     6,     4,    78,    31,    15,
      16,    17,    18,    19,    20,    31,    87,    23,    24,    25,
      26,    27,    28,    15,    16,    17,    18,    19,    20,    35,
      32,    23,    24,    25,    26,    27,    28,    31,     4,    32,
      32,    15,    16,    17,    18,    19,    20,    31,    11,    23,
      24,    25,    26,    27,    28,    32,    10,    33,    32,    15,
      16,    17,    18,    19,    20,    13,    10,    23,    24,    25,
      26,    27,    28,    13,    92,    -1,    32,    15,    16,    17,
      18,    19,    20,    91,    81,    23,    24,    25,    26,    27,
      28,    -1,    -1,    -1,    32,    15,    16,    17,    18,    19,
      20,    -1,    -1,    23,    24,    25,    26,    27,    28,    16,
      17,    18,    19,    20,    -1,    -1,    23,    24,    25,    26,
      27,    28,    17,    18,    19,    20,    -1,    -1,    23,    24,
      25,    26,    27,    28
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     5,    37,    31,     0,     4,    32,    38,    31,     4,
      41,    42,    32,    33,    39,    41,     7,     8,     9,    12,
      40,    43,    31,    31,    31,    47,     6,    40,     4,     3,
       4,    21,    22,    29,    30,    34,    50,    50,    31,    32,
      31,    50,    50,    15,    16,    17,    18,    19,    20,    23,
      24,    25,    26,    27,    28,    32,    32,    50,    31,     4,
      35,    50,    50,    50,    50,    50,    50,    50,    50,    50,
      50,    50,    50,    44,    32,    50,    32,    40,    48,    32,
      31,    11,    45,    40,    50,    51,    52,    45,    46,    49,
      32,    33,    40,    10,    13,    51,    46,    10
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    36,    38,    39,    37,    40,    40,    41,    41,    41,
      42,    43,    43,    43,    43,    43,    44,    45,    46,    47,
      48,    49,    50,    50,    50,    50,    50,    50,    50,    50,
      50,    50,    50,    50,    50,    50,    50,    50,    50,    50,
      50,    51,    51,    52
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     0,     0,    11,     1,     2,     0,     1,     3,
       1,     7,     4,     9,    11,     9,     0,     0,     0,     0,
       0,     0,     1,     1,     3,     3,     3,     3,     1,     1,
       3,     3,     3,     3,     3,     3,     3,     3,     2,     7,
       3,     1,     3,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


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

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



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

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YYUSE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yytype], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyo, yytype, yyvaluep);
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
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, int yyrule)
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
                       yystos[+yyssp[yyi + 1 - yynrhs]],
                       &yyvsp[(yyi + 1) - (yynrhs)]
                                              );
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
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
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


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
#  else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            else
              goto append;

          append:
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                yy_state_t *yyssp, int yytoken)
{
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Actual size of YYARG. */
  int yycount = 0;
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[+*yyssp];
      YYPTRDIFF_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
      yysize = yysize0;
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYPTRDIFF_T yysize1
                    = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
                    yysize = yysize1;
                  else
                    return 2;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    /* Don't count the "%s"s in the final size, but reserve room for
       the terminator.  */
    YYPTRDIFF_T yysize1 = yysize + (yystrlen (yyformat) - 2 * yycount) + 1;
    if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
      yysize = yysize1;
    else
      return 2;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
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
    yy_state_fast_t yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss;
    yy_state_t *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYPTRDIFF_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
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

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
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
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
# undef YYSTACK_RELOCATE
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

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
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
  case 2:
#line 99 "algosipro.y"
                    {
    printf(
      "; Fichier asm obtenu à partir d'un fichier latex \n\n"
      "\tconst ax,main\n"
      "\tjmp ax\n\n"
      ":div_err_str\n"
      "@string \"Erreur : Division par 0 impossible\\n\"\n\n"
      ":div_err\n"
      "\tconst ax,div_err_str\n"
      "\tcallprintfs ax\n"
      "\tend\n\n"
      ":%s\n", (yyvsp[-1].var_name));
  }
#line 1492 "algosipro.tab.c"
    break;

  case 3:
#line 111 "algosipro.y"
                   {
    //ne change pas de position ce bloc de code 
    ste = new_symbol_table_entry("RET");
  }
#line 1501 "algosipro.tab.c"
    break;

  case 10:
#line 129 "algosipro.y"
          {
    // Ajoute la variable dans la table des symboles et asipro
    symbol_table_entry *ste = new_symbol_table_entry((yyvsp[0].var_name));
    ste->class = PARAMETRE;
    ste->desc[0] = TYPE_INT;
  }
#line 1512 "algosipro.tab.c"
    break;

  case 11:
#line 140 "algosipro.y"
                                   {
  
     // si le symbole n'est pas deja dans la table 
    if (search_symbol_table((yyvsp[-4].var_name)) == NULL) {
      // Add the on the asipro stack
      printf("; Add the %s variable in the stack\n", (yyvsp[-4].var_name));
      pop_registre("ax");
      printf("\tpush ax\n");
      // Update the symbol table
      symbol_table_entry *ste = new_symbol_table_entry((yyvsp[-4].var_name));
      ste->class = LOCAL_VARIABLE;
      ste->desc[0] = TYPE_INT;
      
    }
  }
#line 1532 "algosipro.tab.c"
    break;

  case 12:
#line 156 "algosipro.y"
                        {
    // Stock the value in ax and free the stack
    // Stockez la valeur dans ax et libérez la pile
    pop_registre("ax");
    symbol_table_entry *st = symbol_table_get_head(); //important
    while (st != NULL) {
      if (strcmp(st->name, "RET") == 0) {
        break;
      }

      printf("\tpop dx\n");
      st = st->next;
    }
    printf("\tret\n");
  }
#line 1552 "algosipro.tab.c"
    break;

  case 13:
#line 173 "algosipro.y"
                                              {
		if ((yyvsp[-6].s) != NUM) {
			fprintf(stderr, "Erreur de type \n");
			(yyval.s) = TYPE_ERR;
			exit(EXIT_FAILURE);
		}		
	}
#line 1564 "algosipro.tab.c"
    break;

  case 14:
#line 182 "algosipro.y"
                                                               {
		if ((yyvsp[-8].s) != NUM) {
			fprintf(stderr, "Erreur de type\n");
			(yyval.s) = TYPE_ERR;
			
			exit(EXIT_FAILURE);
		}		
	}
#line 1577 "algosipro.tab.c"
    break;

  case 15:
#line 191 "algosipro.y"
                                                                {
		if ((yyvsp[-5].s) != NUM) {
			fprintf(stderr, "Erreur de type\n");
			(yyval.s) = TYPE_ERR;	
			exit(EXIT_FAILURE);
		}
	}
#line 1589 "algosipro.tab.c"
    break;

  case 16:
#line 200 "algosipro.y"
     {
	int n = numero_label();
  push(n);
	char buf[MAXBUF];
	creer_label(buf, MAXBUF, "else_%u", n);

  pop_registre("ax");
  printf(
    "\tconst bx,0\n"
    "\tconst cx,%s\n"
    "\tcmp ax,bx\n"
    "\tjmpc cx\n"
    "\n",buf);
}
#line 1608 "algosipro.tab.c"
    break;

  case 17:
#line 215 "algosipro.y"
       {
	int n = top();
	char buf[MAXBUF];
	creer_label(buf, MAXBUF, "else_%u", n);
  printf(
    "\tconst ax,fin_if_%u\n"
    "\tjmp ax\n"
    ":%s\n"
    "\n", n, buf);
    
}
#line 1624 "algosipro.tab.c"
    break;

  case 18:
#line 227 "algosipro.y"
     {
	int n = top();
	char buf[MAXBUF];
	creer_label(buf, MAXBUF, "fin_if_%u", n);
	printf(":%s\n", buf);
}
#line 1635 "algosipro.tab.c"
    break;

  case 19:
#line 234 "algosipro.y"
              {
	int n = numero_label();
	push(n);
	char buf[MAXBUF];
	creer_label(buf, MAXBUF, "while_%u", n);
  printf(
    "; Début de la boucle do while\n"
    ":%s\n",buf);
  
}
#line 1650 "algosipro.tab.c"
    break;

  case 20:
#line 245 "algosipro.y"
        {
	int n = top();
	char buf[MAXBUF];
	creer_label(buf, MAXBUF, "fin_while_%u", n);
  pop_registre("ax");
  printf(
    "\tconst bx,0\n"
    "\tconst cx,%s\n"
    "\tcmp ax,bx\n"
    "\tjmpc cx\n", buf
  );
}
#line 1667 "algosipro.tab.c"
    break;

  case 21:
#line 258 "algosipro.y"
        {
	int n = top();
	char buf[MAXBUF];
	creer_label(buf, MAXBUF, "fin_while_%u", n);
  printf(
    "\tconst ax,while_%u\n"
    "\tjmp ax\n"
    ":%s\n", n, buf
  );
}
#line 1682 "algosipro.tab.c"
    break;

  case 22:
#line 279 "algosipro.y"
          {
    symbol_table_entry *var = search_symbol_table((yyvsp[0].var_name));
		if (var == NULL) {
			fprintf(stderr, "ERREUR: La variable %s n'existe pas\n", (yyvsp[0].var_name));
			(yyval.s) = VARIABLE_INDEFINI;
			
		} else {
      get_asm_var((yyvsp[0].var_name));
			(yyval.s) = NUM;
		}
  }
#line 1698 "algosipro.tab.c"
    break;

  case 23:
#line 291 "algosipro.y"
         {
    printf(
      "; Nombre %d\n"
      "\tconst ax,%d\n", (yyvsp[0].integer), (yyvsp[0].integer));
    push_registre("ax");
    (yyval.s) = NUM;
  }
#line 1710 "algosipro.tab.c"
    break;

  case 24:
#line 299 "algosipro.y"
                {
    if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
			fprintf(stderr, "Erreur de type \n");
			(yyval.s) = TYPE_ERR;
			
		} else {
      printf("; Additioner deux expressions\n");
      pop_registre("ax");
      pop_registre("bx");
      printf("\tadd ax,bx\n");
      push_registre("ax");
			(yyval.s) = NUM;
		}
  }
#line 1729 "algosipro.tab.c"
    break;

  case 25:
#line 314 "algosipro.y"
                {
    if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
			fprintf(stderr, "Erreur de type \n");
			(yyval.s) = TYPE_ERR;
			
		} else {
      printf("; Soustraire deux expressions\n");
      pop_registre("ax");
      pop_registre("bx");
      printf("\tsub bx,ax\n");
      push_registre("bx");
			(yyval.s) = NUM;
		}
  }
#line 1748 "algosipro.tab.c"
    break;

  case 26:
#line 329 "algosipro.y"
                  {
		if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
			fprintf(stderr, "Erreur de type \n");
			(yyval.s) = TYPE_ERR;
			
		} else {
      printf("; Multiplier deux expressions\n");
      pop_registre("ax");
      pop_registre("bx");
      printf("\tmul ax,bx\n");
      push_registre("ax");
			(yyval.s) = NUM;
		}
	}
#line 1767 "algosipro.tab.c"
    break;

  case 27:
#line 344 "algosipro.y"
                        {
		if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
			fprintf(stderr, "Erreur de type \n");
			(yyval.s) = TYPE_ERR;
			
		} else {
      printf(
        "; Diviser deux expressions\n"
        "\tconst cx,div_err\n");
      pop_registre("ax");
      pop_registre("bx");
      printf( 
        "\tdiv bx,ax\n"
        "\tjmpe cx\n");
      push_registre("bx");
			(yyval.s) = NUM;
		}
	}
#line 1790 "algosipro.tab.c"
    break;

  case 28:
#line 364 "algosipro.y"
            {  printf("\tconst ax,1\n"); 
               printf("\tpush ax\n");
               (yyval.s)=TYPE_BOOL;
            }
#line 1799 "algosipro.tab.c"
    break;

  case 29:
#line 369 "algosipro.y"
            {  printf("\tconst ax,0\n");
               printf("\tpush ax\n");
               (yyval.s)=TYPE_BOOL;
            }
#line 1808 "algosipro.tab.c"
    break;

  case 30:
#line 376 "algosipro.y"
                {
  if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
    fprintf(stderr, "Erreur de type\n");
    exit(EXIT_FAILURE);
  } else {
    // Creation de label
    int n = numero_label();
    char buf[MAXBUF];
    creer_label(buf, MAXBUF, "inf_%u", n);
    char buf2[MAXBUF];
    creer_label(buf2, MAXBUF, "fin_inf_%u", n);

    printf("; Debut comparaison de l'operateur inf_%u \n", n);
    pop_registre("ax");
    pop_registre("bx");
    printf(
      "\tconst cx,%s\n"
      "\tsless bx,ax\n"
      "\tjmpc cx\n"
      "; Cas faux(ID: %u)\n"
      "\tconst ax,0\n"
      "\tpush ax\n"
      "\tconst ax,%s\n"
      "\tjmp ax\n"
      "; Cas vrai (ID: %u)\n"
      ":%s\n"
      "\tconst ax,1\n"
      "\tpush ax\n"
      "; Fin de comparaison de l'operateur inf_%u \n"
      ":%s\n", buf, n, buf2, n, buf, n, buf2);

    // Ajouter une variable temporaire à la table des symboles
    symbol_table_entry *ste = new_symbol_table_entry("TMP");
    ste->class = LOCAL_VARIABLE;
    ste->desc[0] = TYPE_INT;
    (yyval.s) = NUM;
  }
}
#line 1851 "algosipro.tab.c"
    break;

  case 31:
#line 417 "algosipro.y"
                  {
  if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
			fprintf(stderr, " Erreur de type\n");
			(yyval.s) = TYPE_ERR;
		} else {
      int n = numero_label();
			char buf[MAXBUF];
			creer_label(buf, MAXBUF, "infeg_%u", n);
			char buf2[MAXBUF];
			creer_label(buf2, MAXBUF, "fin_infeg_%u", n);
      
      printf("; Debut comparaison de l'operateur infeg_%u \n", n);
      pop_registre("ax");
      pop_registre("bx");
      printf(
        "\tcp cx,bx\n"
        "\tconst dx,%s\n"
        "\tsless bx,ax\n"
        "\tjmpc dx\n"
        "\tcmp cx,ax\n"
        "\tjmpc dx\n"
        "; Cas Faux (ID: %u)\n"
        "\tconst ax,0\n"
        "\tpush ax\n"
        "\tconst ax,%s\n"
        "\tjmp ax\n"
        "; Cas Vrai (ID: %u)\n"
        ":%s\n"
        "\tconst ax,1\n"
        "\tpush ax\n"
        "; Fin comparaison de l'operateur infeg_%u \n"
        ":%s\n", buf, n, buf2, n, buf, n, buf2
      );

      symbol_table_entry *ste = new_symbol_table_entry("TMP");
      ste->class = LOCAL_VARIABLE;
      ste->desc[0] = TYPE_INT;
      (yyval.s) = NUM;
		}
}
#line 1896 "algosipro.tab.c"
    break;

  case 32:
#line 460 "algosipro.y"
                {
  if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
    fprintf(stderr, "Erreur de type\n");
    (yyval.s) = TYPE_ERR;

  } else {
    int n = numero_label();
    char buf[MAXBUF];
    creer_label(buf, MAXBUF, "sup_%u", n);
    char buf2[MAXBUF];
    creer_label(buf2, MAXBUF, "fin_sup_%u", n);
    
    printf("; Debut comparaison de l'operateur sup_%u \n", n);
    pop_registre("ax");
    pop_registre("bx");
    printf(
      "\tcp cx,bx\n"
      "\tconst dx,%s\n"
      "\tsless bx,ax\n"
      "\tjmpc dx\n"
      "\tcmp cx,ax\n"
      "\tjmpc dx\n"
      "; Cas Faux (ID: %u)\n"
      "\tconst ax,1\n"
      "\tpush ax\n"
      "\tconst ax,%s\n"
      "\tjmp ax\n"
      "; Cas Vrai (ID: %u)\n"
      ":%s\n"
      "\tconst ax,0\n"
      "\tpush ax\n"
      "; Fin comparaison de l'operateur sup_%u \n"
      ":%s\n", buf, n, buf2, n, buf, n, buf2
    );

  
    symbol_table_entry *ste = new_symbol_table_entry("TMP");
    ste->class = LOCAL_VARIABLE;
    ste->desc[0] = TYPE_INT;
    (yyval.s) = NUM;
  }
}
#line 1943 "algosipro.tab.c"
    break;

  case 33:
#line 505 "algosipro.y"
                  {
if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
    fprintf(stderr, "Erreur de type\n");
    (yyval.s) = TYPE_ERR;

  } else {
    // Creation de label
    int n = numero_label();
    char buf[MAXBUF];
    creer_label(buf, MAXBUF, "supeg_%u", n);
    char buf2[MAXBUF];
    creer_label(buf2, MAXBUF, "fin_supeg_%u", n);

    printf("; Debut comparaison de l'operateur supeg_%u \n", n);
    pop_registre("ax");
    pop_registre("bx");
    printf(
      "\tconst cx,%s\n"
      "\tsless bx,ax\n"
      "\tjmpc cx\n"
      "; Cas faux (ID: %u)\n"
      "\tconst ax,1\n"
      "\tpush ax\n"
      "\tconst ax,%s\n"
      "\tjmp ax\n"
      "; Cas vrai (ID: %u)\n"
      ":%s\n"
      "\tconst ax,0\n"
      "\tpush ax\n"
       "; Fin comparaison de l'operateur supeg_%u \n"
      ":%s\n", buf, n, buf2, n, buf, n, buf2);

    symbol_table_entry *ste = new_symbol_table_entry("TMP");
    ste->class = LOCAL_VARIABLE;
    ste->desc[0] = TYPE_INT;
    (yyval.s) = NUM;
  }
}
#line 1986 "algosipro.tab.c"
    break;

  case 34:
#line 546 "algosipro.y"
               {
  if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
    fprintf(stderr, "Erreur de type \n");
		(yyval.s) = TYPE_ERR;
		
  } else {
    int n = numero_label();
    char buf1[MAXBUF];
		creer_label(buf1, MAXBUF, "egal_%u", n);
		char buf2[MAXBUF];
		creer_label(buf2, MAXBUF, "fin_egal_%u", n);


    printf("; Debut comparaison egal_%u \n", n);
    pop_registre("ax");
    pop_registre("bx");
    printf(
      "\tconst cx,%s\n"
      "\tcmp ax,bx\n"
      "\tjmpc cx\n"
      "; Cas faux (ID: %u)\n"
      "\tconst ax,0\n"
      "\tpush ax\n"
      "\tconst ax,%s\n"
      "\tjmp ax\n"
      "; Cas vrai(ID: %u)\n"
      ":%s\n"
      "\tconst ax,1\n"
      "\tpush ax\n"
      "; Fin comparaison (egal_%u) \n"
      ":%s\n", buf1, n, buf2, n, buf1, n, buf2
    ); 
    // Ajouter une variable temporaire à la table des symboles
    symbol_table_entry *ste = new_symbol_table_entry("TMP");
    ste->class = LOCAL_VARIABLE;
    ste->desc[0] = TYPE_INT;
    (yyval.s) = NUM;
  }
}
#line 2030 "algosipro.tab.c"
    break;

  case 35:
#line 587 "algosipro.y"
                {
  if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
    fprintf(stderr, " Erreur de type\n");
		(yyval.s) = TYPE_ERR;
  } else {
     int n = numero_label();
    char buf1[MAXBUF];
		creer_label(buf1, MAXBUF, "non_egal_%u", n);
		char buf2[MAXBUF];
		creer_label(buf2, MAXBUF, "fin_non_egal_%u", n);

    printf("; Debut comparaison (non_egal_%u)\n", n);
    pop_registre("ax");
    pop_registre("bx");
    printf(
      "\tconst cx,%s\n"
      "\tcmp ax,bx\n"
      "\tjmpc cx\n"
      "; Cas vrai (ID: %u)\n"
      "\tconst ax,1\n"
      "\tpush ax\n"
      "\tconst ax,%s\n"
      "\tjmp ax\n"
      "; Cas faux (ID : %u)\n"
      ":%s\n"
      "\tconst ax,0\n"
      "\tpush ax\n"
      "; Fin comparaison  (non_egal_%u)\n"
      ":%s\n", buf1, n, buf2, n, buf1, n, buf2
    );
    
    // Ajouter une variable temporaire à la table des symboles
    symbol_table_entry *ste = new_symbol_table_entry("TMP");
    ste->class = LOCAL_VARIABLE;
    ste->desc[0] = TYPE_INT;
    (yyval.s) = NUM;
  }
}
#line 2073 "algosipro.tab.c"
    break;

  case 36:
#line 627 "algosipro.y"
               {
  if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
    fprintf(stderr, "Erreur de type\n");
    (yyval.s) = TYPE_ERR;
    
  } else {
    int n = numero_label();
    char buf1[MAXBUF];
    creer_label(buf1, MAXBUF, "ou_%u", n);
    char buf2[MAXBUF];
    creer_label(buf2, MAXBUF, "fin_ou_%u", n);
    
    printf("; Debut comparaison avec l'operateur OU_%u \n", n);
    pop_registre("ax");
    pop_registre("bx");
    printf(
      "\tor ax,bx\n"
      "\tconst bx,0\n"
      "\tconst cx,%s\n"
      "\tcmp ax,bx\n"
      "\tjmpc cx\n"
      "; Faux cas (ID: %u)\n"
      "\tconst ax,1\n"
      "\tpush ax\n"
      "\tconst ax,%s\n"
      "\tjmp ax\n"
      "; Cas Vrai (ID: %u)\n"
      ":%s\n"
      "\tconst ax,0\n"
      "\tpush ax\n"
      "; Fin comparaison de l' operateur OU_%u\n"
      ":%s\n", buf1, n, buf2, n, buf1, n, buf2
    );

    // Ajouter une variable temporaire à la table des symboles
    symbol_table_entry *ste = new_symbol_table_entry("TMP");
    ste->class = LOCAL_VARIABLE;
    ste->desc[0] = TYPE_INT;
    (yyval.s) = NUM;
  }
}
#line 2119 "algosipro.tab.c"
    break;

  case 37:
#line 670 "algosipro.y"
               {
  if ((yyvsp[-2].s) != NUM || (yyvsp[0].s) != NUM) {
    fprintf(stderr, "Erreur de type\n");
    (yyval.s) = TYPE_ERR;
    
  } else {
    int n = numero_label();
    char buf1[MAXBUF];
    creer_label(buf1, MAXBUF, "et_%u", n);
    char buf2[MAXBUF];
    creer_label(buf2, MAXBUF, "fin_et_%u", n);
    
    
    printf("; Debut comparaison avec l'operateur ET_%u \n", n);
    pop_registre("ax");
    pop_registre("bx");
    printf(
      "\tmul ax,bx\n"
      "\tconst bx,0\n"
      "\tconst cx,%s\n"
      "\tcmp ax,bx\n"
      "\tjmpc cx\n"
      "; Cas Faux (ID: %u)\n"
      "\tconst ax,1\n"
      "\tpush ax\n"
      "\tconst ax,%s\n"
      "\tjmp ax\n"
      "; Cas Vrai (ID: %u)\n"
      ":%s\n"
      "\tconst ax,0\n"
      "\tpush ax\n"
      "; Fin de comparaison de l'operateur ET_%u \n"
      ":%s\n", buf1, n, buf2, n, buf1, n, buf2
    );

     // Ajouter une variable temporaire à la table des symboles
    symbol_table_entry *ste = new_symbol_table_entry("TMP");
    ste->class = LOCAL_VARIABLE;
    ste->desc[0] = TYPE_INT;
    (yyval.s) = NUM;
  }
}
#line 2166 "algosipro.tab.c"
    break;

  case 38:
#line 714 "algosipro.y"
           {
  if ((yyvsp[0].s) != NUM) {
    fprintf(stderr, "Erreur de type\n");
		(yyval.s) = TYPE_ERR;

  } else {
    int n = numero_label();
    char buf1[MAXBUF];
		creer_label(buf1, MAXBUF, "non_%u", n);
		char buf2[MAXBUF];
		creer_label(buf2, MAXBUF, "fin_non_%u", n);

   
    printf("; Debut operateur non_%u\n", n);
    pop_registre("ax");
    printf(
      "\tconst cx,%s\n"
      "\tconst bx,0\n"
      "\tcmp ax,bx\n"
      "\tjmpc cx\n"
      "; Cas  vrai (ID: %u)\n"
      "\tconst ax,1\n"
      "\tpush ax\n"
      "\tconst ax,%s\n"
      "\tjmp ax\n"
      "; Cas faux (ID: %u)\n"
      ":%s\n"
      "\tconst ax,0\n"
      "\tpush ax\n"
      "; Fin operateur non_%u\n"
      ":%s\n", buf1, n, buf2, n, buf1, n, buf2
    );
     
    symbol_table_entry *ste = new_symbol_table_entry("TMP");
    ste->class = LOCAL_VARIABLE;
    ste->desc[0] = TYPE_INT;
    (yyval.s) = NUM;
  }
}
#line 2210 "algosipro.tab.c"
    break;

  case 39:
#line 755 "algosipro.y"
                                     {
  printf(
    "; Appel de la fonction  %s\n"
    "\tconst bx,%s\n"
    "\tcall bx\n", (yyvsp[-4].var_name), (yyvsp[-4].var_name));

  // Libérez les variables temporaires (paramètres) dans la table des symboles et ajoutez le pop
  printf("; Pop les arguments de la fonction appelée\n");
  for (size_t i = 0; i < argument; ++i) {
    pop_registre("dx");
  }
  // Pousser la valeur retournée sur la pile
  push_registre("ax");

  (yyval.s) = NUM;
}
#line 2231 "algosipro.tab.c"
    break;

  case 40:
#line 772 "algosipro.y"
               {
    (yyval.s) = (yyvsp[-1].s);
  }
#line 2239 "algosipro.tab.c"
    break;

  case 43:
#line 783 "algosipro.y"
       {
    ++argument;
  }
#line 2247 "algosipro.tab.c"
    break;


#line 2251 "algosipro.tab.c"

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
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

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
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *, YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
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

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
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
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif


/*-----------------------------------------------------.
| yyreturn -- parsing is finished, return the result.  |
`-----------------------------------------------------*/
yyreturn:
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
                  yystos[+*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 787 "algosipro.y"


// --- Functions implantations ---

void yyerror(char const *s) {
  fprintf(stderr, "%s\n", s);
}

int main() {
 
  yyparse();

  return EXIT_SUCCESS;
}

/*
 index est nécessaire pour calculer l'adresse de la variable dans la pile
*/
void get_asm_var(const char *name) {
  

  //recupere l'adresse de la premiere entré de la table de symbole
  symbol_table_entry *st = symbol_table_get_head();
  //trouver l'entrée correspondant au nom de la variable passée en paramètre 
  size_t index = 0;
	while (st != NULL) {
		if (strcmp(st->name, name) == 0) {
      break;
    }
    ++index;
		st = st->next;
	}

  //génèration du code assembleur nécessaire pour récupérer la valeur de la variable et la pousser en haut dans la pile.
  printf(
    "; Récupérez la variable %s et placez-la en haut de la pile\n"
    "\tconst ax,2\n"
    "\tconst bx,%zu\n"
    "\tmul ax,bx\n"
    "\tcp bx,sp\n"
    "\tsub bx,ax\n"
    "\tloadw ax,bx\n"
    "\tpush ax\n",
    name, index
  );

  // Add the pushed variable to the symbol table
  //Ajouter la variable poussée à la table des symboles
  symbol_table_entry *ste = new_symbol_table_entry("TMP");
  ste->class = LOCAL_VARIABLE;
  ste->desc[0] = TYPE_INT;
}


void push_registre(const char *registry) {
  symbol_table_entry *ste = new_symbol_table_entry("TMP");
  ste->class = LOCAL_VARIABLE;
  ste->desc[0] = TYPE_INT;
  printf(
    "; Pousser une variable temporaire sur la pile\n"
    "\tpush %s\n", registry);
}

void pop_registre(const char *registry) {
  free_first_symbol_table_entry();//important
  printf(
    "\tpop %s\n", registry);
}

int numero_label() {
	if (num_label == UINT_MAX) {
		fprintf(stderr,"ERREUR: Nombre de label maximum atteint");
	}
	return num_label++;
}

void creer_label(char *buf, size_t buf_size, const char *format, ...) {
	va_list ap;
	va_start(ap, format);
	if ( vsnprintf(buf, buf_size, format, ap) >= buf_size ) {
		va_end(ap);
		fprintf(stderr,"Erreur lors de la generation du label");
	}
	va_end(ap);
}


void push(int e) {
	stack[stack_index++] = e;
}

int pop() {
	return stack[--stack_index];
}

int top() {
	return stack[stack_index - 1];
}


/*

La ligne symbol_table_entry *ste = new_symbol_table_entry("!TEMP") =(TMP); crée une entrée temporaire dans la table des symboles. Cette entrée est utilisée pour stocker le type de la variable qui est actuellement sur le sommet de la pile (dans ce cas-ci, un entier).

La raison pour laquelle une entrée temporaire est utilisée ici est que la fonction get_asm_var est appelée à partir d'un code qui ne connaît pas le type de la variable stockée sur la pile, mais qui a besoin de cette information pour générer du code assembleur correct.

En créant une entrée temporaire dans la table des symboles, la fonction peut stocker le type de la variable sur le sommet de la pile dans cette entrée, puis utiliser cette information pour générer du code assembleur correct. Une fois que le code est généré, l'entrée temporaire peut être supprimée de la table des symboles.


*/

/*

La commande "pop ax" est une instruction d'assembleur x86 qui retire (ou "pop") la valeur de la pile vers le registre AX.

En général, cette instruction est utilisée pour récupérer la valeur en haut de la pile dans le registre AX, afin de pouvoir la manipuler ou l'utiliser ultérieurement dans le programme

*/

/*

La commande "push ax" est une instruction d'assembleur x86 qui empile (ou "push") la valeur du registre AX sur la pile.

En général, cette instruction est utilisée pour sauvegarder la valeur du registre AX sur la pile, avant de le modifier ou de l'utiliser ultérieurement dans le programme.

*/
