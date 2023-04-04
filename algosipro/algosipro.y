%{
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
  
  #define STACK_SIZE 1024
  int stack[STACK_SIZE];
  size_t stack_index = 0;
  
  void push(int e);  
  int top();
  int pop();
  void reg_push(const char *registry);
  void reg_pop(const char *registry);
  
  int yylex(void);
  void yyerror(char const *);
 
  int num_label = 0;
  int numero_label();
  void create_label(char *buf, size_t buf_size, const char *format, ...);
  int argument = 0;

  
  void get_asm_var(const char *name);

  
  table *t = NULL;
  
%}
%union {
  type_synth s;
  int integer;
  char var_name[MAX_VAR_STRLEN + 1];
}

%type<s> expr instr
%token<integer> NUMBER
%token<var_name> VARNAME 
%token DEB FIN SET RETURN IF FI ELSE DOWHILE OD DOFORI

%left OU
%left ET
%left INF INFEG VRAI FAUX
%left EG NEG
%left '+' '-' 
%left '*' '/'
%left CALL
%right NON

%start algo
%%
algo:

DEB '{' VARNAME '}' {
	printf("; Fichier asm obtenu depuis .tex\n"
	   "\tconst ax,main\n"
	   "\tjmp ax\n"
	   );
	} '{' lparam '}' {
	t = new_table("RET");
} block_instr FIN
;

block_instr:
	instr
	| instr block_instr
;

lparam:
	| param
	| param ',' lparam
;

param:

VARNAME {
	table *t = new_table($1);
	t->class = PARAMETRE;
	t->desc[0] = TYPE_INT;
}
;

instr:

SET '{' VARNAME '}' '{' expr '}' {
  
        // si le symbole n'est pas dans la table 
	if (search($3) == NULL) {
		// Ajoutons le symbole sur la pile 
		printf("; Ajoute %s dans la pile\n", $3);
		reg_pop("ax");
		printf("\tpush ax\n");
		// Mettre à jour la table
		table *t = new_table($3);
		t->class = LOCAL_VARIABLE;
		t->desc[0] = TYPE_INT;
	}
}
  
| IF '{' expr '}' if block_instr else fi FI {
	if ($3 != NUM) {
		fprintf(stderr, "Erreur de type \n");
		$$ = TYPE_ERR;
		exit(EXIT_FAILURE);
	}		
}

| IF '{' expr '}' if block_instr ELSE else block_instr fi FI {
	if ($3 != NUM) {
		fprintf(stderr, "Erreur de type\n");
		$$ = TYPE_ERR;
		
		exit(EXIT_FAILURE);
	}		
}

| DOWHILE begin_while '{' expr '}' while block_instr fwhile OD {
	if ($4 != NUM) {
		fprintf(stderr, "Erreur de type\n");
		$$ = TYPE_ERR;	
		exit(EXIT_FAILURE);
	}
}

| RETURN '{' expr '}' {
    
    // Stockez la valeur dans ax et libérez la pile
    reg_pop("ax");
    table *st = table_head(); 
    while (st != NULL) {
      if (strcmp(st->name, "RET") == 0) {
        break;
      }

      printf("\tpop dx\n");
      st = st->next;
    }
    printf("\tret\n");
  }
;

if : {
	int n = numero_label();
	push(n);
	char* buf = malloc(MAXBUF);
	create_label(buf, MAXBUF, "else_%u", n);

	reg_pop("ax");
	printf(
	"\tconst bx,0\n"
	"\tconst cx,%s\n"
	"\tcmp ax,bx\n"
	"\tjmpc cx\n"
	"\n",buf);
	free(buf);
}
;

else : {
	char* buf = malloc(MAXBUF);
	int n = top();
	create_label(buf, MAXBUF, "else_%u", n);
  	printf("\tconst ax,fin_if_%u\n"
	       "\tjmp ax\n"
	       ":%s\n"
	       "\n", n, buf
	);    
	free(buf);
}
;

fi : {
	int n = top();
	char* buf = malloc(MAXBUF);
	create_label(buf, MAXBUF, "fin_if_%u", n);
	printf(":%s\n", buf);
	free(buf);
}
;

begin_while : {
	int n = numero_label();
	push(n);
	char* buf = malloc(MAXBUF);
	create_label(buf, MAXBUF, "while_%u", n);
  	printf("; La boucle do while\n"
	       ":%s\n",buf
	);
  	free(buf);
}

while : {
	int x = top();
	char* buf = malloc(MAXBUF);
	create_label(buf, MAXBUF, "fin_while_%u", x);
  	reg_pop("ax");
	printf( "\tconst bx,0\n"
        	"\tconst cx,%s\n"
	        "\tcmp ax,bx\n"
	        "\tjmpc cx\n", buf
	);
	free(buf);
}
;

