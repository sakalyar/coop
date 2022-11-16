
(** Signe d'un littéral. *)
type signe = Plus | Moins

type litteral = signe * string
(** Type d'un littéral : produit d'un signe et d'un atome (string). *)

(** Le module Clause permet de manipuler les ensembles
    de littéraux. Il est généré via le foncteur Set.Make. *)
module Clause = Set.Make (struct
  type t = litteral

  let compare = Stdlib.compare
end)

type clause = Clause.t
(** Type synonyme : une clause est un ensemble de littéraux. *)

(** Le module FormeClausale permet de manipuler les ensembles
    de clauses. Il est généré via le foncteur Set.Make. *)
module FormeClausale = Set.Make (struct
  type t = clause

  let compare = Clause.compare
end)

type forme_clausale = FormeClausale.t
(** Type synonyme : une forme clausale est un ensemble de clauses. *)

open Formule

(** Mise en FCC, étape 1 : Transforme une formule en une formule équivalente avec des opérateurs 
    de conjonction, de disjonction, de négation, Bot et Top uniquement. *)
let rec retrait_operateurs = function f ->
	match f with
		| Imp(a, b) -> Ou(Non(retrait_operateurs(a)), retrait_operateurs(b))
		| Et(a, b) -> Et(retrait_operateurs(a), retrait_operateurs(b))
		| Bot -> Bot
		| Top -> Top
		| Ou(a, b) -> Ou(retrait_operateurs(a), retrait_operateurs(b))
		| Non(Non(a)) -> a
		| Non(Top) -> Bot
		| Non(Bot) -> Top
		| Non(Imp(a, b)) -> Et(retrait_operateurs(a), Non(retrait_operateurs(b)))
		| Non(Et(a, b)) -> Ou(Non(a), Non(b))
		| Non(Ou(a, b)) -> Et(Non(a), Non(b))
		| Non(a) -> Non(a)
		| a -> a
		

(** Mise en FCC, étape 2 : Descend les négations dans une formule au plus profond de l'arbre syntaxique,
    en préservant les évaluations. *)

let rec descente_non = function f -> 
	match f with
		 | Non(Ou(a, b)) -> Et(descente_non(Non(a)), descente_non(Non(b)))
		 | Non(Et(a, b)) -> Ou(Non(descente_non(Non(a))), descente_non(Non(b)))
		 | Non(Non(a)) -> descente_non(a)
		 | Non(Bot) -> Top
		 | Non(Top) -> Bot
		 | Et(a, b) -> Et(descente_non(a), descente_non(b))
		 | f -> f


(** Calcule la conjonction de deux formes clausales. *)
(*
let rec fcc_conj a b = function
	| Et(a, b)
*)
(*let rec fcc_conj a b = function f -> 
	match f with
		| fcc_conj(a, b) -> Et(fcc_conj(a), fcc_conj(b))
		| Imp(a, b) -> Ou(non(a), b)*)

let rec fcc_conj a b = function f -> 
	match f with
		| Imp(a, b) -> Ou(Non(a), b)

(** Calcule la disjonction de deux formes clausales. *)
(*let rec fcc_disj = function f ->
	match f with
		| fcc_disj(a, b) -> Ou(fcc_conj(a), fcc_conj(b))
		| Imp(a, b) -> Et(non(a), b)*)
		
let rec fcc_disj = function f ->
	match f with
		| Imp(a, b) -> Et(Non(a), b)

(** Mise en FCC, étape 3 : calcule la forme clausale associée à une formule. *)
let rec formule_to_fcc form = function f ->
	match f with
		

(*: formule -> forme_clausale = fun _ -> failwith "à faire"*)

(** Calcule le résolvant de deux clauses pour un littéral donné :
    resolvant a c1 c2 = (c1 \ a) U (c2 \ a')
    où a' est le littéral opposé à a. *)
let resolvant a c1 c2 = function f ->
	match f with
		union (remove a c1) (remove(Non(a)) c2)
	
		

(** Calcule l'ensemble des résolvants possibles entre deux clauses. *)
(*let resolvants = function f -> failwith "à faire"
	match f with
		| resolvants(a, b) *)

(** Teste si une formule donnée est une contradiction. *)
let is_contradiction f =
  let rec is_contradiction_aux todo cs =
    let one_step c cs =
      FormeClausale.fold
        (fun c' acc ->
          FormeClausale.union acc
            (FormeClausale.filter
               (fun c'' -> not (FormeClausale.mem c'' cs))
               (resolvants c c')))
        cs FormeClausale.empty
    in
    if FormeClausale.is_empty todo then false
    else if FormeClausale.mem Clause.empty todo then true
    else
      let pick = FormeClausale.choose todo in
      let next = one_step pick cs in
      is_contradiction_aux
        (FormeClausale.union (FormeClausale.remove pick todo) next)
        (FormeClausale.add pick cs)
  in
  is_contradiction_aux
    (formule_to_fcc (descente_non (retrait_operateurs f)))
    FormeClausale.empty

(** Transforme un littéral en string. *)
let show_lit : signe * string -> string = fun _ -> failwith "à faire"

(** Transforme une clause en string. *)
let show_clause : clause -> string = fun _ -> failwith "à faire"

(** Transforme une forme clausale en string. *)
let show_fcc : forme_clausale -> string = fun _ -> failwith "à faire"

(** Même résultat que resolvant, mais en affichant une trace du calcul sur la sortie standard. *)
let trace_resolvant : litteral -> clause -> clause -> clause =
 fun _ _ -> failwith "à faire"

(** Même résultat que resolvants, mais en affichant une trace du calcul sur la sortie standard. *)
let trace_resolvants : clause -> clause -> forme_clausale =
 fun _ _ -> failwith "à faire"

(** Même résultat que is_contradiction, mais en affichant une trace du calcul. *)
let is_contradiction_trace f =
  let rec is_contradiction_aux todo cs =
    let trace_one_step c cs =
      FormeClausale.fold
        (fun c' acc ->
          FormeClausale.union acc
            (FormeClausale.filter
               (fun c'' -> not (FormeClausale.mem c'' cs))
               (trace_resolvants c c')))
        cs FormeClausale.empty
    in
    if FormeClausale.is_empty todo then false
    else if FormeClausale.mem Clause.empty todo then true
    else
      let pick = FormeClausale.choose todo in
      Printf.printf "traitement de %s\n" (show_clause pick);
      let next = trace_one_step pick cs in
      is_contradiction_aux
        (FormeClausale.union (FormeClausale.remove pick todo) next)
        (FormeClausale.add pick cs)
  in
  let start = formule_to_fcc (descente_non f) in
  Printf.printf "formule initiale : %s\nfcc initiale : %s\n"
    (string_of_formule f) (show_fcc start);
  is_contradiction_aux start FormeClausale.empty
