(*
open DPLL
open Formule
open FCC

let a = atome "a"
let b = atome "b"
let c = atome "c"
let h1 = (a ^-> b ^-> c) ^-> (a ^-> b) ^-> a ^-> c
let h2 = Ou (Et (a * b, Bot), Bot)
let h3 = Non h1
let h4 = Non (Ou (h1, Et (h2, Imp (Non h3, h2))))
let h5 = Ou (h1, Et (h2, Imp (Non h3, h2)))
let test_sat f = dpll_ex_sat (formule_to_fcc f)
let test_all_sat f = dpll_all_sat (formule_to_fcc f)

let test_input_formule file =
  let f = Formule.from_file file in
  (string_of_formule f, dpll_ex_sat (formule_to_fcc f))

let test_input_fcc file =
  let f = FCC.from_file file in
  (string_of_fcc f, dpll_ex_sat f)
  *)
