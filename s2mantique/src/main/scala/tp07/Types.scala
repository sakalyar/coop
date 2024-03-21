package tp07

sealed trait Term
case object EOF extends Term
case class Var(name: String) extends Term
case class Val(x: Var, t: Term) extends Term
case class App(t1: Term, t2: Term) extends Term
case class Abs(t1: Term, t2: Term) extends Term

case object True extends Term
case object False extends Term

case class Pred(t1: Term) extends Term
case class IsZero(t1: Term) extends Term
case class Cond(t1: Term, t2: Term, t3: Term) extends Term

case object Zero extends Term
case class Succ(t1: Term) extends Term

sealed trait Typ

case object Bool extends Typ
case object Unit extends Typ
case object Nat extends Typ
case object Fct extends Typ
