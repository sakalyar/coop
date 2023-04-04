#ifndef _STABLE_H
#define _STABLE_H

#include "types.h"

table *search(const char *name);
table *new_table(const char *name);
table *table_head(void);
void free_first_table(void);

#endif
