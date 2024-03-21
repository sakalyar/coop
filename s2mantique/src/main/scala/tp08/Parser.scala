package tp08

import scala.util.parsing.combinator.JavaTokenParsers

import scala.collection.immutable.ListMap

/**
 * prog --> '\z'
 *   |  cmd ";;"
 * cmd --> seq
 *   |  val v '=' seq
 *   |  letrec f':' typ '=' t
 * seq --> t (';' t)*
 * t --> open
 *   |  atom+ t?
 * open --> fct
 *   |  if seq then seq else t
 *   |  succ t
 *   |  pred t
 *   |  iszero t
 *   |  let x = seq in t
 * fct --> lambda x':' typ'.' seq
 * atom --> x
 *   |  '('seq')'
 *   |  true
 *   |  false
 *   |  0
 *   |  unit
 * typ --> atomTyp ("->" atomTyp)*
 * atomTyp --> '('typ')'
 *   |  Bool
 *   |  Nat
 *   |  Unit
 */
class Parser extends JavaTokenParsers {
  protected override val whiteSpace = """(\s|#.*)+""".r
  override val ident = """[a-zA-Z][a-zA-Z0-9]*""".r
  def keywords = Set("val")
  
  def prog : Parser[Term] = eof | cmd<~";;"
  def eof = """\z""".r ^^ { _ => EOF}
  def cmd : Parser[Term] = ???
  def seq : Parser[Term] = ???
  def term : Parser[Term] = ???
  def open = ???
  def lambda = ???
  def cond = ???
  def succ = ???
  def pred = ???
  def isZero = ???
  def letIn = ???
  def atom = ???
  def variable = ???
  def tFalse = ???
  def tTrue = ???
  def zero = ???
  def u = ???
  def typ : Parser[Typ] = ???
  def atomTyp = ???
  def bool = ???
  def nat = ???
  def unit = ???
}