package tp07

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatestplus.junit.JUnitRunner
import org.scalatest.PrivateMethodTester

@RunWith(classOf[JUnitRunner])
class EvaluatorTest extends AnyFunSuite with PrivateMethodTester {
  val evaluator = new Evaluator
  val eval = PrivateMethod[Term](Symbol("eval"))
  import evaluator._
  val v = Var("v")
  val x = Var("x")
  val y = Var("y")  
  val id = Abs(x, Bool, x)
  val omega = Abs(y, Fct(Nat, Nat), App(y, y))
  
  test("id id --> id") {
    val init = App(id, id)
    val result = id
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("omega id --> id id") {
    val init = App(omega, id)
    val result = App(id, id)
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("omega (id id) --> omega id") {
    val init = App(omega, App(id, id))
    val result = App(omega, id)
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("id omega (id id) --> omega (id id)") {
    val init = App(App(id, omega), App(id, id))
    val result = App(omega, App(id, id))
    assert((evaluator invokePrivate eval(init)) === result)
  }
  
  
  test("val v = id id --> val v = id") {
    val init = Val(v, App(id, id))
    val result = Val(v, id)
    assert((evaluator invokePrivate eval(init)) === result)
  }

  
  test("if true then 0 else 1 --> 0") {
    val init = Cond(True, Zero, Succ(Zero))
    val result = Zero
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("if true then iszero 0 else false --> iszero 0") {
    val init = Cond(True, IsZero(Zero), False)
    val result = IsZero(Zero)
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("if false then 0 else pred 0 --> pred 0") {
    val init = Cond(False, Zero, Pred(Zero))
    val result = Pred(Zero)
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("if iszero 0 then pred succ 0 else pred 0"
      + "--> if true then pred succ 0 else pred 0") {
    val init = Cond(IsZero(Zero), Pred(Succ(Zero)), Pred(Zero))
    val result = Cond(True, Pred(Succ(Zero)), Pred(Zero))
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("if iszero pred 0 then 0 else 0 --> if iszero 0 then 0 else 0") {
    val init = Cond(IsZero(Pred(Zero)), Pred(Succ(Zero)), Pred(Zero))
    val result = Cond(IsZero(Zero), Pred(Succ(Zero)), Pred(Zero))
    assert((evaluator invokePrivate eval(init)) === result)
  }
  
  
  test("succ pred 0 --> succ 0") {
    val init = Succ(Pred(Zero))
    val result = Succ(Zero)
    assert((evaluator invokePrivate eval(init)) === result)
  }
  
  
  test("pred 0 --> 0") {
    val init = Pred(Zero)
    val result = Zero
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("pred 1 --> 0") {
    val init = Pred(Succ(Zero))
    val result = Zero
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("pred 2 --> 1") {
    val init = Pred(Succ(Succ(Zero)))
    val result = Succ(Zero)
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("pred if true then 0 else 1 --> pred 0") {
    val init = Pred(Cond(True,Zero,Succ(Zero)))
    val result = Pred(Zero)
    assert((evaluator invokePrivate eval(init)) === result)
  }
  
  
  test("iszero 0 --> True") {
    val init = IsZero(Zero)
    val result = True
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("iszero 1 --> False") {
    val init = IsZero(Succ(Zero))
    val result = False
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("iszero 2 --> False") {
    val init = IsZero(Succ(Succ(Zero)))
    val result = False
    assert((evaluator invokePrivate eval(init)) === result)
  }
  test("iszero if false then 0 else 1 --> iszero 1") {
    val init = IsZero(Cond(False,Zero,Succ(Zero)))
    val result = IsZero(Succ((Zero)))
    assert((evaluator invokePrivate eval(init)) === result)
  }
  
  
  intercept[Throwable] {
    evaluator invokePrivate eval(True)
  }
  intercept[Throwable] {
    evaluator invokePrivate eval(False)
  }
  intercept[Throwable] {
    evaluator invokePrivate eval(Zero)
  }
}