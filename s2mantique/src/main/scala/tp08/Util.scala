package tp08

object Util {
  /**
   *  Construit une séquence d'applications de la forme t1 t2 ... tk
   * à partir de terms = List(t1, t2, ..., tk).
   * Rappel : l'application est associative à gauche
   *  (i.e. t1 t2 t3 ~ (t1 t2) t3)
   */
  def buildApp(terms: List[Term]): Term = {
    terms.reduceLeft((acc, t) => App(acc, t))
  }

  /**
   *  Construit un type fonctionnel de la forme typ1 -> typ2 -> ... -> typk
   * à partir d'une liste de types = List(typ1, typ2, ..., typk).
   * Rappel : le constructeur de type fonctionnel est associatif à droite
   *  (i.e. typ1 -> typ2 -> typ3 ~ typ1 -> (typ2 -> typ3))
   */
  def buildFctType(types : List[Typ]) : Typ = ???

  /**  Remplace, dans t2, toutes les occurrences de x par t1. */
  def subst(x: Var, t1: Term, t2: Term): Term = t2 match {
    case Var(name) if name == x.name => t1
    case Val(v, term) => Val(v, subst(x, t1, term))
    case App(t3, t4) => App(subst(x, t1, t3), subst(x, t1, t4))
    case _ => t2
  }
  
  type Context = List[Val]
  
  /**
   *  Remplace, dans t, chaque alias du contexte ctx par le terme qui lui est
   *  associé.
   */
  def inject(ctx: Context, t: Term): Term = t match {
    case Var(name) =>
      ctx.find(_.x.name == name).map(_.t).getOrElse(t)

    case Val(v, term) =>
      Val(v, inject(ctx, term))

    case App(t1, t2) =>
      App(inject(ctx, t1), inject(ctx, t2))

    case _ => t
  }
  
  /** Si optT définit un nouvel alias, l'ajouter en tête du contexte ctx. */
  def buildNewCtx(ctx: Context, optT: Option[Term]): Context = {
    print(ctx)
    print("\nLOGGING\n")
    print(optT)
    ctx
  }
  
  /** t est-il une valeur ? */
  def isVal(t : Term) : Boolean = ???
  
  /** t est-il une valeur numérique ? */
  def isNumVal(t : Term) : Boolean = ???
  
  /** t est-il un terme clos ? */
  def isClosed(t : Term) : Boolean = ???
}