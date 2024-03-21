package tp07

import org.scalactic.Bool

class Formatter {
  def format(t : Term) : String = {
    format(t, 0)
  }

  private def format(t: Term, shift: Int): String = {
    t match {
      case Var(x) => x
      case Abs(x, t1) => "\u03BB" + format(x) + ".\r\n" +
        indent(shift + 2) + format(t1, shift + 2)
      case App(t1@Abs(_, _), t2@Var(_)) => "(\r\n" +
        indent(shift + 2) + format(t1, shift + 2) + "\r\n" +
        indent(shift) + ") " + format(t2, shift)
      case App(t1, t2@Var(_)) => format(t1, shift) + " " + format(t2, shift)
      case App(t1@Abs(_, _), t2) => "(\r\n" +
        indent(shift + 2) + format(t1, shift + 2) + "\r\n" +
        indent(shift) + ") (\r\n" +
        indent(shift + 2) + format(t2, shift + 2) + "\r\n" +
        indent(shift) + ") "
      case App(t1, t2) => format(t1, shift) + " (\r\n" +
        indent(shift + 2) + format(t2, shift + 2) + "\r\n" +
        indent(shift) + ")"
      case Val(x, t1) => format(x) + " = " + format(t1, shift + 2) + "\r\n"
      case _ => t.toString
    

      case True => "true"
      case False => "false"
      case Cond(t1, t2, t3) => "if " +	format(t1, shift + 2) +	" then\r\n" +
        indent(shift + 2) + format(t2, shift + 2) + "\r\n" + indent (shift) +
        "else\r\n" + indent(shift + 2) + format(t3, shift + 2)
      case Zero => "0"
      case Succ(t1) => "succ " + format(t1, shift + 2)
      case Pred(t1) => "pred " + format(t1, shift + 2)
      case IsZero(t1) => "iszero " + format(t1, shift + 2)
      case _ => t.toString
    }
  }
  
  private def indent(shift : Int) : String = {
    if (shift == 0) "" else " " + indent(shift - 1)
  }
  
  /** Renvoie une chaîne de caractères représentant le type typ */
  def format(typ: Typ): String = typ match {
    case Bool => "Bool"
    case Nat => "Nat"
  }
}
