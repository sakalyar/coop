#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <pwd.h>
#include <grp.h>
#include <time.h>
#include <dirent.h>
#include <errno.h>

int affiche(char * nom) {
  struct stat info;
  struct passwd wd;
  struct group grp;

  
  if (stat(nom, &info) == -1) {
    perror("stat");
    return -1;
  }
  
  grp = *getgrgid(info.st_gid);
  wd =  *getpwuid(info.st_uid);
  
  printf("numéro d’i-node : %ld\n", info.st_ino);
  printf("type : %o\n", info.st_mode);
  printf("droits : %o\n", info.st_mode);
  printf("nombre de liens : %ld\n", info.st_nlink);
  printf("propiétaire : %s\n", wd.pw_name);
  printf("groupe : %s\n", grp.gr_name);
  printf("taille : %ld\n", info.st_size);
  printf("date de dernière modification : %s", ctime(&info.st_mtime));
  printf("nom du fichier : %s\n\n", nom);

  return EXIT_SUCCESS;
}

int main(int argc, char * argv[]){
  if (argc != 2) {
    fprintf(stderr, "Usage: %s path\n", argv[0]);
    exit(EXIT_FAILURE);
  }
  
  DIR *dirp = opendir("./");
  if (dirp == NULL) {
    perror("opendir");
    exit(EXIT_FAILURE);
  }
  
  errno = 0;
  struct dirent *entry;
  while ((entry = readdir(dirp)) != NULL) {
    if(strcmp(entry->d_name,".") == strcmp(entry->d_name,".."))
		affiche(entry->d_name);
  }
   if (errno != 0) {
    perror("readdir");
    exit(EXIT_FAILURE);
  }

  if (closedir(dirp) == -1) {
    perror("closedir");
    exit(EXIT_FAILURE);
  }

  exit(EXIT_SUCCESS);
}
