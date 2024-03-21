package tp05

import scala.util.parsing.combinator.RegexParsers

/**
 * t --> '('t')'
 *    |  '\z'
 *    |  false
 *    |  true
 *    |  if t then t else t
 *    |  0
 *    |  succ t
 *    |  pred t
 *    |  iszero t
 */
class Parser extends RegexParsers {
  def term : Parser[Term] = parenTerm | eof
  def parenTerm = ("("~>term<~")")
  def eof = """\z""".r ^^ { _ => EOF }

}
