#include <stdio.h>
#include <stdlib.h>

static int i = 1;


int main() {
	int i = 1;
	switch(fork()) {
		case -1:
			perror("fork");
			exit(EXIT_FAILURE);
		case 0:
			printf("fils: %d\n", i);
			i *= 2;
			printf("nouvelle valeur de fils: %d\n", i);
			exit(EXIT_SUCCESS);
		default:
			printf("père: %d\n", i);
			i *= 3;
			printf("nouveau i de père: %d\n", i);
			exit(EXIT_SUCCESS);
	}
}

