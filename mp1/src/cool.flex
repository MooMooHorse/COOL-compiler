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
extern YYSTYPE cool_yylval;

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
    UNMATCHED_COMMENT,
	UNRECOGNIZED_CHAR
} cool_lex_error_t;

int ret_err(cool_lex_error_t err);

%}

%x STRING
%x MULTILINE_STRING
%x COMMENT
%option noyywrap

/*
* Define names for regular expressions here.
*/

digit       [0-9]
hexdigit    [0-9a-fA-F]
letter      [a-zA-Z_]
identifier  [a-zA-Z0-9_]*
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
OF 			   (?i:of)


%%
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
{OF}            { return OF; }
"true"          { yylval.boolean = true; return BOOL_CONST; }
"false"         { yylval.boolean = false; return BOOL_CONST; }
{uppercase}{identifier} { 
    yylval.symbol = idtable.add_string(yytext);
    return TYPEID;    
}
{lowercase}{identifier} { 
    yylval.symbol = idtable.add_string(yytext);
    return OBJECTID;  
}
"<-"            { return ASSIGN; }
"=>"            { return DARROW; }
"<="            { return LE; }
"<"             { return '<'; }
"="             { return '='; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"("             { return '('; }
")"             { return ')'; }
"{"             { return '{'; }
"}"             { return '}'; }
";"             { return ';'; }
"."             { return '.'; }
","             { return ','; }
":"             { return ':'; }
"@"             { return '@'; }
"~"             { return '~'; }

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
\" { 
    BEGIN(STRING); 
    str_buf_ptr = str_buf;  /* Reset the buffer pointer */
}
<STRING>\" { 
    if(str_buf_ptr - str_buf + 1 >  STR_MAX_LEN + 1)  return ret_err(STR_MAX_LEN_ERROR);
    /* String normal termination. Add the string to the string table */
    BEGIN(INITIAL);
    *str_buf_ptr = '\0';  /* Null-terminate the string */
    yylval.symbol = stringtable.add_string(str_buf);  /* Remove opening quote */
    return STR_CONST;
}
<STRING>\n {
    curr_lineno++;  /* Increase line number as strings can span multiple lines */
    return ret_err(UNTERMINATED_STRING);
}
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
\"\"\" { 
    BEGIN(MULTILINE_STRING); 
    str_buf_ptr = str_buf;  /* Reset the buffer pointer */
}
<MULTILINE_STRING>\"\"\" {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1) return ret_err(STR_MAX_LEN_ERROR);
    /* String normal termination. Add the string to the string table */
    BEGIN(INITIAL);
    *str_buf_ptr = '\0';  /* Null-terminate the string */
    yylval.symbol = stringtable.add_string(str_buf); 
    return STR_CONST;
}
<MULTILINE_STRING>\n {
    curr_lineno++;  /* Increment line number */
    *str_buf_ptr++ = '\n';  /* Add newline to the buffer */
}
<MULTILINE_STRING><<EOF>> {
    return ret_err(STRING_EXCEED_FILE_BOUNDS);
}
<MULTILINE_STRING>\0 {
    return ret_err(EOF_IN_STRING);
}
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
<MULTILINE_STRING>. {
    if(str_buf_ptr - str_buf + 1 > STR_MAX_LEN + 1) return ret_err(STR_MAX_LEN_ERROR);
    *str_buf_ptr++ = yytext[0];  /* Add the character to the buffer */
}

"--".*        { /* Skip single-line comments */ }
"--".*\n      { curr_lineno++; } /* Skip single-line comment and track newline */
"(*"           { BEGIN(COMMENT); comment_level = 1; }
<COMMENT>"(*"  { comment_level++; }
<COMMENT>"*)"  { if (--comment_level == 0) BEGIN(INITIAL); }
<COMMENT>.     { /* Ignore other characters inside comment */ }
<COMMENT>\n    { curr_lineno++; } /* Track newlines inside comments */
<COMMENT><<EOF>> { 
    return ret_err(EOF_IN_COMMENT);  /* Handle EOF inside unclosed multi-line comment */
}

"*)"         { return ret_err(UNMATCHED_COMMENT); }

[ \t\r\v\f]+       { /* Ignore spaces, tabs, and carriage returns */ } /* Ignore whitespace */
\n             { curr_lineno++; } /* Increment line number on newline */

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
        case UNMATCHED_COMMENT:
            cool_yylval.error_msg = "Unmatched *)";
            break;
        case UNRECOGNIZED_CHAR:
            cool_yylval.error_msg = strdup(yytext);
            break;
        default:
            cool_yylval.error_msg = "Unknown error";
            break;
    }
    return ERROR;
}
