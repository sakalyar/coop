"Indiquez ici vos noms et prénoms :"


#%%Prise en main
#Ce fichier est divisé en blocs de code appelés "cellules", et délimités par les lignes qui commencent par #%%
#Les touches Ctrl+Entrée permettent d'executer toute une cellule à la fois.
#Les lignes qui commencent par "#" sont considérées comme des commentaires, et ignorées quand le code est executé.
#Tutoriel officiel python : https://docs.python.org/fr/3/tutorial/index.html

#%% cette ligne est le début de la cellule suivante
1+1
print(5**2)
print("Bonjour")

#%% Type de données : Python est un language à typage dynamique fort, une variable prend le tye de la valuer qu'elle contient
a = 3.14
print("a est de type ",type(a)," et vaut ",a)
b=10
print("b est de type ",type(b)," et vaut ",b)
c = True
print("c est de type ",type(c)," et vaut ",c)
d= "Bonjour "+3*"!"
print("d est de type ",type(d)," et vaut ",d)

#%% Tuples : Une fois crée, un tuple ne peut pas être modifié, c'est un objet immuable !
M = (1 , 0.5**3, "ciao !") #tuple
print(type(M))
a,b,c = M #dépaquette un tuple
print(a,b,c)
x=M[0]
print(x) #M est un objet immuable

#%% Listes : une fois crée, une liste peut être modifiée, c'est un objet muable !
L=[]
L.append(4)
L.append(5)
print(L)
print(len(L))
L=L+[6,7]
print(L)
L.insert(1,10) #insère 10 à la place d'indice 1
print(L)
print(L[-1]) #affiche le dernier élément de L
z=L.pop() #supprime le dernier élément de L et on récupère cet élément dans z
print(z,L)
print(L[1:3]) #La technique du slicing permet d'extraire des élément d'une liste ou d'un tableau numpy, L[start:stop] : 'indice de départ de L vaut start et celui de fin vaut stop-1 avec un pas de 1 par défaut
L1=['mot', 21, 3.14, False] #liste avec éléments de type different
print(L1)
L1[0]= "phrase"
print(L1) #objet muable

#%% Deques : dec, permet d'ajouter et de supprimer très rapidement des éléments aux extrémités droite et gauche. Il s'agit d'un objet muable
from collections import deque #Il est possible d'importer des information depuis un autre fichier ou d'une bibliothèque
D=deque()
D.append(8)
D.appendleft(9)
print(D)
print(type(D))
x=D.pop()
print(D)
y=D.popleft()
print(D)
print(x,y)

#%% Une table d'hachage est une structure des données permettant de stocker des couples (clé, valeur). En Python, cette structure des données est appelée dictionnainre. Il s'agit d'un objet muable
dico_code={} #création d'un dictionnaire vide, nommé dico_code
dico_code["A"]=1
dico_code["B"]=2
print(dico_code)


#%% Tableaux numpy, la bibliothèque numpy permet d'effecuer du calcul matriciel, objet muable
import numpy as np #permet d'importer la bibliothèqyue numpy rennomée np

M=np.array([[1,2,3,4], [5,6,7,8]]) #tableau à 2 lignes et 4 colonnes
print(M)
print(np.shape(M)) #dimension du tableau M
print(M[1,2]) #Elémént de M d'indice (1,2)
N=np.ones((2,4))
print(N)
print(M+N)

#%% Fonctions
def f(x): #La fontion f(x) calcule le cube de x
    return x*x*x
print("Le cube de 3 vaut", f(3))

def somme(n): #La fonction somme(n) donne 0 si n<=0 et la somme des n premiers entiers sinon
    s=0
    for i in range(n+1) : #Boucle faisant varier i de à à n+1 exclu
        s=s+i
    return  s

print("La somme des 5 premiers entiers est :",somme(5))
print("somme(-5) vaut :", somme(-5))

def euclide(a,b): #Une fonction récursive
    if b==0: #Condition d'arrêt
        return a
    else :
        return euclide(b,a%b) #Appel récursif
print("Le pgcd entre",3, "et",6,"vaut" ,euclide(6,9))

