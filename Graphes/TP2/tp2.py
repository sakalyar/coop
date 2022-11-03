
'''
Sakal Yaroslav.
J'ai oublié de mettre à jour le fichier précedent.
Dans l'archive au-dessus vous pouvez trouver un fichier identique, téléchargé sur github il y a une semaine

'''

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

#Graphe orienté sans circuits
d = dict()
dico = dict()
dico[1] = { 2, 3, 4}
dico[2] = {4}
dico[3] = {4}
dico[4] = {5}
dico[5] = {}

def Noyau(G):
    N = []
    CN = []

    dico = G
    print(dico)
    print()
    while len(dico):
        for i in dico:
            if i not in N and (dico[i] == {} or dico[i] == set()):
                N.append(i)
                for j in dico:
                    if i in dico[j] and j not in CN:
                        CN.append(j)
        for i in dico:
            s = dico[i]
            for j in CN:
                if j in s:
                    s.remove(j)
            dico[i] = s
        for i in N:
            if i in dico:
                del dico[i]
        for i in CN:
            if i in dico:
                del dico[i]


    print("Le noyau: ", N)
    print("Le complémentaire d'un noyau: ", CN)

#graphe est repsrésenté par le dictionnaire

Noyau(dico)

#%% Exercice 2 :

d = dict()

d[1] = {2, 3}
d[2] = {6}
d[3] = {11}
d[4] = {}
d[5] = {6}
d[6] = {7, 8}
d[7] = {11}
d[8] = {16}
d[9] = {11}
d[10] = {11}
d[11] = {12, 15}
d[12] = {16}
d[13] = {}
d[14] = {16}
d[15] = {16}
d[16] = {}
N = []

def Noyau(G):
    N = []
    CN = []

    dico = G
    while len(dico):
        for i in dico:
            if i not in N and (dico[i] == {} or dico[i] == set()):
                N.append(i)
                for j in dico:
                    if i in dico[j] and j not in CN:
                        CN.append(j)

        for i in dico:
            s = dico[i]
            for j in CN:
                if j in s:
                    s.remove(j)
            dico[i] = s
        for i in N:
            if i in dico:
                del dico[i]
        for i in CN:
            if i in dico:
                del dico[i]

    N.sort()
    #print("Le noyau: ", N)
    #print("Le complémentaire d'un noyau: ", CN)
    return N

N = Noyau(d)

def prog(N0):
    N = N0
    #Il n'est pas utile de prendre en compte les sommets 4 et 13:
    N.remove(4)
    N.remove(13)
    gauche = 3
    droite = 3
    #position dans notre graphe
    ind = 0
    pos = N[ind]
    c = ''
    started = False
    while gauche+droite > 0:
        if not started:
            print("Il y a ", end='')
        else:
            print("Il y reste ", end='')
        print(gauche, "allumettes à gauche et ", droite, " allumettes à droite")
        print("Choisissez un tas : g pour gauche et d pour droite")
        c = input()
        if c != 'g' and c != 'd':
            print("Entrée non valide. Veillez réessayer en choissant une option correcte")
            continue
        print("Choisissez combien d'allumettes vous voudriez retirer")
        d = int(input())
        if d > 2 or d < 1 or d > gauche:
            print("Entrée non valide. Veillez réessayer en choissant une option correcte")
            continue
        ind += d
        pos = N[ind]
        gauche -= d
        droite -= d
        started = True
    print("L'ordinateur a gagné")

prog(N)

#%% Exercice 3 :

class Cellule:
    def __init__(self, sommet, prec, suiv):
        self.sommet = sommet
        self.prec = prec
        self.suiv = suiv

#cell = Cellule(1, 2, 3)
#print(cell.som, cell.p, cell.q)

def Konig(c, fin : Cellule, s):
    p = Cellule(None, None, None)
    q = Cellule(None, None, None)
    p = c
    q = fin

    #print("WORKED")
    if p == None:
        s = None
    else:
        while p.sommet != q.sommet:
            q = q.prec
        p.sommet = q.sommet
        s.append(Cellule(q.sommet, q.prec, q.suiv).sommet)
        if q.suiv == None:
            return s
        s = Konig(q.suiv, fin, s)

        return s

first = Cellule(1, None, second)
second = Cellule(2, first, third)
third = Cellule(1, second, forth)
forth = Cellule(4, third, fifth)
fifth = Cellule(2, forth, sixth)
sixth = Cellule(3, fifth, seventh)
seventh = Cellule(4, sixth, eighth)
eighth = Cellule(6, seventh, ninth)
ninth = Cellule(3, eighth, tenth)
tenth = Cellule(7, ninth, None)

s2 = Konig(first, tenth, [])

print("Le chemin cherché: ", s2)

#%% Exercice 4 :



