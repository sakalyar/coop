open Proposition
open Formule
open DPLL
open FCC
open Case
open Adapteurs

(** contrainte 1 : les cases ne peuvent être remplies qu'une seule fois*)
let contrainte_1 =
  List.map
    (fun c ->
      unSeul (List.map (fun k -> Atome (string_of_case (Case (c, k)))) (1 -- 9)))
    cases

(** contrainte 2 : les lignes doivent contenir les entiers de 1 à 9 une seule fois. *)
let contrainte_2 =
  List.concat_map
    (fun l ->
      List.map
        (fun k ->
          unSeul (List.map (fun c -> Atome (string_of_case (Case (c, k)))) l))
        (1 -- 9))
    (List.map ligne (1 -- 9))

(** contrainte 3 : les colonnes doivent contenir les entiers de 1 à 9 une seule fois. *)
let contrainte_3 =
  List.concat_map
    (fun l ->
      List.map
        (fun k ->
          unSeul (List.map (fun c -> Atome (string_of_case (Case (c, k)))) l))
        (1 -- 9))
    (List.map colonne (1 -- 9))

(** contrainte 4 : les blocs doivent contenir les entiers de 1 à 9 une seule fois. *)
let contrainte_4 =
  List.concat_map
    (fun l ->
      List.map
        (fun k ->
          unSeul (List.map (fun c -> Atome (string_of_case (Case (c, k)))) l))
        (1 -- 9))
    [ bloc_1; bloc_2; bloc_3; bloc_4; bloc_5; bloc_6; bloc_7; bloc_8; bloc_9 ]

(** Contraintes du Sudoku. *)
let contraintes = contrainte_1 @ contrainte_2 @ contrainte_3 @ contrainte_4

(** Transforme une string s = c1 . ... . cn
    en une liste de cases [Case(Coord(1,y), c1); ...; Case(Coord(1,y), c9)].
    Si un ci est différent d'un caractère entre '1' et '9',
    la case est ignorée. Idem pour les caractères au dela du 9ème. *)
let line_from_string y s =
  let s' = if String.length s > 9 then String.sub s 0 9 else s in
  String.to_seqi s' |> List.of_seq
  |> List.filter_map (fun (x, c) ->
         match c with
         | '1' .. '9' ->
             Some
               (Case (Coord (Stdlib.( + ) x 1, y), int_of_char c - Char.code '0'))
         | _ -> None)

(** Convertit une liste de string en une liste de cases,
    en considérant la position de la string dans la liste
    comme coordonnée y. *)
let line_from_strings (xs : string list) =
  List.mapi (fun y s -> (Stdlib.( + ) y 1, s)) xs
  |> List.concat_map (fun (y, s) -> line_from_string y s)

(** Convertit une liste de lignes de Sudoku au format string
    en une formule Booléenne. *)
let ex_to_formule ex =
  let rec take k xs =
    match (k, xs) with 0, _ | _, [] -> [] | k, y :: ys -> y :: take (k - 1) ys
  in
  tous
    ((ex |> take 9 |> line_from_strings
     |> List.map (fun c -> Atome (string_of_case c)))
    @ contraintes)

(** Exemple de Sudoku simple.*)
let ex_simple =
  ex_to_formule
    [
      "56    28 ";
      "   2 9 45";
      " 7  8    ";
      "3 8 52417";
      "1 579362 ";
      "7 6     9";
      "91  26   ";
      "2       4";
      " 5 8 71  ";
    ]

(** Exemple de Sudoku medium.*)
let ex_medium =
  ex_to_formule
    [
      "6 8    5 ";
      "    4    ";
      "   5 8  3";
      " 2    4  ";
      " 4 2  538";
      " 8     6 ";
      " 17 26 4 ";
      " 9 8  7 6";
      "26  73 9 ";
    ]

(** Exemple de Sudoku difficile.*)
let ex_diff =
  ex_to_formule
    [
      " 1  892  ";
      " 8   5 3 ";
      " 9     7 ";
      "  6  2 4 ";
      "  54  7  ";
      "   97    ";
      "         ";
      "  3  8 2 ";
      " 5   4  1";
    ]

(** Exemple de Sudoku expert.*)
let ex_expert =
  ex_to_formule
    [
      "  1      ";
      "  89    4";
      "6      18";
      "    4 9  ";
      "73    5  ";
      "   7   6 ";
      " 2   6   ";
      "   418   ";
      " 65  9   ";
    ]

(** Exemple de Sudoku très difficile.*)
let ex_tres_diff =
  ex_to_formule
    [
      "4      9 ";
      "     3   ";
      " 9 2 7  1";
      "    6    ";
      "  8   5  ";
      " 4 1 9  7";
      "    4   6";
      "5  6 27  ";
      " 2  3    ";
    ]

(** Résoud une formule dont les atomes sont sous le format "%d-%d-%d"    
    et renvoie le résultat sous la forme d'une liste d'entiers contenus dans les cases. *)
let solve_sudoku_form form =
  let debut = Sys.time () in
  let la_fcc =
    print_endline "Début du calcul de la fcc";
    formule_to_fcc form
  in
  print_endline
    (Printf.sprintf "Fin du calcul de la fcc (%f s) (%n clauses)"
       (Sys.time () -. debut)
       (FormeClausale.cardinal la_fcc));
  Option.map
    (fun l ->
      l
      |> List.filter (fun (_, b) -> b)
      |> List.sort (fun (s, _) (s', _) ->
             let t = Scanf.sscanf s "%d-%d-%d" (fun x y k -> (y, x, k))
             and t' = Scanf.sscanf s' "%d-%d-%d" (fun x y k -> (y, x, k)) in
             Stdlib.compare t t')
      |> List.map (fun (s, _) -> Scanf.sscanf s "%d-%d-%d" (fun _ _ k -> k)))
    (dpll_ex_sat la_fcc)

let solve_sudoku_simple () = solve_sudoku_form ex_simple
let solve_sudoku_medium () = solve_sudoku_form ex_medium
let solve_sudoku_diff () = solve_sudoku_form ex_diff
let solve_sudoku_expert () = solve_sudoku_form ex_expert
let solve_sudoku_tres_diff () = solve_sudoku_form ex_tres_diff

(** Exécute une fonction renvoyant (peut-être) une liste d'entiers et affiche
    le résultat 9 chiffres par lignes. *)
let print_res r =
  Option.iter
    (List.iteri (fun x k ->
         Printf.printf (if x mod 9 = 8 then "%d\n" else "%d") k))
    (r ())

(** Boucle principale *)
let main () =
  if Array.length Sys.argv = 2 then
    match Sys.argv.(1) with
    | "0" -> print_res solve_sudoku_simple (* 1 sec *)
    | "1" -> print_res solve_sudoku_medium (* 35 sec *)
    | "2" -> print_res solve_sudoku_diff (* 1m16 sec *)
    | "3" -> print_res solve_sudoku_expert (* 22 min *)
    | "4" -> print_res solve_sudoku_tres_diff (* 16 min *)
    | fic -> (
        let c = Arg.read_arg fic |> Array.to_list in
        try print_res (fun () -> ex_to_formule c |> solve_sudoku_form)
        with e -> raise e)
  else
    print_string
      "Usage\n\n\
      \  rentrez un unique paramètre :\n\n\
      \  0 -> simple\n\
      \  1 -> medium\n\
      \  2 -> difficile\n\
      \  3 -> expert\n\
      \  4 -> très difficile\n\
      \  nom_fichier -> ouvre le fichier nom_fic au format grille de sudoku"
;;

main ()
