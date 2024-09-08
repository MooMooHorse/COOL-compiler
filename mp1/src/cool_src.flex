    /*
    *  The scanner definition for COOL.
    */

    /*
    *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
    *  output, so headers and global definitions are placed here to be visible
    * to the code in the file.  Don't remove anything that was here initially
    */
%{
#include "cool_parse.h"
#include "utils.h"

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
extern FILE *fin; /* we read from this file */
#undef YY_INPUT
#define YY_INPUT(buf, result, max_size)                                        \
  if ((result = fread((char *)buf, sizeof(char), max_size, fin)) < 0)          \
    YY_FATAL_ERROR("read() in flex scanner failed");

extern int curr_lineno;
extern TTSTYPE cool_yylval;

/*
 *  Add Your own definitions here
 */
#define STR_MAX_LEN 1024

char str_buf[STR_MAX_LEN + 1]; /* Buffer to store string literals */
char *str_buf_ptr = str_buf;   /* Pointer to the current position in the buffer */
int comment_level = 0;         /* Level of nesting in multi-line comments */

typedef enum {
    STR_MAX_LEN_ERROR = 1,
    UNTERMINATED_STRING,
    STRING_EXCEED_FILE_BOUNDS,
    ILLEGAL_STR_CHAR,
    EOF_IN_STRING,
    EOF_IN_COMMENT,
    UNRECOGNIZED_CHAR
} cool_lex_error_t;

int ret_err(cool_lex_error_t err);

%}

    /* States: INITIAL, STRING, MULTILINE_STRING, COMMENT */
%x STRING
%x MULTILINE_STRING
%x COMMENT
%option noyywrap

    /*
    * Define names for regular expressions here.
    */

digit       [0-9]
hexdigit    [0-9a-fA-F]
letter      [a-zA-Z]
identifier  [a-zA-Z_][a-zA-Z0-9_]*
uppercase    [A-Z]
lowercase    [a-z]

CLASS      (?i:class)
INHERITS   (?i:inherits)
IF         (?i:if)
THEN       (?i:then)
ELSE       (?i:else)
FI         (?i:fi)
WHILE      (?i:while)
LOOP       (?i:loop)
POOL       (?i:pool)
FOR        (?i:for)
LET        (?i:let)
IN         (?i:in)
CASE       (?i:case)
ESAC       (?i:esac)
NEW        (?i:new)
ISVOID     (?i:isvoid)
NOT        (?i:not)


%%

    /*
        * Define regular expressions for the tokens of COOL here. Make sure, you
        * handle correctly special cases, like:
        *   - Nested comments
        *   - String constants: They use C like systax and can contain escape
        *     sequences. Escape sequence \c is accepted for all characters c. Except
        *     for \n \t \b \f, the result is c.
        *   - Keywords: They are case-insensitive except for the values true and
        *     false, which must begin with a lower-case letter.
        *   - Multiple-character operators (like <-): The scanner should produce a
        *     single token for every such operator.
        *   - Line counting: You should keep the global variable curr_lineno updated
        *     with the correct line number 
    */
    /* --- Keywords: These are case-insensitive except true/false --- */
{CLASS}         { return CLASS; }
{INHERITS}      { return INHERITS; }
{IF}            { return IF; }
{THEN}          { return THEN; }
{ELSE}          { return ELSE; }
{FI}            { return FI; }
{WHILE}         { return WHILE; }
{LOOP}          { return LOOP; }
{POOL}          { return POOL; }
{FOR}           { return FOR; }
{LET}           { return LET; }
{IN}            { return IN; }
{CASE}          { return CASE; }
{ESAC}          { return ESAC; }
{NEW}           { return NEW; }
{ISVOID}        { return ISVOID; }
{NOT}           { return NOT; }

"true"          { 
    yylval.boolean = true; 
    return BOOL_CONST; 
}
"false"         { yylval.boolean = false; return BOOL_CONST; }
{uppercase}{identifier} { 
    yylval.symbol = idtable.add_string(yytext);
    return TYPEID;    /* Type identifiers start with an uppercase letter */
}
{lowercase}{identifier} { 
    yylval.symbol = idtable.add_string(yytext);
    return OBJECTID;  /* Object identifiers start with a lowercase letter */
}
"<-"            { return ASSIGN; }
"=>"            { return DARROW; }
"<="            { return LE; }
"<"             { return "<"; }
"="             { return "="; }
"+"             { return "+"; }
"-"             { return "-"; }
"*"             { return "*"; }
"/"             { return "/"; }
"("             { return "("; }
")"             { return ")"; }
"{"             { return "{"; }
"}"             { return "}"; }
";"             { return ";"; }
"."             { return "."; }
","             { return ","; }
":"             { return ":"; }
"@"             { return "@"; }
"~"             { return "~"; }
    /* --- Whitespace: Skip it, but track line numbers --- */
[ \t\r]+       { /* Ignore spaces, tabs, and carriage returns */ }
\n             { curr_lineno++; } /* Increment line number on newline */
    /* --- Numbers: Handle decimal and hexadecimal --- */
{digit}+        { 
    yylval.symbol = inttable.add_string(yytext); 
    return INT_CONST; 
}
0x{hexdigit}+   { 
    int value = (int)strtol(yytext, NULL, 16); 
    char buffer[32];
    sprintf((char*)buffer, "%d", value);
    yylval.symbol = inttable.add_string(buffer);
    return INT_CONST;
}
    /* --- Strings --- */
    /* Start of a string, enter the STRING state */
\" { 
    BEGIN(STRING); 
    str_buf_ptr = str_buf;  /* Reset the buffer pointer */
}
    /* In the STRING state, handle string content and escape sequences */
