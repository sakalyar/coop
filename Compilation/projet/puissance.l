%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "puissance.tab.h"
	char* id =NULL;
%}
%option noinput
%option nounput
%option noyywrap

deb \\begin\{algo\}
integer [0-9][1-9]*|"0"
id [a-zA-Z_][a-zA-Z0-9_]*
fin \\end\{document\}
set \\SET
dofori \\DOFORI
od \\OD
return \\RETURN

%%
{deb} {return DEB;}
{integer} { yylval.integer = strtol(yytext,NULL,10); return INT;}
{id} {id = malloc((strlen(yytext)+1) * sizeof(char));
		strcpy(id,yytext);
		yylval.id = id;
		return ID;
		}
{fin} {return FIN;}
{set} {return SET;}
{dofori} {return DOFORI;}
{od} {return OD;}
{return} {return RETURN;}
"{"|"}"|"."|"("|")"|","|"*"|"+"|"-"|"\\" {return yytext[0];}
.|\n {}
%%

