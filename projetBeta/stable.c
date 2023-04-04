#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "types.h"
#include "stable.h"

//tous ces meth important

//symbol_table contient un pointeur vers la première entrée de la table des symboles

static table *symbol_table = NULL;

// ajouter une entré dans la liste des symboles
table *new_table(const char *name) {
  table *n;
  if ((n = malloc(sizeof(table))) == NULL) {
    fprintf(stderr, "ERREUR: new_symbol_table_entry \n");
  } else {
    if ((n->name = malloc(strlen(name)+1)) == NULL) {
      fprintf(stderr, "ERREUR: new_symbol_table_entry \n");
    } else {
      strcpy((char *)(n->name), name);
      n->next = symbol_table;
      symbol_table = n;
    }
  }
  return n;
}

// faire une recherche dans la table de symbole suivant le nom
table *search(const char *name) {
  table *ste = symbol_table;
  for ( ste = symbol_table;
        ste!=NULL && strcmp(ste->name, name);
        ste = ste->next)
    ;
  return ste;
}

//renvoie la premiere entré de la table des symboles
table *table_head(void) {
	return symbol_table;
}

/*
cette fonction permet de libérer la mémoire allouée pour la première entrée de la liste chaînée, puis de mettre à jour la liste en supprimant cette première entrée.
*/
void free_first_table(void) {
  table *ste = symbol_table->next;
  //libère la mémoire allouée pour le champ name de la première entrée de la liste
  free((void *) symbol_table->name);
  //libère la mémoire allouée pour la première entrée elle-même.
  free(symbol_table);
  /*permet de mettre à jour le pointeur symbol_table pour qu'il pointe sur la deuxième entrée de la liste chaînée, ce qui permet de       supprimer la première entrée de la liste.
  */
  symbol_table = ste;
}
