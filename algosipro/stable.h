#ifndef _STABLE_H
#define _STABLE_H

#include "types.h"

symbol_table_entry *search_symbol_table(const char *name);
symbol_table_entry *new_symbol_table_entry(const char *name);
symbol_table_entry *symbol_table_get_head(void);
void free_first_symbol_table_entry(void);

#endif
