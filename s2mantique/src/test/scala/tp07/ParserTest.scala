package tp07

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatestplus.junit.JUnitRunner
import org.scalatest.matchers.must.Matchers
import org.scalatest.matchers.should.Matchers.convertToAnyShouldWrapper

@RunWith(classOf[JUnitRunner])
class ParserTest extends AnyFunSuite with Matchers {
  val parser = new Parser
  import parser._
  val x = Var("x")
  val foo = Var("foo")
  val t : Term = Var("t")
  val t1 : Term = Var("t1")
  val t2 : Term = Var("t2")
  val t3 : Term = Var("t3")
  val typ1 : Typ = Bool
  val typ2 : Typ = Nat
  val typ3 : Typ = Fct(Bool, Nat)
    
  test(""""parse(variable, "x") --> x""") {
    parse(variable, "x") should matchPattern {case Success(`x`, _) => }
  }
  test(""""parse(variable, "foo") --> foo""") {
    parse(variable, "foo") should matchPattern {case Success(`foo`, _) => }
  }
  test(""""parse(variable, "val") --> Failure""") {
    parse(variable, "val") should matchPattern {case Failure(_, _) => }
  }
  test(""""parse(variable, "lambda") --> Failure""") {
    parse(variable, "lambda") should matchPattern {case Failure(_, _) => }
  }
  test(""""parse(variable, "true") --> Failure""") {
    parse(variable, "true") should matchPattern {case Failure(_, _) => }
  }
  test(""""parse(variable, "false") --> Failure""") {
    parse(variable, "false") should matchPattern {case Failure(_, _) => }
  }
  test(""""parse(variable, "if") --> Failure""") {
    parse(variable, "if") should matchPattern {case Failure(_, _) => }
  }
  test(""""parse(variable, "then") --> Failure""") {
    parse(variable, "then") should matchPattern {case Failure(_, _) => }
  }
  test(""""parse(variable, "else") --> Failure""") {
    parse(variable, "else") should matchPattern {case Failure(_, _) => }
  }
  test(""""parse(variable, "succ") --> Failure""") {
    parse(variable, "succ") should matchPattern {case Failure(_, _) => }
  }
  test(""""parse(variable, "pred") --> Failure""") {
    parse(variable, "pred") should matchPattern {case Failure(_, _) => }
  }
  test(""""parse(variable, "iszero") --> Failure""") {
    parse(variable, "iszero") should matchPattern {case Failure(_, _) => }
  }
  
  
  test(""""parse(atom, "foo") --> foo""") {
    parse(atom, "foo") should matchPattern {case Success(`foo`, _) => }
  }
  test(""""parse(atom, "(foo)") --> foo""") {
    parse(atom, "(foo)") should matchPattern {case Success(`foo`, _) => }
  }
  test(""""parse(atom, "false") --> False""") {
    parse(atom, "false") should matchPattern {case Success(False, _) => }
  }
  test(""""parse(atom, "true") --> True""") {
    parse(atom, "true") should matchPattern {case Success(True, _) => }
  }
  test(""""parse(atom, "0") --> Zero""") {
    parse(atom, "0") should matchPattern {case Success(Zero, _) => }
  }
  
  
  test(""""parse(lambda, "lambda x: Bool. t") --> Abs(x, Bool, t)""") {
    parse(lambda, "lambda x: Bool. t") should matchPattern
        {case Success(Abs(`x`, Bool, `t`), _) => }
  }
  
  
  test(""""parse(term, "lambda x: Nat. t") --> Abs(x, Nat, t)""") {
    parse(term, "lambda x: Nat. t") should matchPattern
        {case Success(Abs(`x`, Nat, `t`), _) => }
  }
  test(""""parse(term, "t1 t2 t3") --> App(App(t1, t2), t3)""") {
    parse(term, "t1 t2 t3") should matchPattern
        {case Success(App(App(`t1`, `t2`), `t3`), _) => }
  }
  test(""""parse(term, "t1 t2 lambda x: Nat. t") """
      + """--> App(App(t1, t2), Abs(x, Nat, t))""") {
    parse(term, "t1 t2 lambda x: Nat. t") should matchPattern
        {case Success(App(App(`t1`, `t2`), Abs(`x`, Nat, `t`)), _) => }
  }
  test(""""parse(term, "t1") --> t1""") {
    parse(term, "t1") should matchPattern {case Success(`t1`, _) => }
  }
  test(""""parse(term, "") --> Failure""") {
    parse(term, "") should matchPattern {case Failure(_, _) => }
  }
  
  
  test(""""parse(tTrue, "true") --> True""") {
    parse(tTrue, "true") should matchPattern {case Success(True, _) => }
  }
  test(""""parse(tFalse, "false") --> False""") {
    parse(tFalse, "false") should matchPattern {case Success(False, _) => }
  }  
  test(""""parse(zero, "0") --> Zero""") {
    parse(zero, "0") should matchPattern {case Success(Zero, _) => }
  }
  
  
  test(""""parse(succ, "succ 0") --> Succ(Zero)""") {
    parse(succ, "succ 0") should matchPattern {case Success(Succ(Zero), _) => }
  }  
  test(""""parse(pred, "pred 0") --> Pred(Zero)""") {
    parse(pred, "pred 0") should matchPattern {case Success(Pred(Zero), _) => }
  }
  test(""""parse(isZero, "iszero 0") --> IsZero(Zero)""") {
    parse(isZero, "iszero 0") should matchPattern
        {case Success(IsZero(Zero), _) => }
  }
  test(""""parse(cond, "if true then 0 else succ 0")"
      + " --> Cond(True, Zero, Succ(Zero))""") {
    parse(cond, "if true then 0 else succ 0") should matchPattern
        {case Success(Cond(True, Zero, Succ(Zero)), _) => }
  }
  
  
  test(""""parse(bool, "Bool") --> Bool""") {
    parse(bool, "Bool") should matchPattern {case Success(Bool, _) => }
  }
  test(""""parse(nat, "Nat") --> Nat""") {
    parse(nat, "Nat") should matchPattern {case Success(Nat, _) => }
  }
  
  
  test(""""parse(atomTyp, "Bool") --> Bool""") {
    parse(atomTyp, "Bool") should matchPattern {case Success(Bool, _) => }
  }
  test(""""parse(atomTyp, "Nat") --> Nat""") {
    parse(atomTyp, "Nat") should matchPattern {case Success(Nat, _) => }
  }
  test(""""parse(atomTyp, "(Bool)") --> Bool""") {
    parse(atomTyp, "(Bool)") should matchPattern {case Success(Bool, _) => }
  }
  
  
  test(""""parse(typ, "Bool") --> Bool""") {
    parse(typ, "Bool") should matchPattern {case Success(Bool, _) => }
  }
  test(""""parse(typ, "typ1 -> typ2 -> typ3")"
     + "--> Fct(typ1, Fct(typ2, typ3))""") {
    parse(typ, "Bool -> Nat -> Bool -> Nat") should matchPattern
        {case Success(Fct(`typ1`, Fct(`typ2`, `typ3`)), _) => }
  }
  test(""""parse(typ, "typ1") --> typ1""") {
    parse(typ, "Bool") should matchPattern {case Success(`typ1`, _) => }
  }
  test(""""parse(typ, "") --> Failure""") {
    parse(typ, "") should matchPattern {case Failure(_, _) => }
  }  
}