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
  
  void get_asm_var(const char *name);

  /**
   * Push or pop var in asipro and update the symbol table.
   */
  void push_registre(const char *registry);
  void pop_registre(const char *registry);
  symbol_table_entry *ste = NULL;
  
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
%left INF INFEG SUP SUPEG VRAI FAUX
%left EG NEG
%left '+' '-' 
%left '*' '/'
%left CALL
%right NON

%start algo
%%
algo:

DEB '{' VARNAME '}' {
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
      ":%s\n", $3);
  } '{' lparam '}' {
    //ne change pas de position ce bloc de code 
    ste = new_symbol_table_entry("RET");
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
    // Ajoute la variable dans la table des symboles et asipro
    symbol_table_entry *ste = new_symbol_table_entry($1);
    ste->class = PARAMETRE;
    ste->desc[0] = TYPE_INT;
  }

// *** instruction ***

//modification ici
instr:
  SET '{' VARNAME '}' '{' expr '}' {
  
     // si le symbole n'est pas deja dans la table 
    if (search_symbol_table($3) == NULL) {
      // Ajouter le symbole sur la pile 
      printf("; Ajouter la variable %s dans la pile\n", $3);
      pop_registre("ax");
      printf("\tpush ax\n");
      // Mettre à jour la table des symboles
      symbol_table_entry *ste = new_symbol_table_entry($3);
      ste->class = LOCAL_VARIABLE;
      ste->desc[0] = TYPE_INT;
      
    }
  }
  
  | RETURN '{' expr '}' {
    
    // Stockez la valeur dans ax et libérez la pile
    pop_registre("ax");
    symbol_table_entry *st = symbol_table_get_head(); 
    while (st != NULL) {
      if (strcmp(st->name, "RET") == 0) {
        break;
      }

      printf("\tpop dx\n");
      st = st->next;
    }
    printf("\tret\n");
  }
  
  //instruction IF sans ELSE
  | IF '{' expr '}' if block_instr esle fi FI {
		if ($3 != NUM) {
			fprintf(stderr, "Erreur de type \n");
			$$ = TYPE_ERR;
			exit(EXIT_FAILURE);
		}		
	}

 //instruction IF avec ELSE
  | IF '{' expr '}' if block_instr ELSE esle block_instr fi FI {
		if ($3 != NUM) {
			fprintf(stderr, "Erreur de type\n");
			$$ = TYPE_ERR;
			
			exit(EXIT_FAILURE);
		}		
	}

  | DOWHILE begin_while '{' expr '}' while block_instr elihw OD {
		if ($4 != NUM) {
			fprintf(stderr, "Erreur de type\n");
			$$ = TYPE_ERR;	
			exit(EXIT_FAILURE);
		}
	}
;