# Si la fonction f1 est définie dans un module (programme en Python) nommé prog.py, pour l'utiliser dans un autre module il faudra importer son contenu par # >>>from prog import f1


#%% Exercice 1 :
# Graphe par matrice d'adjacence : tableau numpy
# import  numpy as np #permet d'importer la bibliothèque numpy rennomée np
#Attention :les sommets d'un graphe sont les entiers de 1 à n
from numpy import *
import numpy as np
#Ex. 1(1)
M =np.array([[0, 0, 0, 1, 1], [1, 0, 0, 0, 1], [1, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 1, 0, 0]])

#Ex. 1(2)
def SuccesseursM(M,i): #SuccesseursM renvoie la liste des successeurs de i pour un graphe G dont la matrice d'adjacence est M
    n = np.shape(M)[0] #nombre de ligne de G = nombre sommets de G
    L =[]
    for j in range(n):
        if M[(i-1),j] > 0 :
            L.append(j+1)
    return(L)
print(M)
print(SuccesseursM(M,1))
print(SuccesseursM(M,2))
print(SuccesseursM(M,3))
print(SuccesseursM(M,4))
print(SuccesseursM(M,5))
print()
def Degré_extM(M,i):
    return(len(SuccesseursM(M,i)))

#Ex. 1(3)

def estchemin(M, L):
    for i in range(0, len(L)-1):
        if M[L[i]-1][L[i+1]-1] != 1:
            return False
    return True

#Ex. 1(4)

def versionNO(M):
    for i in range(0, len(M[0])):
        for j in range(0, len(M[0])):
            M[i][j] = max(M[i][j], M[j][i])
            M[j][i] = max(M[i][j], M[j][i])
    for i in range(0, len(M[0])):
        for j in range(0, len(M[0])):
            print(M[i][j], end = ' ')
        print()
    return M

#versionNO(M)
#Ex. 1(5)
def accessible2(M, i, j):
    for k in range(0, len(M[0])):
        if M[i-1][k] == 1 and M[k][j-1] == 1:
            return True
    return False

#drive mode
#print(accessible2(M, 3, 1))
L1 = [2, 1, 5, 3, 1]
L2 = [4, 3, 5, 1, 4]

#print(Degré_extM(M,1))
#print(Degré_extM(M,3))

#%% Exercice 2 :
# Graphe par dictionnaire

#Ex. 2(1)
dico = dict()
dico[1] = [2, 3, 5]
dico[2] = [1, 5, 9]
dico[3] = [1, 4, 5, 7]
dico[4] = [3, 7]
dico[5] = [1, 2, 3, 6, 8, 9]
dico[6] = [5, 8, 9]
dico[7] = [3, 4, 8]
dico[8] = [5, 6, 7, 9]
dico[9] = [2, 5, 6, 8]

#for key, value in dico.items():
#    print(key, dico[key])

#Ex. 2(2)
def voisins(dico, i):
    print(i, dico[i])
#voisins(dico, 3)

#Ex.2(3)
def degré(dico, i):
    print(i, len(dico[i]))
#degré(dico, 3)

#Ex.2(4)
M =np.array([[0, 0, 0, 1, 1], [1, 0, 0, 0, 1], [1, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 1, 0, 0]])
for i in range(len(M[0])):
    print(M[i])
M = versionNO(M)

def deMaTL(M):
    dico = dict()
    l = len(M[0])
    for i in range(l):
        values = []
        for j in range(l):
            values.append(M[i][j])
        dico[i] = values
    print()
    #for key, value in dico.items():
     #   print(key+1, dico[key])

#deMaTL(M)

#Ex.2(5)
def deTLaM(dico):

    size = max(dico.keys())
    M = np.zeros(shape=(size,size), dtype=np.int64)
    print(M)
    for key, value in dico.items():
        for elem in dico[key]:
            M[key-1][elem-1] = 1

    print()
    print()
    print(M)
deTLaM(dico)

#%% Exercice 3 :
# Coloriage d'un graphe

#%% Exercice 4 :
# Coloriage par fichiers

#%% Exercice 5 :
# Dessin de graphes non orienté
