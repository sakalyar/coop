package tp04
/*
trait StringParserPlayground extends GameEnv {
  val level: String

  def playgroundFunction(levelVector: Vector[Vector[Char]]): Pos => Boolean =
    { case Pos(r, c) => (0 <= r && r < levelVector.size &&
                         0 <= c && c < levelVector(0).size &&
                         levelVector(r)(c) != '-') }

  def findChar(c: Char, levelVector: Vector[Vector[Char]]): Pos = {
    val rowC = {
      levelVector.indexWhere({case row: Vector[Char] => row.contains(c) })
    }
    val colC = levelVector(rowC).indexOf(c)
    Pos(rowC, colC)
  }

  private lazy val vector: Vector[Vector[Char]] =
    Vector(level.split("\n").map(str => Vector(str: _*)): _*)

  lazy val playground: Playground = playgroundFunction(vector)
  lazy val start: Pos = findChar('S', vector)
  lazy val goal: Pos = findChar('T', vector)
}
*/