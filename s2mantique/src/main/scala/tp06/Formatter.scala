package tp06

class Formatter {
  def format(t : Term) : String = {
    format(t, 0)
  }

  private def format(t : Term, shift : Int) : String = {
    t match {
      case Var(x) => x
      case Abs(x, t1) => "\u03BB" + format(x) + ".\r\n" +
        indent(shift + 2) + format(t1, shift + 2)
      case App(t1 @ Abs (_, _), t2 @ Var(_)) =>	"(\r\n" +
        indent(shift + 2) + format(t1, shift + 2) + "\r\n" +
        indent (shift) + ") " + format(t2, shift)
      case App(t1, t2 @ Var(_)) => format(t1, shift) + " " + format(t2, shift)
      case App(t1 @ Abs(_, _), t2) => "(\r\n" +
        indent(shift + 2) + format(t1, shift + 2) + "\r\n" +
        indent(shift) + ") (\r\n" +
        indent(shift + 2) + format(t2, shift + 2) + "\r\n" +
        indent(shift) + ") "
      case App(t1, t2) =>	format(t1, shift) + " (\r\n" +
        indent(shift + 2) +	format(t2, shift + 2) + "\r\n" +
        indent(shift) + ")"
      case Val(x, t1) => format(x) + " = " + format(t1, shift + 2) + "\r\n"
      case _ => t.toString
    }
  }
  
  private def indent(shift : Int) : String = {
    if (shift == 0) "" else " " + indent(shift - 1)
  }
}
