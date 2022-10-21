#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <pthread.h>

int i = 0;
int reponse = 0;
pthread_t th[999];

void rec();


struct donnee_t{
	int v1;
	int v2;
};

void *run (void * arg){
	struct donnee_t i = *((struct donnee_t *) arg);
	if (i.v1 == 0)
		reponse++;
	else 
		rec(i);
	return 0;
}

void rec(struct donnee_t t){
	struct donnee_t *n = (struct donnee_t *)malloc(sizeof(struct donnee_t));
	struct donnee_t *m= (struct donnee_t *)malloc(sizeof(struct donnee_t));
	
	t.v1 = t.v1;
	t.v2 = t.v2-1;
	
	if(t.v1 <= t.v2){
		*n = t;
		if ( pthread_create(&th[i], NULL, run ,&(*n)) == 0){
			}
		i++;
	}
	if ( t.v1-1 >= 0){
		t.v1 = t.v1-1;
		if(t.v1 <= t.v2){
			*m = t;
			if ( pthread_create(&th[i], NULL, run ,&(*m)) == 0){
				}
			i++;
		}
	}
}

int main (int argc, char * argv[]){
	
	if (argc < 3){
		fprintf(stderr, "Nombre auguments incorrect\n");
		exit(EXIT_FAILURE);
	}
	
	struct donnee_t x;
	x.v2 = atoi(argv[1]);
	x.v1 = atoi(argv[2]);
	//C(x.v2,x.v1)
	
	if( x.v1 != 0 && x.v2!=0){
		rec(x);
	}
	
	for( int j = 0; j < i ; j++)
		pthread_join(th[j],NULL);
		
	printf("C(%d,%d) = %d\n",atoi(argv[1]),atoi(argv[2]), reponse);
	
	exit(EXIT_SUCCESS);
}
