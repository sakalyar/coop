package tp05

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatest.matchers.must.Matchers
import org.scalatest.matchers.should.Matchers.convertToAnyShouldWrapper
import org.scalatestplus.junit.JUnitRunner

@RunWith(classOf[JUnitRunner])
class ParserTest extends AnyFunSuite with Matchers {
  val parser = new Parser
  import parser._
  
  test(""""parse(term, "true") --> True""") {
    parse(term, "true") should matchPattern {case Success(True, _) => }
  }
  test(""""parse(term, "false") --> False""") {
    parse(term, "false") should matchPattern {case Success(False, _) => }
  }  
  test(""""parse(term, "foo") --> Failure""") {
    parse(term, "foo") should matchPattern {case Failure(_, _) => }
  }  
  test(""""parse(term, "0") --> Zero""") {
    parse(term, "0") should matchPattern {case Success(Zero, _) => }
  }
  test(""""parse(term, "succ 0") --> Succ(Zero)""") {
    parse(term, "succ 0") should matchPattern {case Success(Succ(Zero), _) => }
  }  
  test(""""parse(term, "pred 0") --> Pred(Zero)""") {
    parse(term, "pred 0") should matchPattern {case Success(Pred(Zero), _) => }
  }
  test(""""parse(term, "iszero succ 0") --> IsZero(Succ(Zero))""") {
    parse(term, "iszero succ0") should matchPattern
        {case Success(IsZero(Succ(Zero)), _) => }
  }
  test(""""parse(term, "if true then 0 else succ 0") --> "
     + "Cond(True, Zero, Succ(Zero))""") {
    parse(term, "if true then 0 else succ 0") should matchPattern
        {case Success(Cond(True, Zero, Succ(Zero)), _) => }
  }  
}


/*package tp05

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatestplus.junit.JUnitRunner
import org.scalatest.matchers.must.Matchers
import org.scalatest.matchers.should.Matchers.should

@RunWith(classOf[JUnitRunner])
class ParserTest extends AnyFunSuite with Matchers {
  val parser = new Parser
  import parser._

  test(""""parse(term, "true") --> True""") {
    parse(term, "true") should matchPattern {case Success(True, _) => }
  }
  test(""""parse(term, "false") --> False""") {
    parse(term, "false") should matchPattern {case Success(False, _) => }
  }
  test(""""parse(term, "foo") --> Failure""") {
    parse(term, "foo") should matchPattern {case Failure(_, _) => }
  }
  test(""""parse(term, "0") --> Zero""") {
    parse(term, "0") should matchPattern {case Success(Zero, _) => }
  }
  test(""""parse(term, "succ 0") --> Succ(Zero)""") {
    parse(term, "succ 0") should matchPattern {case Success(Succ(Zero), _) => }
  }
  test(""""parse(term, "pred 0") --> Pred(Zero)""") {
    parse(term, "pred 0") should matchPattern {case Success(Pred(Zero), _) => }
  }
  test(""""parse(term, "iszero succ 0") --> IsZero(Succ(Zero))""") {
    parse(term, "iszero succ0") should matchPattern
        {case Success(IsZero(Succ(Zero)), _) => }
  }
  test(""""parse(term, "if true then 0 else succ 0") --> "
     + "Cond(True, Zero, Succ(Zero))""") {
    parse(term, "if true then 0 else succ 0") should matchPattern
        {case Success(Cond(True, Zero, Succ(Zero)), _) => }
  }
}*/