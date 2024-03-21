package tp06

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatestplus.junit.JUnitRunner
import org.scalatest.matchers.must.Matchers
import org.scalatest.matchers.should.Matchers._

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
  
  
  test(""""parse(atom, "foo") --> foo""") {
    parse(atom, "foo") should matchPattern {case Success(`foo`, _) => }
  }
  test(""""parse(atom, "(foo)") --> foo""") {
    parse(atom, "(foo)") should matchPattern {case Success(`foo`, _) => }
  }
  
  
  test(""""parse(lambda, "lambda x. t") --> Abs(x, t)""") {
    parse(lambda, "lambda x. t") should matchPattern
        {case Success(Abs(`x`, `t`), _) => }
  }
  
  
  test(""""parse(term, "lambda x. t") --> Abs(x, t)""") {
    parse(term, "lambda x. t") should matchPattern
        {case Success(Abs(`x`, `t`), _) => }
  }
  test(""""parse(term, "t1 t2 t3") --> App(App(t1, t2), t3)""") {
    parse(term, "t1 t2 t3") should matchPattern
        {case Success(App(App(`t1`, `t2`), `t3`), _) => }
  }
  test(""""parse(term, "t1 t2 t3 lambda x. t") """
      + """--> App(App(App(t1, t2), t3), Abs(x, t))""") {
    parse(term, "t1 t2 t3 lambda x. t") should matchPattern
        {case Success(App(App(App(`t1`, `t2`), `t3`), Abs(`x`, `t`)), _) => }
  }
  test(""""parse(term, "t1") --> t1""") {
    parse(term, "t1") should matchPattern {case Success(`t1`, _) => }
  }
  test(""""parse(term, "") --> Failure""") {
    parse(term, "") should matchPattern {case Failure(_, _) => }
  }
}