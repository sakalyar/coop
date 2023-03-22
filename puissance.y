%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex();
	void yyerror(char const *);
%}
%union {
	int integer;
	char * id;
	}
%type <integer> lparam
%token <integer> INT
%token DEB
%token FIN
%token <id> ID
%start ALGO
%token SET
%token DOFORI
%token OD
%token RETURN

%%
ALGO:
	DEB '{' ID {printf("Algo : %s\n",$3);} '}' '{' lparam '}' 
	EXPR {}
	FIN
	;
lparam :
	lparam ',' ID {printf("Parametre : %s\n",$3); $$ = $1+1;}
	|ID	 {printf("Parametre : %s\n",$1); $$ = 1;}
	| {$$ = 0;}
	;
	
EXPR :
	SET '{' ID {printf("ID : %s\n",$3);} '}' '{' Calcul {printf("SET get\n");} '}' 
	EXPR
	|DOFORI '{' ID {printf("ID DOFORI 1: %s\n",$3);} '}' '{' INT {printf("INT DOFORI:%d\n",$7);} '}' '{' ID {printf("ID DOFORI 2: %s\n",$11);} '}'
		EXPR
		OD {printf("OD\n");}
		EXPR
	|RETURN '{' ID {printf("ID RETURN : %s\n",$3);} '}'
	|
	;

Calcul :
	Calcul '*' Calcul
	|Calcul '/' Calcul
	|Calcul '+' Calcul
	|Calcul '-' Calcul
	|ID
	|INT
	;
%%
void yyerror (char const * s){
	fprintf(stderr, "%s\n", s);
}


int main(void){
	yyparse();
	return EXIT_SUCCESS;
	}
