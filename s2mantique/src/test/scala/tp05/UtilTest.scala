package tp05

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatestplus.junit.JUnitRunner
import Util._

@RunWith(classOf[JUnitRunner])
class UtilTest extends AnyFunSuite {
  test("0 et 3 sont des valeurs numériques") {
    assert(isNumVal(Zero))
    assert(isNumVal(Succ(Succ(Succ(Zero)))))
  }
  test("des termes qui ne sont pas des valeurs numériques") {
    assert(!isNumVal(Pred(Zero)))
    assert(!isNumVal(Succ(Pred(Zero))))
    assert(!isNumVal(Pred(Succ(Zero))))
    assert(!isNumVal(True))
  }
  test("0, 2, True et False sont des valeurs") {
    assert(isVal(Zero))
    assert(isVal(Succ(Succ(Zero))))
    assert(isVal(True))
    assert(isVal(False))
  }
  test("des termes qui ne sont pas des valeurs") {
    assert(!isVal(Pred(Zero)))
    assert(!isVal(Cond(True, Zero, Zero)))
    assert(!isVal(IsZero(Zero)))
  }
}