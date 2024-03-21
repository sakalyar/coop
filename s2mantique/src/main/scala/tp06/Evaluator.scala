package tp06

import Util._

class Evaluator {
  /** Réalise un pas d'évaluation, i.e. produit t' tel que t --> t'. */
  private def eval(t : Term) : Term = {
    ???
  }
  
  /** Evalue t jusqu'à obtenir un terme bloqué. */
  def evaluate(t : Term) : Term = {
    if (isVal(t)) t else evaluate(eval(t))
  }
}
