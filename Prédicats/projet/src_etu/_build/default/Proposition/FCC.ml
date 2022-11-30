open Formule

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

(** Transforme une forme clausale en string. *)
let string_of_fcc (_ : forme_clausale) : string = failwith "à faire"

(** Mise en FCC, étape 1 : Transforme une formule en une formule équivalente avec des opérateurs 
    de conjonction, de disjonction, de négation, Bot et Top uniquement. *)
let retrait_operateurs (_ : formule) : formule = failwith "à faire"

(** Mise en FCC, étape 2 : Descend les négations dans une formule au plus profond de l'arbre syntaxique,
    en préservant les évaluations. *)
let descente_non (_ : formule) : formule = failwith "à faire"

(** Mise en FCC, étape 3 : calcule la forme clausale associée à une formule. *)
let formule_to_fcc (_ : formule) : forme_clausale = failwith "à faire"

(** Convertit une formule en une forme clausale conjonctive équivalente.*)
let formule_to_fcc f = formule_to_fcc (descente_non (retrait_operateurs f))

(* ----------------- From file ----------------- *)

(** Transforme une chaine +at en (Plus, at) et -at en (Moins, at) *)
let string_to_lit (_ : string) : litteral = failwith "à faire"

(** Transforme une chaine contenant des éléments de la forme
    +at ou -at séparés par des espaces ou tabulations en une clause contenant
    les littéraux obtenus en appliquant string_to_lit sur chaque élément *)
let string_to_disj (_ : string) : clause = failwith "à faire"

(** Transforme un fichier texte dont le nom est donné en paramètre et dont chaque ligne est une chaine
    contenant des éléments de la forme
    +at ou -at séparés par des espaces ou tabulations en la FCC contenant les clauses obtenues
    en appliquant string_to_disj sur chaque ligne *)
let from_file (_ : string) : forme_clausale = failwith "à faire"
