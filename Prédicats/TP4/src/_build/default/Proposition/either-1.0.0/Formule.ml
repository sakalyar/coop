(** Type des formules. *)
type formule =
  | Bot
  | Top
  | Atome of string
  | Imp of (formule * formule)
  | Ou of (formule * formule)
  | Et of (formule * formule)
  | Non of formule

(** Fonction de construction d'atome. *)
let atome x = Atome x

(* ----------------- Exercice 1 : Comparaison militaire ----------------- *)

(** Calcule la hauteur de l'arbre syntaxique d'une formule. *)
let hauteur f =
  let rec aux acc = function
    | Bot | Top | Atome _ -> acc+1
    | Imp(f1, f2) | Et(f1, f2) | Ou(f1, f2) -> max (aux (acc+1) f1) (aux (acc+1) f2)
    | Non(f1) -> aux (acc+1) f1
  in aux 0 f;;

let for1 = Et(Ou(Atome "a", Non(Atome "b")), Atome "c");;
hauteur for1;;  
(** Compare militairement deux formules. *)
let compare (f : formule) g =
  let c = compare (hauteur f) (hauteur g) in
  if c = 0 then Stdlib.compare f g else c

(* ----------------- Exercice 2 : Représentation en chaîne de caractères ----------------- *)

(** Conversion d'une formule en chaîne de caractères. *)
let rec string_of_formule = function
  | Atome s -> s
  | Et (f, g) ->
      String.concat ""
        [ "("; string_of_formule f; "∧"; string_of_formule g; ")" ]
  | Ou (f, g) ->
      String.concat ""
        [ "("; string_of_formule f; "∨"; string_of_formule g; ")" ]
  | Bot -> "⊥"
  | Top -> "⊤"
  | Imp (f, g) ->
      String.concat ""
        ["("; string_of_formule f; "→"; string_of_formule g; ")" ]
  | Non g ->
      String.concat ""
        ["¬"; string_of_formule g]

(* ----------------- Exercice 3 : Opérateurs de simplification ----------------- *)

(** Opérateur disjonction, associtif à gauche. *)
let ( + ) f g =
  match (f, g) with
  | Bot, _ -> g
  | _, Bot -> f
  | Top, _ | _, Top -> Top
  | _ -> Ou (f, g)

(** Opérateur de conjonction, associtif à gauche. *)
let ( * ) : formule -> formule -> formule = fun f g -> 
  match (f, g) with
  | Bot, _ -> Bot
  | _, Bot -> Bot
  | Top, g -> g
  | f, Top -> f
  | _ -> Et (f, g)

(** Opérateur d'implication, associtif à droite. *)
let ( ^-> ) : formule -> formule -> formule = fun f g ->
  Ou(Non f, g)

(** Opérateur de négation. *)
let ( ~~ ) : formule -> formule = fun f -> Non f

(** Simplification d'une formule. *)
let simplifier : formule -> formule = fun _ -> failwith "à faire" 

(* ----------------- Exercice 4 : Manipulation des fonctions de construction ----------------- *)

(** Transforme une liste de formules [f1; f2; ... ; fl] en la formule "f1 et f2 et ... et fl". *)
(*let conj_of_list l =
	let rec aux_list_to_and acc l0 = match l0 with
							[] -> acc | [Top] -> Top | Bot::t -> Bot
							| Top::t -> (aux_list_to_and acc t)
							| h::t -> (aux_list_to_and (Et(h, acc)) t)
			in match l with [] -> Top | h::t -> (aux_list_to_and h t);;*)
			
			


(** Transforme une liste de formules [f1; f2; ... ; fl] en la formule "f1 ou f2 ou ... ou fl". *)
(*let disj_of_list l = 
	let rec aux_list_to_and acc l0 = match l0 with
							[] -> acc | [Bot] -> Bot | Top::t -> Top
							| Bot::t -> (aux_list_to_and acc t)
							| h::t -> (aux_list_to_and (Et(h, acc)) t)
			in match l with [] -> Bot | h::t -> (aux_list_to_and h t);;*)

(** ----------------- Exercice 5 : Fonction d'évaluation ----------------- *)

type interpretation = string -> bool
(** Type des interprétations. **)

(*
let eval : interpretation -> formule -> bool = fun _ _ -> failwith "à faire"
*)
let eval : interpretation -> formule -> bool = fun _ _ -> failwith "à faire"

(** Transforme une liste de couples (string * bool) en une interprétation. *)
let interpretation_of_list : (string * bool) list -> interpretation =
 fun _ -> failwith "à faire"

(** Calcule la liste de toutes les listes de Booléens d'une longueur donnée. *)
let all_boolean_lists : int -> bool list list = fun _ -> failwith "à faire"

(** Calcule toutes les interprétations pour une liste d'atomes donnée. *)
let all_interpretation : string list -> interpretation list =
 fun _ -> failwith "à faire"

(** Calcule la liste (triée et sans doublon) des atomes d'une formule.*)
let atomes : formule -> string list = fun _ -> failwith "à faire"

(*226*)
(** Détermine si une formule est satisfaisable. *)
(*
let est_satisfaisable : formule -> bool = fun _ -> failwith "à faire"
*)
(*let est_satisfaisable eqP f : formule -> bool = 
	let l = (list_valuations(symbols_formul eqP f)) in
	(List.exists (function i -> (eval_formul eqP i f)) 1);;*)
(*val est_satisfaisable : ('a -> 'a -> bool) -> 'a formul -> bool = <fun>*)

(** Détermine si une formule est une tautologie. *)
let est_tautologie : formule -> bool = fun _ -> failwith "à faire"

(** Détermine si une formule est une contradiction. *)
let est_contradiction : formule -> bool = fun _ -> failwith "à faire"

(** Détermine si une formule est contingente. *)
let est_contingente : formule -> bool = fun _ -> failwith "à faire"

(** ----------------- Exercice 7 : Tables de vérité ----------------- *)

type ligne = (string * bool) list * (formule * bool) list
(** Type d'une ligne d'une table de vérité. *)

type table = ligne list
(** Type d'une table de vérité. *)

(** Calcule la liste des sous-formules (triée, sans doublon) d'une formule donnée.*)
let sous_formules : formule -> formule list = fun _ -> failwith "à faire"

(** Calcule la table de vérité associée à une formule. *)
let table_of_formule : formule -> table = fun _ -> failwith "à faire"

(** Calcule la formule associée à la dernière colonne d'une table supposée bien formée. *)
let formule_of_table : table -> formule = fun _ -> failwith "à faire"
