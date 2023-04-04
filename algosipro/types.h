#ifndef _TYPES_H
#define _TYPES_H

#include <stdbool.h>
#include <stdlib.h>
#include <errno.h>

#define MAX_PARAMS 10 // Parametre max pour les fonctions

typedef enum { TYPE_BOOL,
	       TYPE_INT,
	      } symbol_type;
//typedef enum { GLOBAL_VARIABLE, LOCAL_VARIABLE, FUNCTION } symbol_class;
typedef enum { NOM_FUNCTION, LOCAL_VARIABLE, PARAMETRE } symbol_class;


typedef struct _symbol_table_entry {
  const char *name;  // nom du symbole
  
  symbol_class class;  //sa classe
  
  size_t nParams; // garde// Nombre de parametre de la fonction
  
  size_t nLocalVariables; //garde// Nombre de variable local
 
  // desc[0] contiendra specialement le type de la variable,
  //           desc[i] contiendra d'autres infos (ça nous interesse pas ici)
  symbol_type desc[MAX_PARAMS+1];  // garde
  struct _symbol_table_entry *next; //Pointeur vers l'entrée suivante dans la table des symboles
} symbol_table_entry;


#endif
