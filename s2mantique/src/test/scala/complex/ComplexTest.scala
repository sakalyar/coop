package tp01.complex

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatestplus.junit.JUnitRunner

@RunWith(classOf[JUnitRunner])
class ComplexTest extends AnyFunSuite {
  trait TestComplexes {
    val c1: Complex = Complex(1, 2)
    val c2 = Complex(-2, 5)
    val c3 = Complex(-2, 0)
  }

  test("Représentation textuelle de complexes") {
    assert(Complex(0, 0).toString === "0")
    assert(Complex(0, 1).toString === "i")
    assert(Complex(0, -1).toString === "-i")
    assert(Complex(1, 3).toString === "1.0 + 3.0i")
    assert(Complex(2, -3).toString === "2.0 - 3.0i")
    assert(Complex(2, 0).toString === "2.0")
    assert(Complex(2, 1).toString === "2.0 + i")
    assert(Complex(2, -1).toString === "2.0 - i")
    assert(Complex(1, 2).toString === "1.0 + 2.0i")
  }

  test("Partie réelle d'un complexe") {
    new TestComplexes {
      assert(c1.real === 1.0)
    }
  }
  test("Partie imaginaire d'un complexe") {
    new TestComplexes {
      assert(c1.imag === 2.0)
    }
  }
  test("Module d'un complexe") {
    new TestComplexes {
      assert(c1.mod === 2.23606797749979)
    }
  }
  test("Argument d'un complexe") {
    new TestComplexes {
      assert(c1.arg === 1.1071487177940904)
    }
  }
  test("Conjugué d'un complexe") {
    new TestComplexes {
      assert(c1.conj === Complex(1, -2))
    }
  }
  test("Initialisation d'un complexe par coordonnées polaires") {
    new TestComplexes {
      print(c1.mod)
      print(c1.arg)
      print("TEST")
      assert(PolarComplex(c1.mod, c1.arg) === Complex(1.0000000000000002, 2.0))
    }
  }
  test("Comparaisons de complexes") {
    new TestComplexes {
      print(c1)
      print(c2)
      print(c3)
      assert(c1 > c2)
      assert(c3 < c2)
    }
  }
  test("Addition d'un complexe et d'un entier") {
    new TestComplexes {
      assert(c1 + 1 === Complex(2, 2))
    }
  }
  test("Produit d'un complexe et d'un flottant") {
    new TestComplexes {
      assert(c1 * -2.0 === Complex(-2, -4))
    }
  }
  test("Addition d'un entier et d'un complexe") {
    new TestComplexes {
      assert(1 + c1 === Complex(2, 2))
    }
  }
  test("Produit de deux complexes") {
    new TestComplexes {
      assert(c1 * c2 === Complex(-12, 1))
    }
  }
  test("Egalité de deux complexes") {
    new TestComplexes {
      assert(c1.equals(Complex(1, 2)))
    }
  }
  test("Hashcode de deux complexes égaux") {
    new TestComplexes {
      assert(c2.hashCode() == Complex(-2, 5).hashCode())
    }
  }
}