fwhile : {
	int n = top();
	char* buf = malloc(MAXBUF);
	create_label(buf, MAXBUF, "fin boucle while%u", n);
  	printf("\tconst ax,while_%u\n"
	       "\tjmp ax\n"
	       ":%s\n", n, buf
	);
	free(buf);
};

expr:

VARNAME {
	table *var = search($1);
	if (var == NULL) {
		fprintf(stderr, "ERROR: La variable %s n'existe pas\n", $1);
		$$ = VARIABLE_INDEFINI;
		
	} else {
		get_asm_var($1);
		$$ = NUM;
	}
}

| NUMBER {
	printf( "; Number %d\n"
		"\tconst ax,%d\n", $1, $1
	);
	reg_push("ax");
	$$ = NUM;
}

| expr '+' expr {
	if ($1 != NUM || $3 != NUM) {
		fprintf(stderr, "Erreur de type \n");
		$$ = TYPE_ERR;
		
	} else {
		printf("; Additioner deux expressions\n");
		reg_pop("ax");
		reg_pop("bx");
		printf("\tadd ax,bx\n");
		reg_push("ax");
		$$ = NUM;
	}
}

| expr '-' expr {
    if ($1 != NUM || $3 != NUM) {
		fprintf(stderr, "Erreur de type \n");
		$$ = TYPE_ERR;

	} else {
		printf("; Soustraire deux expressions\n");
		reg_pop("ax");
		reg_pop("bx");
		printf("\tsub bx,ax\n");
		reg_push("bx");
		$$ = NUM;
	}
  }

  | expr '*' expr {
	if ($1 != NUM || $3 != NUM) {
		fprintf(stderr, "Erreur de type \n");
		$$ = TYPE_ERR;
	} else {
		printf("; Multiplier deux expressions\n");
		reg_pop("ax");
		reg_pop("bx");
		printf("\tmul ax,bx\n");
		reg_push("ax");
		$$ = NUM;
	}
  }

  | expr '/' expr {
	if ($1 != NUM || $3 != NUM) {
		fprintf(stderr, "Erreur de type \n");
		$$ = TYPE_ERR;
		
	} else {
		printf( "; Diviser deux expressions\n"
			"\tconst cx,div_err\n"
		);
		reg_pop("ax");
		reg_pop("bx");
		printf( "\tdiv bx,ax\n"
			"\tjmpe cx\n"
		);
		reg_push("bx");
		$$ = NUM;
	}
}

| VRAI {       
	printf("\tconst ax,1\n"); 
        printf("\tpush ax\n");
        $$=TYPE_BOOL;
       }
            
| FAUX {  
	printf("\tconst ax,0\n");
        printf("\tpush ax\n");
        $$=TYPE_BOOL;
    }
            

| CALL '{' VARNAME '}' '{' lexpr '}' {
	printf( "; Appel de la fonction  %s\n"
		"\tconst bx,%s\n"
		"\tcall bx\n", $3, $3);

	printf("; Pop les arguments de la fonction appelée\n");
	for (size_t i = 0; i < argument; ++i) {
		reg_pop("dx");
	}
	reg_push("ax");

	$$ = NUM;
}

| '(' expr ')' {
	$$ = $2;
}
;

lexpr:
	tmp_expr
	| tmp_expr ',' lexpr
;

tmp_expr:
	expr {
		++argument;
	}
;
%%

void yyerror(char const *s) {
	fprintf(stderr, "%s\n", s);
}

int main() {
	yyparse();
	return EXIT_SUCCESS;
}

void get_asm_var(const char *name) {
	table *st = table_head();
	size_t index = 0;
	while (st != NULL) {
		if (strcmp(st->name, name) == 0) break;

		++index;
		st = st->next;
	}

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
  table *t = new_table("TMP");
  t->class = LOCAL_VARIABLE;
  t->desc[0] = TYPE_INT;
}


void reg_push(const char *registry) {
	table *t = new_table("TMP");
	t->class = LOCAL_VARIABLE;
	t->desc[0] = TYPE_INT;
	printf( "; Pousser une variable temporaire sur la pile\n"
		"\tpush %s\n", registry
	);
}

void reg_pop(const char *registry) {
  	free_first_table();
	printf("\tpop %s\n", registry);
}

int numero_label() {
	if (num_label == UINT_MAX) {
		fprintf(stderr,"ERREUR: Nombre de label maximum atteint");
	}
	return num_label++;
}

void create_label(char *buf, size_t buf_size, const char *format, ...) {
	va_list ap;
	va_start(ap, format);
	if (vsnprintf(buf, buf_size, format, ap) >= buf_size ) {
		va_end(ap);
		fprintf(stderr,"Erreur lors de la generation du label");
	}
	va_end(ap);
}

void push(int e) {
	stack[stack_index++] = e;
}

int top() {
	return stack[stack_index - 1];
}

int pop() {
	return stack[--stack_index];
}

