package tp07

import scala.collection.immutable.ListMap
import TypeChecker.*

class TypeChecker {
  /** Modélise un contexte de typage */
  private type Context = ListMap[Var, Typ]
  
  /** Retourne le type de "t" si "t" est typable, un message d'erreur sinon. */
  def checkType(t: Term): OptTyp = checkType(t, ListMap())

  private def checkType(t: Term, gamma: Context): OptTyp = ???
}

object TypeChecker {
  /**
   * Modélise un type optionnel, avec un message d'erreur quand le typage
   *  n'a pu être réalisé.
   */
  sealed abstract class OptTyp
  case class SomeTyp(typ: Typ) extends OptTyp
  case class NoTyp(msg: String) extends OptTyp  
}