#ifndef _TYPES_H
#define _TYPES_H

#include <stdbool.h>
#include <stdlib.h>
#include <errno.h>

#define MAX_PARAMS 10 // Parametre max pour les fonctions

typedef enum { TYPE_BOOL,
	       TYPE_INT,
	      } symbol_type;
typedef enum { NOM_FUNCTION, LOCAL_VARIABLE, PARAMETRE } symbol_class;

typedef struct _table {
	const char *name;
	symbol_class class;
	size_t nParams; 
	size_t nLocalVariables;

	// desc[0] contiendra le type de la variable,
	symbol_type desc[MAX_PARAMS+1];
	struct _table *next;
} table;


#endif
