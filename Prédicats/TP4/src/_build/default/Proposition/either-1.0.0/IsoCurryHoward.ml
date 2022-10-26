type bot = |
type ('a, 'b) et = 'a * 'b
type ('a, 'b) ou = ('a, 'b) Either.t
type ('a, 'b) imp = 'a -> 'b
type 'a non = 'a -> bot

open Either

(* Exercice 1 : règles introduction *)
(*let imp_intro : ('a -> 'b) -> 'a -> 'b = Fun.id
let et_intro : 'a * 'b -> 'a * 'b = Fun.id
let ou_intro_g : 'a -> ('a, 'b) Either.t = fun _ -> 
let ou_intro_d : 'b -> ('a, 'b) Either.t = fun _ -> failwith "à faire"
*)

let imp_intro : ('a -> 'b) -> 'a -> 'b = Fun.id
let et_intro : 'a * 'b -> 'a * 'b = Fun.id
let ou_intro_g : 'a -> ('a, 'b) Either.t = function a -> Left a;;
let ou_intro_d : 'b -> ('a, 'b) Either.t = function b -> Right b;;

(* Exercice 2 : règles d'élimination *)
let rec bot_elim (bot : bot) = bot_elim bot

(*let ou_elim : ('a, 'b) Either.t * ('a -> 'c) * ('b -> 'c) -> 'c =
 fun _ -> failwith "à faire"*)
 
let ou_elim (ab, f, g) = match ab with 
						| Left a -> f a 
						| Right b -> g b;;

(*let imp_elim : ('a -> 'b) *'a -> b = fun x = fst (x) (snd x)*)
						
let et_elim_g : 'a * 'b -> 'a = fun x -> fst x
let et_elim_d : 'a * 'b -> 'b = fun x -> snd x

(* Exercice 3 : déduction naturelle *)

(* Exemple : principe de non-contradiction *)
(*let non_contra : 'a * ('a -> bot) -> bot = fun (a, non_a) -> non_a a
?
let non_contra' : 'a * ('a -> bot) -> bot =
 fun a_et_non_a -> imp_elim (et_elim_d a_et_non_a, et_elim_g a_et_non_a)*)

(*let f1 : 'a -> 'a = fun a -> a*)
										
let f3 : ('a, 'b) ou -> ('b, 'a) ou = fun _ -> failwith "à faire"
let f4 : 'a * 'b -> 'b * 'a = fun _ -> failwith "à faire"
let f5 : 'a * 'b -> ('a, 'b) ou = fun _ -> failwith "à faire"
let f6 : 'a -> 'a non non = fun _ _ -> failwith "à faire"
let f7 : ('a non, 'b) ou -> 'a -> 'b = fun _ _ -> failwith "à faire"
let f8 : ('a * 'b -> 'c) -> 'a -> 'b -> 'c = fun _ _ _ -> failwith "à faire"
let f9 : ('a -> 'b -> 'c) -> 'a * 'b -> 'c = fun _ _ -> failwith "à faire"
let f10 : ('a non, 'b non) ou -> ('a * 'b) non = fun _ _ -> failwith "à faire"
let f11 : 'a non * 'b non -> ('a, 'b) ou non = fun _ _ -> failwith "à faire"
let f12 : 'a -> 'b -> 'a = fun _ _ -> failwith "à faire"

let f13 : ('a -> 'b -> 'c) -> ('a -> 'b) -> 'a -> 'c =
 fun _ _ _ -> failwith "à faire"

let f14 : ('a -> 'b) -> 'b non -> 'a non = fun _ _ _ -> failwith "à faire"
let f15 : ('a -> 'b non) -> 'b -> 'a non = fun _ _ _ -> failwith "à faire"
let f16 : 'a -> 'a non -> 'b = fun _ _ -> failwith "à faire"

let f17 : 'a * ('b, 'c) ou -> ('a * 'b, 'a * 'c) ou =
 fun _ -> failwith "à faire"

let f18 : ('a * 'b, 'a * 'c) ou -> 'a * ('b, 'c) ou =
 fun _ -> failwith "à faire"

let f19 : ('a, 'b * 'c) ou -> ('a, 'b) ou * ('a, 'c) ou =
 fun _ -> failwith "à faire"

let f20 : ('a, 'b) ou * ('a, 'c) ou -> ('a, 'b * 'c) ou =
 fun _ -> failwith "à faire"

let f21 : ('a -> 'b) -> ('a * 'b non) non = fun _ _ -> failwith "à faire"
let f22 : ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c = fun _ _ _ -> failwith "à faire"
let f23 : 'a non non non -> 'a non = fun _ _ -> failwith "à faire"
let f24 : ('a, 'a non) ou non non = fun _ -> failwith "à faire"
let f25 : ('a, 'b) ou non -> 'a non * 'b non = fun _ -> failwith "à faire"

(* Exercice 4 : déduction naturelle et tiers exclu *)
type 'a tiers_exclu = ('a, 'a non) ou

let g1 : 'a tiers_exclu -> ('a non -> 'b non) -> 'b -> 'a =
 fun _ _ _ -> failwith "à faire"

let g2 : 'a tiers_exclu -> ('a non -> 'b) -> 'b non -> 'a =
 fun _ _ _ -> failwith "à faire"

let g3 : 'a tiers_exclu -> ('a -> 'b, 'b -> 'a) ou = fun _ -> failwith "à faire"

(* g4 à ne pas faire : pas besoin du tiers exclu.
   formule remplacée par f25, exercice 3*)
(* let g4 : 'a tiers_exclu -> 'b tiers_exclu -> ('a, 'b) ou non -> 'a non * 'b non
      =
   fun _ _ _ -> failwith "à faire" *)

let g5 :
    'a tiers_exclu -> 'b tiers_exclu -> ('a, 'b) et non -> ('a non, 'b non) ou =
 fun _ _ _ -> failwith "à faire"

let g6 : 'a tiers_exclu -> 'a non non -> 'a = fun _ _ -> failwith "à faire"

let g7 : 'a tiers_exclu -> ('a -> 'b) -> ('a non, 'b) ou =
 fun _ _ -> failwith "à faire"

let g8 : 'a tiers_exclu -> ('a -> 'b) tiers_exclu -> (('a -> 'b) -> 'a) -> 'a =
 fun _ _ _ -> failwith "à faire"

let g9 : 'b tiers_exclu -> ('a * 'b non) non -> 'a -> 'b =
 fun _ _ _ -> failwith "à faire"
