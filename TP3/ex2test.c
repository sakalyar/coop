#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <pthread.h>

int reponse = 1;
pthread_t th;

struct donnee_t{
	int v1;
	int v2;
}t;

void *run (void * arg){
	int i = *((int *) arg);
	printf("v1§ = %d\n", i);
	if( i==0){
		reponse++;
	}
}

int main (int argc, char * argv[]){
	int i = 0;
	
	t.v1 = 1;
	t.v2 = 6;
	
	while (t.v1 != 0 && t.v2!=0){
		t.v1 = t.v1;
		t.v2 = t.v2-1;
		int *n = (int *)malloc(sizeof(int));
		*n = t.v2;
	if ( pthread_create(&th, NULL, run ,&(*n)) != 0){
		printf("error\n");
		}
		
		
		
		i++;
	}
	
		pthread_join(th,NULL);
	printf("le resultat = %d\n", reponse);
	
	exit(EXIT_SUCCESS);
}
