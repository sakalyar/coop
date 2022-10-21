#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <pthread.h>

void *run (void * arg){
	int i = *((int *) arg);
	printf("%d\n",i);
	free(arg);
	return NULL;
}

int main (void){
	pthread_t th[100];
	
	for (int i = 0; i<100; ++i){
		int *x = (int *)malloc(sizeof(int));
		*x = i;
		if(pthread_create(&th[*x], NULL, run , &(*x)) != 0){
			exit(EXIT_FAILURE);
		}
	}
	for (int i = 0; i<100; ++i){
		pthread_join(th[i],NULL);
	}
	
	exit(EXIT_SUCCESS);
}
