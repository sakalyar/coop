'''Sakal Yaroslav'''

#%% Exercice 1 :

def ResoudreHuitReines(n):
    col = set()
    DAL = set()
    DDL = set()

    res = []
    tableau = [["."] * n for i in range(n)]

    def HuitReines(l):
        if l == n:
            copy = ["".join(ligne) for ligne in tableau]
            res.append(copy)
            return
        for c in range(n):
            #Verifier si la reine ne peut pas etre placée dans la cellule
            if c in col or (l+c) in DAL or (l-c) in DDL:
                continue

            col.add(c)
            DAL.add(l+c)
            DDL.add(l-c)
            tableau[l][c] = "R"

            #Backtracking:
            HuitReines(l+1)
            col.remove(c)
            DAL.remove(l+c)
            DDL.remove(l-c)
            tableau[l][c] = "."
    HuitReines(0)
    #retourner l'une des solutions
    return res[0]


cnt = 1
for i in ResoudreHuitReines(8):
    print(cnt, "  ", end='')
    for j in i:
        print(j, "  ", end='')
    cnt+=1


#%% Exercice 2 :
class Solution:
    def knightTour(self, N):
        def isSafe(x, y):
            # Vérifiez que la cellule (x, y) n'est pas OOB et que la valeur n'est pas déjà visitée
            if 0 <= x < N and 0 <= y < N and board[x][y] == -1:
                return True
            return False

        def backtrack(cur_x, cur_y, moveCount):
            # 1) Base case
            if moveCount >= N*N:
                return True

            # 2) Breath: --> Considerer tous les chemins possibles
            for i in range(8):
                next_x = cur_x + move_x[i]
                next_y = cur_y + move_y[i]

                # 3) Vérifier si ce chemin peut etre pris
                if isSafe(next_x, next_y):
                    # 4) Prendre ce chemin
                    board[next_x][next_y] = moveCount

                    # 5) Vérifier si ce chemin mène vers la solution
                    if backtrack(next_x, next_y, moveCount+1):
                        return True

                    # 6) Backtracking
                    board[next_x][next_y] = -1

            return False

        # Initialiser NxN chess board
        board = [[-1 for i in range(N)] for j in range(N)]

        # Déplacements possibles d'un cavalier sur l'échiquier, coordonnées X et Y
        move_x = [2, 1, -1, -2, -2, -1, 1, 2]
        move_y = [1, 2, 2, 1, -1, -2, -2, -1]

        board[0][0] = 0         # commencer par le chevalier est initialement au premier bloc
        backtrack(0, 0, 1)
        return board


s = Solution()

x = s.knightTour(8)
for i in x:
    print(i)


