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
\\SET                   { return SET; }
\\RETURN                { return RETURN; }
\\DOFORI                { return DOFORI; }
\\CALL                  { return CALL; }
\\IF                    { return IF; }
\\FI                    { return FI; }
\\ELSE                  { return ELSE; }
\\DOWHILE               { return DOWHILE; }
\\OD                    { return OD; }
"<"                     { return INF; }
"<="                    { return INFEG; }
"="                     { return EG; }
"!="                    { return NEG; }
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
  errno = 0;
  long long var;
  var = strtol(s, &p, 10);
  if ((*p != '\0' || 
      (errno == ERANGE && (var == LONG_MIN || var == LONG_MAX))) || 
      (var < INT_MIN || var > INT_MAX)) {
    fprintf(stderr, "Error converting string to int\n");
    exit(EXIT_FAILURE);
  } 
  *r = var;
}
