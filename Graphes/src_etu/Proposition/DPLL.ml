open FCC

(** Simplifie la forme clausale fcc en considérant que le littéral lit est vrai *)
(*let simplif_fcc (_ : forme_clausale) (_ : litteral) : forme_clausale =
  failwith "à faire"*)

(**
	retirer clauses dans a où litteral est positive
	retirer non literal des clauses où il exist
	retourner nouvelle alpha
*)
let simplif_fcc fc lit = function
	match a with
	|  -> 

(** Applique l'algorithme DPLL pour déterminer si une fcc est satisfaisable. *)
let dpll_sat (_ : forme_clausale) : bool = failwith "à faire"

(** Applique l'algorithme DPLL pour déterminer si une fcc est une tautologie. *)
let dpll_tauto (_ : forme_clausale) : bool = failwith "à faire"

(** Applique l'algorithme DPLL pour déterminer si une fcc est une contradiction. *)
let dpll_contra (_ : forme_clausale) : bool = failwith "à faire"

(** Applique l'algorithme DPLL pour déterminer si une fcc est satisfaisable, renvoyant None si ce n'est pas le cas
      et Some res sinon, où res est une liste de couples (atome, Booléen)
      suffisants pour que la formule soit vraie. *)
let dpll_ex_sat (_ : forme_clausale) : (string * bool) list option =
  failwith "à faire"

(** Renvoie la liste des listes de couples (atome, Booléen) suffisants pour que la formule soit vraie,
    selon l'algorithme DPLL. *)
    
    
(**
	a n'a pas de clauses -> retourner vrai
	a a un clause vide - retourner faux
	a contient unit clause -> retourner DPLL(a, literal)
	v <- choisir variable dans a
	DPLL(Simplify(a, v)) - vrai -> retourner vrai
	sinon DPLL(Simplify(a, non v))
*)
let dpll_all_sat (_ : forme_clausale) : (string * bool) list list =
  failwith "à faire"

