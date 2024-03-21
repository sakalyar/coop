package tp07

import scala.collection.immutable.ListMap

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatestplus.junit.JUnitRunner
import org.scalatest.PrivateMethodTester
import org.scalatest.matchers.must.Matchers
import org.scalatest.matchers.should.Matchers.should
import TypeChecker._

@RunWith(classOf[JUnitRunner])
class TypeCheckerTest extends AnyFunSuite with Matchers with PrivateMethodTester {
  val typeChecker = new TypeChecker
  val privateCheckType = PrivateMethod[OptTyp](Symbol("checkType"))
  import typeChecker._

  val x = Var("x")
  val n = Var("n")
  val f = Var("f")

  test("|- true : Bool") {
    assert(checkType(True) === SomeTyp(Bool))
  }
  test("|- false : Bool") {
    assert(checkType(False) === SomeTyp(Bool))
  }
  test("|- 0 : Nat") {
    assert(checkType(Zero) === SomeTyp(Nat))
  }
  
  
  test("|- 1 : Nat") {
    assert(checkType(Succ(Zero)) === SomeTyp(Nat))
  }
  test("|- succ true : NoTyp(...)") {
    checkType(Succ(True)) should matchPattern {case NoTyp(_) => }
  }
  
  
  test("|- pred 0 : Nat") {
    assert(checkType(Pred(Zero)) === SomeTyp(Nat))
  }
  test("|- pred true : NoTyp(...)") {
    checkType(Pred(True)) should matchPattern {case NoTyp(_) => }
  }
  
  
  test("|- iszero 0 : Bool") {
    assert(checkType(IsZero(Zero)) === SomeTyp(Bool))
  }
  test("|- iszero true : NoTyp(...)") {
    checkType(IsZero(True)) should matchPattern {case NoTyp(_) => }
  }
  
  
  test("|- val n = 1 : Nat") {
    assert(checkType(Val(n, Succ(Zero))) === SomeTyp(Nat))
  }
  
  
  test("(x->Bool) |- x : Bool") {
    val gamma = ListMap(x -> Bool)
    assert((typeChecker invokePrivate privateCheckType(x, gamma))
        === SomeTyp(Bool))
  }
  
  
  test("|- if true then 0 else 1 : Nat") {
    val cond = Cond(True, Zero, Succ(Zero))
    assert(checkType(cond) === SomeTyp(Nat))
  }
  test("|- if true then 0 else false : NoTyp(...)") {
    val cond = Cond(True, Zero, False)
    checkType(cond) should matchPattern {case NoTyp(_) => }
  }
  test("|- if true then 0 else (succ true) : NoTyp(...)") {
    val cond = Cond(True, Zero, Succ(True))
    checkType(cond) should matchPattern {case NoTyp(_) => }
  }
  test("|- if true then (succ true) else 0 : NoTyp(...)") {
    val cond = Cond(True, Succ(True), Zero)
    checkType(cond) should matchPattern {case NoTyp(_) => }
  }
  test("|- if 0 then true else false : NoTyp(...)") {
    val cond = Cond(Zero, True, False)
    checkType(cond) should matchPattern {case NoTyp(_) => }
  }
  test("|- if (succ true) then true else false : NoTyp(...)") {
    val cond = Cond(Succ(True), True, False)
    checkType(cond) should matchPattern {case NoTyp(_) => }
  }
  
  
  test("|- lambda x : Bool. x) : Bool -> Bool") {
    val abs = Abs(x, Bool, x)
    assert(checkType(abs) === SomeTyp(Fct(Bool,Bool)))
  }
  test("(f -> (Bool -> Nat)) |- lambda x : Bool. f x : Bool -> Nat") {
    val abs = Abs(x, Bool, App(f, x))
    val gamma = ListMap(f -> Fct(Bool, Nat))
    assert((typeChecker invokePrivate privateCheckType(abs, gamma))
        === SomeTyp(Fct(Bool, Nat)))
  }
  test("|- lambda x : Bool. succ x : NoTyp(...)") {
    val abs = Abs(x, Bool, Succ(x))
    checkType(abs) should matchPattern {case NoTyp(_) => }
  }
  
  
  test("|- (lambda n : Nat. succ n) 0 : SomeTyp(Nat)") {
    val app = App(Abs(n, Nat, Succ(n)), Zero)
    assert(checkType(app) === SomeTyp(Nat))
  }
  test("|- (lambda n : Nat. succ n) true : NoTyp(...)") {
    val app = App(Abs(n, Nat, Succ(n)), True)
    checkType(app) should matchPattern {case NoTyp(_) => }
  }
  test("|- (lambda n : Nat. succ n) (succ true) : NoTyp(...)") {
    val app = App(Abs(n, Nat, Succ(n)), Succ(True))
    checkType(app) should matchPattern {case NoTyp(_) => }
  }
  test("|- 0 true : NoTyp(...)") {
    val app = App(Zero, True)
    checkType(app) should matchPattern {case NoTyp(_) => }
  }
  test("|- (succ true) true : NoTyp(...)") {
    val app = App(Succ(True), True)
    checkType(app) should matchPattern {case NoTyp(_) => }
  }
}