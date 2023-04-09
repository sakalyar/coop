#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "types.h"
#include "stable.h"

static symbol_table_entry *symbol_table = NULL;

// ajouter une entré dans la liste des symboles
symbol_table_entry *new_symbol(const char *name) {
  symbol_table_entry *n;
  if ((n = malloc(sizeof(symbol_table_entry))) == NULL) {
    fprintf(stderr, "\nERROR: new symbol\n");
    return n;
  }
  if ((n->name = malloc(strlen(name)+1)) == NULL) {
    fprintf(stderr, "\nERROR: new symbol\n");
    return NULL;
  }
  strcpy((char *)(n->name), name);
  n->next = symbol_table;
  symbol_table = n;
  return n;
}

// faire une recherche dans la table de symbole suivant le nom
symbol_table_entry *search(const char *name) {
  symbol_table_entry *ste = symbol_table;
  for (ste = symbol_table;
      ste!=NULL && strcmp(ste->name, name);
      ste = ste->next) {/*rien, on itere le pointeur tant que possible*/};
  return ste;
}

//renvoie la premiere entré de la table des symboles
symbol_table_entry *symbol_table_get_head(void) {
	return symbol_table;
}

/*
cette fonction permet de libérer la mémoire allouée pour la première entrée de la liste chaînée, puis de mettre à jour la liste en supprimant cette première entrée.
*/
void free_first_symbol(void) {
  symbol_table_entry *ste = symbol_table->next;
  free((void *) symbol_table->name);
  free(symbol_table);
  symbol_table = ste;
}
