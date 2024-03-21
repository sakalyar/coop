package tp06

import scala.util.parsing.combinator.JavaTokenParsers

/**
 * prog --> '\z'
 *   | cmd ";;"
 * cmd --> term
 *   |  val v '=' term
 * term --> lambda x'.' term
 *   |  atom+ term?
 * atom --> x
 *   | '('term')'
 *   
 * Indication : la 6ème production génère une séquence non-vide d'"atom"
 *  terminée par une lambda-abstraction optionnelle.
 *  Le combinateur "+" produit une liste de termes que l'on transformera
 *  en une cascade d'applications grâce à la méthode "Util.buildApp".
 *  
 * Indication : les variables respectent le motif [a-zA-Z][a-zA-Z0-9]* et ne
 *  doivent pas être des mots clés du langage.
 */
class Parser extends JavaTokenParsers {
  protected override val whiteSpace = """(\s|#.*)+""".r
  override val ident = """[a-zA-Z][a-zA-Z0-9]*""".r
  def keywords = Set("val")

 /* def prog: Parser[Term] = eof | rep1sep(cmd, ";;") ^^ { case cmds => cmds.reduceRight((t1, t2) => App(t1, t2)) }

  def cmd: Parser[Term] = term | ("val" ~> variable) ~ ("=" ~> term) ^^ { case x ~ t => Val(x.asInstanceOf[Var], t) }

  def eof: Parser[Term] = """\z""".r ^^^ EOF

  def term: Parser[Term] = open | atom ~ rep1(atom) ~ opt(term) ^^ {
    case hd ~ tl ~ None => (hd :: tl).reduceRight((t1, t2) => App(t1, t2))
    case hd ~ tl ~ Some(t) => (hd :: tl).reduceRight((t1, t2) => App(t1, t2)) // Handle the case of having a trailing term
  }*

  //def open: Parser[Term] = lambda | cond | succ | pred | isZero

  //def lambda: Parser[Term] = "\\" ~> variable ~ (":" ~> typ) ~ ("." ~> term) ^^ { case x ~ ty ~ t => Abs(x, t) }

  def cond: Parser[Term] = "if" ~> term ~ ("then" ~> term) ~ ("else" ~> term) ^^ { case t1 ~ t2 ~ t3 => Cond(t1, t2, t3) }

  def succ: Parser[Term] = "succ" ~> term ^^ { t => Succ(t) }

  def pred: Parser[Term] = "pred" ~> term ^^ { t => Pred(t) }

  def isZero: Parser[Term] = "iszero" ~> term ^^ { t => IsZero(t) }

  def atom: Parser[Term] = variable | "(" ~> term <~ ")" | tFalse | tTrue | zero

  def variable: Parser[Term] = ident ^^ { x => Var(x) }*/

  def tFalse: Parser[Term] = "false" ^^^ False

  def tTrue: Parser[Term] = "true" ^^^ True

  def zero: Parser[Term] = "0" ^^^ Zero

  /*def typ: Parser[Typ] = rep1sep(atomTyp, "->") ^^ { types =>
    Util.buildFctType(types)
  }

  def atomTyp: Parser[Typ] = "(" ~> typ <~ ")" | bool | nat

  def bool: Parser[Typ] = "Bool" ^^^ Bool

  def nat: Parser[Typ] = "Nat" ^^^ Nat*/

  // IMPORTANT
  // atome = variable ou expression entre parantheses
  // (atom+ == au moins 1 atome)
}
