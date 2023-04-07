#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <unistd.h>


#define DOS_ALGOSIPRO "../algosipro/"

//Convertir la chaîne pointée par s en int et la stocker dans la variable  pointé par r

void string_to_int(int *r, const char *s);

int main(int argc, char **argv) {

  if (argc !=3) {
    fprintf(stderr, 
        "Erreur : Veuillez respectez cette synthaxe: ./run nom_fonction arg1,arg2 ");
    return EXIT_FAILURE;
  }

  //Extraire le nom de l'algorithme(du fonction)
  char nom_func[100];
  
  strcpy(nom_func, argv[1]);
 
  // Ouvrir le fichier de sortie
  char fic_sortie[4096];

  sprintf(fic_sortie, "%s%s.%s", 
      DOS_ALGOSIPRO, nom_func, "asm");
  int fd = 0;
  if ((fd = open(fic_sortie, O_APPEND | O_RDWR)) < 0) {
    fprintf(stderr, "Erreur d'ouverture du fichier %s\n", fic_sortie);
    return EXIT_FAILURE;
  }

  // Écrire le début de la fonction main
  dprintf(fd,
    "\n:main\n"
    "; initialistaion de la pile\n"
    "\tconst bp,stack\n"
    "\tconst sp,stack\n"
    "\tconst ax,2\n"
    "\tsub sp,ax\n"
  );
  
  // Extraire les parametres

  char parametres[100];
  strcpy(parametres,argv[2]);
  
  //Divisez les paramètres par un virgule et les convertir en int
  char *parametre = strtok(parametres, ",");
  dprintf(fd, "; construction des parametres\n");
  while (parametre != NULL) {
    int parametre_int = 0;
    string_to_int(&parametre_int, parametre);
    dprintf(fd, 
      "\tconst ax,%d\n"
      "\tpush ax\n", parametre_int);
    parametre = strtok(NULL, ",");
  }

  //Appel de la fonction et affichage du resultat 
  dprintf(fd, 
    "; Appel de la founction %s\n"
    "\tconst ax,%s\n"
    "\tcall ax\n"
    ";recuperer le resultat et affiche le\n"
    "\tpush ax\n"
    "\tcp ax,sp\n"
    "\tcallprintfd ax\n"
    "\tend\n"
    ":stack\n"
    "@int 0\n", nom_func, nom_func);
  
  if (close(fd) < 0) {
    fprintf(stderr, "Erreur de fermeture du fichier %s", fic_sortie);
    return EXIT_FAILURE;
  }

  return EXIT_SUCCESS;
}

void string_to_int(int *r, const char *s) {
  char *p;
  long v;
  errno = 0;
  v = strtol(s, &p, 10);
  if ((*p != '\0' || 
      (errno == ERANGE && (v == LONG_MIN || v == LONG_MAX))) || 
      (v < INT_MIN || v > INT_MAX)) {
    fprintf(stderr, "Erreur de conversion de string en int\n");
    exit(EXIT_FAILURE);
  } 
  *r = (int) v;
}

