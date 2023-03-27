%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <stdbool.h>
	
	int yylex();
	void yyerror(char const *);
	
	int in_symbol_table(char* c, &v, &index);
	
	int formule(char* c, int v, int index);

typedef struct struct_table {
	char* id;
	int type;
	int nbparam;
	int nbvloc;
	int index;
	struct _table* next;
} table_symbols;

table_symbols* ts = NULL;
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
%type <integer> Calcul
%token DOFORI
%token OD
%token RETURN

%%
ALGO:
	DEB '{' ID {
			printf("Algo : %s\n",$3);
			
		   } '}' '{' lparam '}' 
	EXPR {}
	FIN
	;
lparam :
	lparam ',' ID {
			printf("Parametre : %s\n",$3); 
			table_symbols new_symbol;
			
			$$ = $1+1;
			
			}
	|ID	 {printf("Parametre : %s\n",$1); $$ = 1;}
	| {$$ = 0;}
	;
	
EXPR :
	SET '{' ID {printf("ID : %s\n",$3);} '}' '{' Calcul {printf("\tpop ax\n");
							     } '}' 
	EXPR
	|DOFORI '{' ID {printf("ID DOFORI 1: %s\n",$3);} '}' '{' INT {printf("INT DOFORI:%d\n",$7);} '}' '{' ID {printf("ID DOFORI 2: %s\n",$11);} '}'
		EXPR
		OD {printf("OD\n");}
		EXPR
	|RETURN '{' ID {printf("ID RETURN : %s\n",$3);} '}'
	|
	;

	

Calcul :
	Calcul '*' Calcul {
				printf("\tpop ax\n");
				printf("\tpop bx\n");
				printf("\tmul ax,bx\n");
				printf("\tpush ax\n");
				$$=INT;
				
				FILE *fptr = fopen("puissance.asm","a");
				if (fptr == NULL) {
					printf("ERROR!\n");
					exit(1);
				}
				//fprintf(fptr,"%d", $1);
				fprintf(fptr, "\tpop ax\n");
				fprintf(fptr, "\tpop bx\n");
				fprintf(fptr, "\tmul ax,bx\n");
				fprintf(fptr, "\tpush ax\n");
				fclose(fptr);
			  }
	|Calcul '/' Calcul {
				printf("%d\n", $1);
				FILE *fptr = fopen("puissance.asm","a");
				if (fptr == NULL) {
					printf("ERROR!\n");
					exit(1);
				}
				//fprintf(fptr,"%d", $1);
				fprintf(fptr, "\tpop ax\n");
				fprintf(fptr, "\tpop bx\n");
				fprintf(fptr, "\tmul ax,bx\n");
				fprintf(fptr, "\tpush ax\n");
				fclose(fptr);}
	|Calcul '+' Calcul {
				printf("%d\n", $1);
				FILE *fptr = fopen("puissance.asm","a");
				if (fptr == NULL) {
					printf("ERROR!\n");
					exit(1);
				}
				//fprintf(fptr,"%d", $1);
				fprintf(fptr, "\tpop ax\n");
				fprintf(fptr, "\tpop bx\n");
				fprintf(fptr, "\tadd ax,bx\n");
				fprintf(fptr, "\tpush ax\n");
				fclose(fptr);}
	|Calcul '-' Calcul {
				printf("%d\n", $1);
				FILE *fptr = fopen("puissance.asm","a");
				if (fptr == NULL) {
					printf("ERROR!\n");
					exit(1);
				}
				//fprintf(fptr,"%d", $1);
				fprintf(fptr, "\tpop ax\n");
				fprintf(fptr, "\tpop bx\n");
				fprintf(fptr, "\tmul ax,bx\n");
				fprintf(fptr, "\tpush ax\n");
				fclose(fptr);
				}
	|ID {
		int v, index;
		if (in_symbol_table($1, &v, &index)) {
			size_t pos_pile = formule(v, index);
			printf("\tcp ax,bp\n");
			printf("\tconst bx%zu\n", pos_pile);
			printf("\tsub ax,bp\n");
			printf("\tloadw bx,ax\n");
			printf("\tpush bx\n");
		} else {
			printf("ERROR : %s inconnu", $1);
		}
		printf("%s\n", $1);}
	|INT {}
	;
%%
void yyerror (char const * s){
	fprintf(stderr, "%s\n", s);
}


bool in_symbol_table(char* c, &v, &index) {
	if (ts == NULL)
		return false;
	table_symbols* t2 = ts->next;
	while(t2 != NULL) {
		if (strcmp(c, t2->id) == 0) {
			*v = t2->type;
			*index = t2->index;
			return true;
		}
	}
	return false;
}
	
int formule(int v, int index) {
	return 2 + 2 * v + 2 * index; // ???
}

int main(void){
	yyparse();
	return EXIT_SUCCESS;
}
	
	
