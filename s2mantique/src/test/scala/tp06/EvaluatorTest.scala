package tp06

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
  val id = Abs(x,x)
  val omega = Abs(y, App(y, y))
  
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
}