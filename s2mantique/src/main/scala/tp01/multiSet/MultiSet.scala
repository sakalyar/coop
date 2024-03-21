package tp01.multiSet

/**
 * Une classe modélisant les multi-ensembles.
 * Un élément peut apparaitre plusieurs fois dans un multi-ensemble. On représentera
 *  donc ceux-ci à l'aide d'associations (Maps) dont les clés sont les éléments et
 *  les valeurs, leur nombre d'occurrences.
 * Par exemple, le multiset {e1, e2, e1, e3, e1, e3} sera représenté par
 *  l'association {e1 -> 3, e2 -> 1, e3 -> 2}.
 */
class MultiSet[E](val elems: Map[E, Int]) {
  /**
   * Le nombre d'éléments 2 à 2 distincts dans le multiset, i.e. le nombre de clés
   *  de l'association.
   */
  def size = ???
  /**
   * Le nombre total d'éléments du multiset.
   */
  def card: Int = ???
  /**
   * "e" est-il présent dans le multiset ?
   */
  def mem(e: E) = ???
  /**
   * Le nombre d'occurrences de "e" dans le multiset.
   */
  def count(e: E) = ???
  /**
   * "this" est-il sous-ensemble de "that" ?
   */
  def subsetOf(that: MultiSet[E]) = ???
  /**
   * Produit un nouveau multi-ensemble à partir de "this" auquel on ajoute "n"
   *  occurrences de l'élément "e".
   */
  def add(e: E, n: Int) = ???
  /**
   * Produit un nouveau multi-ensemble à partir de "this" dont on supprime "n"
   *  occurrences de l'élément "e".
   * Il ne reste aucune occurrence de "e" si "n" est supérieur ou égal à
   *  this.count(e)
   */
  def remove(e: E, n: Int) = ???
  /**
   * Produit un nouveau multi-ensemble union de "this" et "that".
   */
  def union(that: MultiSet[E]) = ???
  /**
   * Produit un nouveau multi-ensemble soustraction de "that" à "this".
   */
  def diff(that: MultiSet[E]) = ???
  /**
   * Produit un nouveau multi-ensemble maximum de "this" et "that".
   * Le nombre d'occurrences d'un élément du maximum est le maximum des nombres
   *  d'occurrences de cet élément dans "this" et "that".
   */
  def maximum(that: MultiSet[E]) = ???
  /**
   * Produit un nouveau multi-ensemble intersection de "this" et "that".
   */
  def inter(that: MultiSet[E]) = ???
  /**
   * L'égalité de multi-ensembles basée sur l'égalité ensembliste.
   */
  override def equals(that: Any) = ???
  /**
   * result == elems.hashCode()
   */
  override def hashCode() = ???
  /**
   * result == "MultiSet" + "(" + e1 + "->" + n1 + ", " + ... + ek + "->" + nk + ")"
   */
  override def toString = ???
}
