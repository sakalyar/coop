package tp05

import tp05.Util._

class Evaluator {
  /** Réalise un pas d'évaluation, i.e. produit t' tel que t --> t'. */
  private def eval(t : Term) : Term = {
    t match {
      case Zero => Zero
      case Pred(Zero) => Zero
      case Pred(Succ(nv)) => nv
      case IsZero(Zero) => Zero
      case IsZero(Succ(nv)) => False
    }
  }
  
  /** Evalue t jusqu'à obtenir un terme bloqué. */
  def evaluate(t : Term) : Term = {
    if (isVal(t)) t else evaluate(eval(t))
  }
}
