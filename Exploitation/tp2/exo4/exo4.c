#include <stdio.h>
#include <stdlib.h>

static int i = 1;

int main(void) {
	
	int N;
	scanf("%d", &N);
		switch(fork()) {
			case -1:
				perror("fork");
				exit(EXIT_FAILURE);
			case 0:
				for (;i < N;++i)
					printf("Je suis un fils et j'affiche le nombre: %d\n", i);
			default:
				for (;i < N;++i) {
					if (i % 2 == 0) {
						printf("Je suis un père et j'affiche le nombre: %d\n", i);
					
					}
					
				wait(NULL);
			}
		}
	
}