if : {
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

esle : {
	int n = top();
	char buf[MAXBUF];
	creer_label(buf, MAXBUF, "else_%u", n);
  printf(
    "\tconst ax,fin_if_%u\n"
    "\tjmp ax\n"
    ":%s\n"
    "\n", n, buf);
    
}

fi : {
	int n = top();
	char buf[MAXBUF];
	creer_label(buf, MAXBUF, "fin_if_%u", n);
	printf(":%s\n", buf);
}

begin_while : {
	int n = numero_label();
	push(n);
	char buf[MAXBUF];
	creer_label(buf, MAXBUF, "while_%u", n);
  printf(
    "; Début de la boucle do while\n"
    ":%s\n",buf);
  
}

while : {
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

elihw : {
	int n = top();
	char buf[MAXBUF];
	creer_label(buf, MAXBUF, "fin_while_%u", n);
  printf(
    "\tconst ax,while_%u\n"
    "\tjmp ax\n"
    ":%s\n", n, buf
  );
}

//il y'avait end_b dans dans les deux IF et DOWHILE (tu les as supprimé)
/*
end_b : {
	int n = pop();
  printf("; End of the loop/condition (ID: %u)\n", n);
}
*/
// --- expr ---

expr:
  VARNAME {
    symbol_table_entry *var = search_symbol_table($1);
		if (var == NULL) {
			fprintf(stderr, "ERREUR: La variable %s n'existe pas\n", $1);
			$$ = VARIABLE_INDEFINI;
			
		} else {
      get_asm_var($1);
			$$ = NUM;
		}
  }

//Les nombres

| NUMBER {
    printf(
      "; Nombre %d\n"
      "\tconst ax,%d\n", $1, $1);
    push_registre("ax");
    $$ = NUM;
  }

// addition 
| expr '+' expr {
    if ($1 != NUM || $3 != NUM) {
			fprintf(stderr, "Erreur de type \n");
			$$ = TYPE_ERR;
			
		} else {
      printf("; Additioner deux expressions\n");
      pop_registre("ax");
      pop_registre("bx");
      printf("\tadd ax,bx\n");
      push_registre("ax");
			$$ = NUM;
		}
  }

// soustraction 
| expr '-' expr {
    if ($1 != NUM || $3 != NUM) {
			fprintf(stderr, "Erreur de type \n");
			$$ = TYPE_ERR;
			
		} else {
      printf("; Soustraire deux expressions\n");
      pop_registre("ax");
      pop_registre("bx");
      printf("\tsub bx,ax\n");
      push_registre("bx");
			$$ = NUM;
		}
  }

//multiplication 

  | expr '*' expr {
		if ($1 != NUM || $3 != NUM) {
			fprintf(stderr, "Erreur de type \n");
			$$ = TYPE_ERR;
			
		} else {
      printf("; Multiplier deux expressions\n");
      pop_registre("ax");
      pop_registre("bx");
      printf("\tmul ax,bx\n");
      push_registre("ax");
			$$ = NUM;
		}
	}

// Division
	| expr '/' expr {
		if ($1 != NUM || $3 != NUM) {
			fprintf(stderr, "Erreur de type \n");
			$$ = TYPE_ERR;
			
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
			$$ = NUM;
		}
	}

// Les boolean
| VRAI      {  printf("\tconst ax,1\n"); 
               printf("\tpush ax\n");
               $$=TYPE_BOOL;
            }
            
| FAUX      {  printf("\tconst ax,0\n");
               printf("\tpush ax\n");
               $$=TYPE_BOOL;
            }
            
//operateur inferieur

| expr INF expr {
  if ($1 != NUM || $3 != NUM) {
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
    $$ = NUM;
  }
}

//operateur inferieur ou egal

| expr INFEG expr {
  if ($1 != NUM || $3 != NUM) {
			fprintf(stderr, " Erreur de type\n");
			$$ = TYPE_ERR;
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
      $$ = NUM;
		}
}

//operateur superieur

| expr SUP expr {
  if ($1 != NUM || $3 != NUM) {
    fprintf(stderr, "Erreur de type\n");
    $$ = TYPE_ERR;

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
    $$ = NUM;
  }
}

//operateur superieur ou egal

| expr SUPEG expr {
if ($1 != NUM || $3 != NUM) {
    fprintf(stderr, "Erreur de type\n");
    $$ = TYPE_ERR;

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
    $$ = NUM;
  }
}


//operateur Egal
| expr EG expr {
  if ($1 != NUM || $3 != NUM) {
    fprintf(stderr, "Erreur de type \n");
		$$ = TYPE_ERR;
		
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
    $$ = NUM;
  }
}
//operateur Non egal

| expr NEG expr {
  if ($1 != NUM || $3 != NUM) {
    fprintf(stderr, " Erreur de type\n");
		$$ = TYPE_ERR;
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
    $$ = NUM;
  }
}

//operateur OU
| expr OU expr {
  if ($1 != NUM || $3 != NUM) {
    fprintf(stderr, "Erreur de type\n");
    $$ = TYPE_ERR;
    
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
    $$ = NUM;
  }
}

//operateur ET
| expr ET expr {
  if ($1 != NUM || $3 != NUM) {
    fprintf(stderr, "Erreur de type\n");
    $$ = TYPE_ERR;
    
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
    $$ = NUM;
  }
}

// Negation
| NON expr {
  if ($2 != NUM) {
    fprintf(stderr, "Erreur de type\n");
		$$ = TYPE_ERR;

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
    $$ = NUM;
  }
}


| CALL '{' VARNAME '}' '{' lexpr '}' {
  printf(
    "; Appel de la fonction  %s\n"
    "\tconst bx,%s\n"
    "\tcall bx\n", $3, $3);

  // Libérez les variables temporaires (paramètres) dans la table des symboles et ajoutez le pop
  printf("; Pop les arguments de la fonction appelée\n");
  for (size_t i = 0; i < argument; ++i) {
    pop_registre("dx");
  }
  // Pousser la valeur retournée sur la pile
  push_registre("ax");

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

// **** Fonctions implantées ****

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
  free_first_symbol_table_entry();
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
