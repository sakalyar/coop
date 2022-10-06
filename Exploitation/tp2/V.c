#include <stdio.h>
#include <stdlib.h>


// Creer x processus. 1 ->2 -> ...
// Le fils dit "je suis premier processus."
// Le pere attend la terminaison d'un processus avant de lancer un nouveau processus.



static int i = 1;
void f(void) {
	printf ("%d\n" , i++);
}

void forker(int c) {
	
	if (fork() == (pid_t) -1) {
		perror ("fork" );
		exit (EXIT_FAILURE );
	}
	printf ("Je suis le processus numéro %d\n" , i++);
}

void g(int x) {
	for (int j = 0; j < x; ++j) {
		forker(j);
	}
}
int main(void) {
	int i = 1;
	while(i < 5) {
		
	printf ( "%d\n" , i );
	if ( fork () == ( pid_t ) -1) {
		perror ( " fork " );
		exit ( EXIT_FAILURE );
		}
	}
	return EXIT_SUCCESS ;
	int x;
	//scanf("%d", &x);
	//g(x);
	
	return EXIT_SUCCESS;
}
