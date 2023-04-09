%{
  #include <stdlib.h>
  #include <stdio.h>
  #include <limits.h>
  #include "type_synth.h"
  
  #define MAX_VAR_STRLEN 255

  #include "algosipro.tab.h"

  void string_to_int(int *v, const char *s);
%}
%option noyywrap
%%
\\begin\{algo\}         { return DEB; } 
\\end\{algo\}           { return FIN; }
\\CALL                  { return CALL; }
\\SET                   { return SET; }
\\DOFORI                { return DOFORI; }
\\RETURN                { return RETURN; }
\\IF                    { return IF; }
\\FI                    { return FI; }
\\ELSE                  { return ELSE; }
\\DOWHILE               { return DOWHILE; }
\\OD                    { return OD; }
"<"                     { return INF; }
"<="                    { return INFEG; }
"="                     { return EG; }
"!="                    { return NEG; }
">"                     { return SUP; }
">="                    { return SUPEG; }
"true"                  { return VRAI; }
"false"                 { return FAUX; }
"||"                    { return OU; }
"&&"                    { return ET; }
"!"                     { return NON; }
[a-zA-Z_]+[a-zA-Z0-9_]* { strncpy(yylval.var_name, yytext, MAX_VAR_STRLEN); return VARNAME; }
[[:digit:]]+            { string_to_int(&yylval.integer, yytext); return NUMBER; }
[[:blank:]]
\n                      
.		                    { return yytext[0]; }     
%%

void string_to_int(int *r, const char *s) {
  char *p;
  long v;
  errno = 0;
  v = strtol(s, &p, 10);
  if ((*p != '\0' || 
      (errno == ERANGE && (v == LONG_MIN || v == LONG_MAX))) || 
      (v < INT_MIN || v > INT_MAX)) {
    fprintf(stderr, "Error converting string to int\n");
    exit(EXIT_FAILURE);
  } 
  *r = v;
}
