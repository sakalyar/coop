
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>

//#define taille 50000

pthread_t th[30];
int nbr;
int divise;
int taille;
unsigned int seed = 1;
int tableau[0][0];

void *run (void * arg){
	int n = *((int *) arg);
	int ligne;
	if (n == (nbr-1))
		ligne = divise+taille%nbr;
	else
		ligne = divise;
		
	for ( int i = 0; i < ligne; i++){
		for ( int j = 0; j < taille; j++){
			tableau[n*divise+i][j] =rand_r(&seed);
		}
	}
	return 0;
}


int main (int argc, char * argv[]){
	
	if (argc < 4){
		fprintf(stderr, "Nombre auguments incorrect\n");
		exit(EXIT_FAILURE);
	}
	taille = atoi(argv[1]);
	nbr = atoi(argv[3]);
	divise = taille/nbr;
	
	tableau[taille][taille];
	
	for (int i = 0; i < nbr; i++){
		int *x = (int *)malloc(sizeof(int));
		*x = i;
		if(pthread_create(&th[*x], NULL, run , &(*x)) != 0){
			exit(EXIT_FAILURE);
		}
	}
	for (int i = 0; i<nbr; ++i){
		pthread_join(th[i],NULL);
	}
}

