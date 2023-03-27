#include <stdio.h>


typedef struct_table {
	char* id;
	int type;
	int nbparam;
	int nbvloc;
	int index;
	struct _table* next;
} table_symbols;

table_symbols* ts = NULL;
