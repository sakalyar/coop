(** Coordonnée d'une case de Sudoku.
    Coord (x, y) avec x et y compris entre 1 et 9. *)
type coord = Coord of (int * int)

(** Type des cases de Sudoku.
       1 coordonnée et un entier compris entre 1 et 9.
       La case Case (Coord(x, y), k) correspond à la case (x, y)
       remplie par k. *)
type case = Case of (coord * int)

(** Conversion d'une case en string. *)
let string_of_case (Case (Coord (x, y), k)) = Printf.sprintf "%d-%d-%d" x y k

(** i -- j est la liste croissante des entiers de i à j. *)
let ( -- ) i j = List.init (j - i + 1) (( + ) i)

(** Liste de toutes les cases d'un Sudoku. *)
let cases =
  List.concat_map
    (fun y -> List.concat_map (fun x -> [ Coord (x, y) ]) (1 -- 9))
    (1 -- 9)

(** Liste des cases de la y-eme ligne d'un Sudoku, pour y compris entre 1 et 9. *)
let ligne y = List.map (fun x -> Coord (x, y)) (1 -- 9)

(** Liste des cases de la x-eme colonne d'un Sudoku, pour x compris entre 1 et 9. *)
let colonne x = List.map (fun y -> Coord (x, y)) (1 -- 9)

(** Liste des cases du bloc haut gauche d'un Sudoku. *)
let bloc_1 =
  List.concat_map
    (fun y -> List.concat_map (fun x -> [ Coord (x, y) ]) (1 -- 3))
    (1 -- 3)

(** Décalage des cases du bloc haut gauche d'un Sudoku. *)
let shift_bloc_1 d_x d_y =
  List.map (fun (Coord (x, y)) -> Coord (x + d_x, y + d_y)) bloc_1

(** Liste des cases du bloc haut centre d'un Sudoku. *)
let bloc_2 = shift_bloc_1 3 0

(** Liste des cases du bloc haut droit d'un Sudoku. *)
let bloc_3 = shift_bloc_1 6 0

(** Liste des cases du bloc centre gauche d'un Sudoku. *)
let bloc_4 = shift_bloc_1 0 3

(** Liste des cases du bloc centre centre d'un Sudoku. *)
let bloc_5 = shift_bloc_1 3 3

(** Liste des cases du bloc centre droit d'un Sudoku. *)
let bloc_6 = shift_bloc_1 6 3

(** Liste des cases du bloc bas gauche d'un Sudoku. *)
let bloc_7 = shift_bloc_1 0 6

(** Liste des cases du bloc bas centre d'un Sudoku. *)
let bloc_8 = shift_bloc_1 3 6

(** Liste des cases du bloc bas droit d'un Sudoku. *)
let bloc_9 = shift_bloc_1 6 6