<STRING>\" { 
    if(str_buf_ptr - str_buf + 1 >  STR_MAX_LEN + 1)  return ret_err(STR_MAX_LEN_ERROR);
    /* String normal termination. Add the string to the string table */
    BEGIN(INITIAL);
    yytext[strlen(yytext) - 1] = '\0';  /* Remove closing quote */
    yylval.symbol = stringtable.add_string(yytext + 1);  /* Remove opening quote */
    return STR_CONST;
}
<STRING>\n {
    curr_lineno++;  /* Increase line number as strings can span multiple lines */
    return ret_err(UNTERMINATED_STRING);
}


    /* Handle unterminated strings (when EOF is encountered) */
<STRING><<EOF>> {
    return ret_err(STRING_EXCEED_FILE_BOUNDS);
}

<STRING>\0 {
    return ret_err(EOF_IN_STRING);
}

<STRING>\\\n {
    curr_lineno++;  /* Increase line number as strings can span multiple lines */
}


<STRING>\\[^btnf] {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1)  return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = yytext[1];  /* Add the escaped character to the buffer */
}

<STRING>\\[b] {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1)  return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = '\b';  /* Add the escaped character to the buffer */
}

<STRING>\\[t] {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1)  return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = '\t';  /* Add the escaped character to the buffer */
}

<STRING>\\[n] {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1)  return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = '\n';  /* Add the escaped character to the buffer */
}

<STRING>\\[f] {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1)  return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = '\f';  /* Add the escaped character to the buffer */
}

<STRING>. {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1)  return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = yytext[0];  /* Add the character to the buffer */
}

    /* --- Python-style Multi-line String Handling (MULTILINE_STRING state) --- */

    /* Start of a multi-line string, enter the MULTILINE_STRING state */
\"\"\" { 
    BEGIN(MULTILINE_STRING); 
    str_buf_ptr = str_buf;  /* Reset the buffer pointer */
}

    /* End of a multi-line string, back to INITIAL state */
<MULTILINE_STRING>\"\"\" {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1) return ret_err(STR_MAX_LEN_ERROR);
    /* String normal termination. Add the string to the string table */
    BEGIN(INITIAL);
    yytext[strlen(yytext) - 3] = '\0';  /* Remove the closing triple quotes */
    yylval.symbol = stringtable.add_string(yytext + 3);  /* Remove the opening triple quotes */
    return STR_CONST;
}

    /* Allow unescaped newlines in multi-line strings */
<MULTILINE_STRING>\n {
    curr_lineno++;  /* Increment line number */
    *str_buf_ptr++ = '\n';  /* Add newline to the buffer */
}

    /* Handle unterminated multi-line strings (when EOF is encountered) */
<MULTILINE_STRING><<EOF>> {
    return ret_err(STRING_EXCEED_FILE_BOUNDS);
}

    /* Handle null characters in multi-line strings (illegal) */
<MULTILINE_STRING>\0 {
    return ret_err(EOF_IN_STRING);
}

    /* Handle escape sequences in multi-line strings (same as single-line strings) */
<MULTILINE_STRING>\\[^btnf] {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1) return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = yytext[1];  /* Add the escaped character to the buffer */
}

<MULTILINE_STRING>\\[b] {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1) return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = '\b';  /* Add the escaped character to the buffer */
}

<MULTILINE_STRING>\\[t] {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1) return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = '\t';  /* Add the escaped character to the buffer */
}

<MULTILINE_STRING>\\[n] {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1) return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = '\n';  /* Add the escaped character to the buffer */
}

<MULTILINE_STRING>\\[f] {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1) return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = '\f';  /* Add the escaped character to the buffer */
}

    /* Handle normal characters in multi-line strings */
<MULTILINE_STRING>. {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1) return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = yytext[0];  /* Add the character to the buffer */
}


    /* --- Comments: Single-line and multi-line comments with nesting --- */

    /* Single-line comments (start with -- and go until end of line or EOF) */
"--".*        { /* Skip single-line comments */ }
"--".*\n      { curr_lineno++; } /* Skip single-line comment and track newline */
"(*"           { BEGIN(COMMENT); comment_level = 1; }
<COMMENT>"(*"  { comment_level++; }
<COMMENT>")*"  { if (--comment_level == 0) BEGIN(INITIAL); }
<COMMENT>.     { /* Ignore other characters inside comment */ }
<COMMENT>\n    { curr_lineno++; } /* Track newlines inside comments */
<COMMENT><<EOF>> { 
    return ret_err(EOF_IN_COMMENT);  /* Handle EOF inside unclosed multi-line comment */
}


    /* --- Error Handling for unrecognized characters --- */
.              {
    return ret_err(UNRECOGNIZED_CHAR);
}


%%


int ret_err(cool_lex_error_t err) {
    BEGIN(INITIAL);
    switch(err) {
        case STR_MAX_LEN_ERROR:
            cool_yylval.error_msg = "String constant too long";
            break;
        case UNTERMINATED_STRING:
            cool_yylval.error_msg = "Unterminated string constant";
            break;
        case STRING_EXCEED_FILE_BOUNDS:
            cool_yylval.error_msg = "String constant exceeds file bounds";
            break;
        case ILLEGAL_STR_CHAR:
            cool_yylval.error_msg = "Illegal character in string constant";
            break;
        case EOF_IN_STRING:
            cool_yylval.error_msg = "EOF in string";
            break;
        case EOF_IN_COMMENT:
            cool_yylval.error_msg = "EOF in comment";
            break;
        case UNRECOGNIZED_CHAR:
            sprintf((char*)cool_yylval.error_msg, "Unrecognized token: %s", strdup(yytext));
            break;
        default:
            cool_yylval.error_msg = "Unknown error";
            break;
    }
    return ERROR;
}
