package tp01.complex

import scala.math.{cos, sin}

/**
 * Une classe modélisant les nombres complexes
 * On fera le nécessaire pour définir un ordre sur les complexes basé sur
 * l'équivalence (non conventionnelle) suivante :
 *  (a + bi < a' + b'i) <==> (a < a' || (a == a' && b < b'))
 * On permettra la création de complexes via leurs coordonnées polaires.
 * rappel : a + bi = (cos(argument) * module) + (sin(argument) * module) * i
 */
class Complex(val real: Double, val imag: Double) {
  /**
   * Pour afficher élégamment les nombres complexes, y compris quand la partie
   * réelle est nulle ou quand la partie imaginaire vaut -1, 0 ou 1
   */
  override def toString: String = {
    (real, imag) match {
      case (0, 0) => "0"
      case (0, 1) => "i"
      case (0, -1) => "-i"
      case (_, 1) => s"$real" + " + " + "i"
      case (_, -1) => s"$real" + " - " + "i"
      case (_, 0) => s"$real"
      case (_, _) if imag > 0 => s"$real" + " + " + s"${imag}i"
      case (_, _) => s"$real" + " - " + s"${-imag}i"
    }
  }

  // objet complexe qui est son objet compagnon.
  // apply
  // écrire "complex"
  // apply == sucre synthaxique

  /**
   * Le module du nombre complexe
   * rappel : module(a + bi) = sqrt(a * a + b * b)
   */
  def mod: Double = Math.sqrt(real * real + imag * imag)

  /**
   * L'argument d'un nombre complexe
   * rappel : argument(c = a + bi) = acos(a / module(c))
   */
  def arg: Double = Math.acos(real / mod)

  /**
   * Le complexe obtenu en additionnant "this" et "that"
   */
  def +(that: Complex): Complex = new Complex(real + that.real, imag + that.imag)

  /**
   * Le complexe obtenu en soustrayant "that" à "this"
   */
  def -(that: Complex): Complex = new Complex(real - that.real, imag - that.imag)

  /**
   * Le complexe obtenu en multipliant "this" et "that"
   */
  def *(that: Complex): Complex = new Complex(
    real * that.real - imag * that.imag,
    real * that.imag + imag * that.real
  )

  /**
   * Le complexe obtenu en divisant "this" par "that"
   */
  def /(that: Complex): Complex = {
    val denominator = that.real * that.real + that.imag * that.imag
    new Complex(
      (real * that.real + imag * that.imag) / denominator,
      (imag * that.real - real * that.imag) / denominator
    )
  }

  override def equals(obj: Any): Boolean = {
    obj match {
      case other: Complex => if (!other.isInstanceOf[Complex]) false
      else this.real == other.real && this.imag == other.imag
      case _ => false
    }
  }
  /**
   * Le complexe conjugué de "this"
   * rappel : conj(a + bi) = a - bi
   */
  def conj: Complex = new Complex(real, -imag)

  def compare(that: Complex): Int = {
    if (real < that.real || (real == that.real && imag < that.imag)) -1
    else if (real > that.real || (real == that.real && imag > that.imag)) 1
    else 0
  }

  override def hashCode() : Int = {
    val prime = 31
    var result = 1
    result = prime * result + real.hashCode ()
    result = prime * result + imag.hashCode ()
    result
  }

  def <(that: Complex): Boolean = compare(that) < 0

  def >(that: Complex): Boolean = compare(that) > 0

}



object Complex {
  def apply(real: Double, imag: Double): Complex = new Complex(real, imag)

  implicit def doubleToComplex(real: Double): Complex = new Complex(real, 0)
}

object PolarComplex {def apply(mod: Double, angle: Double): Complex = {
    val realPart = mod * Math.cos(angle)
    val imagPart = mod * Math.sin(angle)
    new Complex(realPart, imagPart)
  }
}
