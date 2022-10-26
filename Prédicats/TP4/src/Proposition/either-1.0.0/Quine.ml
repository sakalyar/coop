(*open Formule

(** Substitue une formule g à un atome s dans une formule. *)
(*let rec subs :(g: formule) (s: atome ) ( f: formule ):formule=match f with
    | atome s' when s'=s ->g
    |(Bot /Top/Atome_) as f->f
    |Et ( f1,f2)->Et(subst f1 s g ,subst f2 s g)
    |Imp( f1,f2)-> Imp(subst f1 s g , f2 s g)
    |Ou ( f1,f2) -> Ou(subst f1 s g , f2 s g)
    |Non(f') -> Non(subs f' s g);;
*)

(** Choisit un atome d'une formule, renvoyant None si aucun n'est présent.*)
let rec  choix_atome(f: formule): string option =match f with
       | Atome s -> Some s
       | Bot |Top -> None
       |Non f' -> choix_atome f'
       |Et(f1,f2)|OU(f1,f2)|Imp(f1,f2)->match choix_atome f1 with
           |None ->choix_atome f2
           |a-> a;;
(** Simplifie une formule d'une manière paresseuse. *)
let rec simplif_quine(f: formule) :formule  =match f with
    |Bot| Top|Atome_) as f ->f
    |Et (f1,f2) -> (match simplif_quine f1 with
                       |Bot -> Bot
                       |Top -> simplif_quine f2
                       |f1->(match simplif_quine f2 with
                             |Bot -> Bot
                             |Top -> f1'
                             |f2'-> Et (f1',f2'))
    |Non(f) -> (match simplif_quine f with
                   |Top -> Bot
                   |Bot -> Top
                   |f' -> non f'
    | Ou (f1,f2) -> (Match simplif_quine f1 with
                   | Bot -> simplif_quine f2
                   | Top -> Top
                   |f1'-> (match simplif_quine f2 with
                           | Top -> Top
                           | Bot -> f1'
                           |f2' -> Ou
                       
(** Teste si une formule est satisfaisable, selon l'algorithme de Quine. *)
let quine_sat : formule -> bool = fun _ -> failwith "à faire"

(** Teste si une formule est une tautologie, selon l'algorithme de Quine. *)
let quine_tauto : formule -> bool = fun _ -> failwith "à faire"

(** Teste si une formule est une contradiction, selon l'algorithme de Quine. *)
let quine_contra : formule -> bool = fun _ -> failwith "à faire"

(** Teste si une formule est satisfaisable, renvoyant None si ce n'est pas le cas
      et Some res sinon, où res est une liste de couples (atome, Booléen)
      suffisants pour que la formule soit vraie. *)
let quine_ex_sat : formule -> (string * bool) list option =
 fun _ -> failwith "à faire"

(** Renvoie la liste des listes de couples (atome, Booléen) suffisants pour que la formule soit vraie,
    selon la formule de Quine.*)
let quine_all_sat : formule -> (string * bool) list list =
 fun _ -> failwith "à faire"*)
