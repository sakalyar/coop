package tp04
/*
@RunWith(classOf[JUnitRunner])
class SolverTest extends AnyFunSuite {
  abstract class Level extends Solver with StringParserPlayground
  class Level0 extends Level {
    val level =
      """------
        |--ST--
        |--oo--
        |--oo--
        |------""".stripMargin
  }
  class Level1 extends Level {
    val level =
      """ooo-------
        |oSoooo----
        |ooooooooo-
        |-ooooooooo
        |-----ooToo
        |------ooo-""".stripMargin
  }
  
  test("Le bloc est bien positionné au départ") {
    new Level1 {
      assert(startBlock === Block(Pos(1,1), Pos(1,1)))
    }
  }
  test("La position gagnante est reconnue") {
    new Level1 {
      assert(done(Block(Pos(4,7), Pos(4,7))))
      assert(!done(Block(Pos(4,7), Pos(4,8))))
    }    
  }
  test("Les voisins et historiques après un mouvement") {
    new Level1 {
      val block = Block(Pos(2,5), Pos(2,6))
      val history = List(Left, Right, Right, Up)
      val testedValue = neighboursAndHistory(block, history).toSet
      assert(testedValue === Set(
          (Block(Pos(2,4), Pos(2,4)), Left :: history),
          (Block(Pos(2,7), Pos(2,7)), Right :: history),
          (Block(Pos(3,5), Pos(3,6)), Down :: history)))
    }    
  }
  test("seulement les nouveaux voisins") {
    new Level1 {
      val neighbours = List(
          (Block(Pos(3,1), Pos(3,2)), List(Up, Right)),
          (Block(Pos(5,3), Pos(5,3)), List(Left, Up, Right)),
          (Block(Pos(3,4), Pos(4,4)), List(Up, Down, Right)),
          (Block(Pos(2,1), Pos(3,1)), List(Up, Right, Up, Right, Up, Up)))
      val explored = Set(Block(Pos(5,3), Pos(5,3)), Block(Pos(3,4), Pos(4,4)))
      val testedValue = selectNewNeighbours(neighbours, explored).toSet
      assert(testedValue === Set((Block(Pos(3,1), Pos(3,2)), List(Up, Right)),
          (Block(Pos(2,1), Pos(3,1)), List(Up, Right, Up, Right, Up, Up))))
    }
  }
  test("On ne découvre rien quand il n'y a plus rien à découvrir") {
    new Level1 {
      val configs = List()
      val explored = Set(Block(Pos(5,3), Pos(5,3)))
      val testedValue = discover(configs, explored)
      assert(testedValue === List())
    }
  }
  test("On ne découvre rien de plus quand la solution est déjà découverte") {
    new Level1 {
      val configs = List((Block(Pos(5,3), Pos(5,4)), List(Up)),
          (Block(Pos(4,7), Pos(4,7)), List()))
      val explored = Set(Block(Pos(5,3), Pos(5,3)))
      val testedValue = discover(configs, explored)
      assert(testedValue === configs)
    }
  }
  test("Découvre les voisins encore non explorés") {
    new Level1 {
      val configs = List(
          (Block(Pos(2,7), Pos(3,7)), List(Up, Right)),
          (Block(Pos(2,1), Pos(3,1)), List(Up, Right, Up, Right, Up, Up)))
      val explored = Set[Block]()
      val testedValue = discover(configs, explored)
      val hopedValue = List(
          (Block(Pos(2,1), Pos(3,1)), List(Up, Right, Up, Right, Up, Up)),
          (Block(Pos(2,6), Pos(3,6)), List(Left, Up, Right)),
          (Block(Pos(2,8), Pos(3,8)), List(Right, Up, Right)),
          (Block(Pos(4,7), Pos(4,7)), List(Down, Up, Right)))
      assert(testedValue.toSet === hopedValue.toSet)
    }
  }
  test("produit la solution") {
    new Level0 {
      assert(solution === List(Down, Right, Up))
    }
    new Level1 {
      assert(solution === List(Right, Right, Down, Right, Right, Right, Down))
    }
  }
}*/