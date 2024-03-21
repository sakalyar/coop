package tp04
/*
@RunWith(classOf[JUnitRunner])
class GameEnvTest extends AnyFunSuite {
  trait TestGameEnv01 extends InfinitePlayground {
    override lazy val start = Pos(1,1)
    override lazy val goal = Pos(5,5)
    val b1 = Block(Pos(2, 2), Pos(2, 2))
    val b2 = Block(Pos(2,2), Pos(3,2))
    val b3 = Block(Pos(4,2), Pos(5,2))
    val b4 = Block(Pos(2,5), Pos(3,5))
    val b5 = Block(Pos(1,3), Pos(1,4))
    val b1Neighbours =
      List((Block(Pos(2,0), Pos(2,1)), Left),
          (Block(Pos(2,3), Pos(2,4)), Right),
          (Block(Pos(0,2), Pos(1,2)), Up),
          (Block(Pos(3,2), Pos(4,2)), Down))
    val b2Neighbours =
      List((Block(Pos(2,1), Pos(3,1)), Left),
          (Block(Pos(2,3), Pos(3,3)), Right),
          (Block(Pos(1,2), Pos(1,2)), Up),
          (Block(Pos(4,2), Pos(4,2)), Down))
    val b3Neighbours =
      List((Block(Pos(4,1), Pos(5,1)), Left),
          (Block(Pos(4,3), Pos(5,3)), Right),
          (Block(Pos(3,2), Pos(3,2)), Up),
          (Block(Pos(6,2), Pos(6,2)), Down))
    val b4Neighbours =
      List((Block(Pos(2,4), Pos(3,4)), Left),
          (Block(Pos(2,6), Pos(3,6)), Right),
          (Block(Pos(1,5), Pos(1,5)), Up),
          (Block(Pos(4,5), Pos(4,5)), Down))
    val b5Neighbours =
      List((Block(Pos(1,2), Pos(1,2)), Left),
          (Block(Pos(1,5), Pos(1,5)), Right),
          (Block(Pos(0,3), Pos(0,4)), Up),
          (Block(Pos(2,3), Pos(2,4)), Down))
    val blocksAndNeighbours = Map(b1 -> b1Neighbours, b2 -> b2Neighbours,
        b3 -> b3Neighbours, b4 -> b4Neighbours, b5 -> b5Neighbours)
  }
  
  intercept[IllegalArgumentException] {
    new TestGameEnv01 {
      Block(Pos(1,3), Pos(1,2))
    }
  }
  intercept[IllegalArgumentException] {
    new TestGameEnv01 {
      Block(Pos(1,1), Pos(2,2))
    }
  }
  intercept[IllegalArgumentException] {
    new TestGameEnv01 {
      Block(Pos(1,3), Pos(3,4))
    }
  }
  test("un bloc debout est vertical") {
    new TestGameEnv01 {
      assert(b1.isStanding)
    }
  }
  test("un bloc couché n'est pas vertical") {
    new TestGameEnv01 {
      assert(!b2.isStanding)
    }
  }
  test("décalage d'un bloc sur les lignes") {
    new TestGameEnv01 {
      assert(b1.deltaRow(2,3) === b3)
    }
  }
  test("décalage d'un bloc sur les colonnes") {
    new TestGameEnv01 {
      assert(b2.deltaCol(3,3) === b4)
    }
  }
  test("déplacements de bloc") {
    new TestGameEnv01 {
      for ((b, neighbours) <- blocksAndNeighbours) {
        assert(b.left === neighbours.find(_._2 == Left).get._1)
        assert(b.right === neighbours.find(_._2 == Right).get._1)
        assert(b.up === neighbours.find(_._2 == Up).get._1)
        assert(b.down === neighbours.find(_._2 == Down).get._1)
      }
    }
  }
  test("voisins d'un bloc") {
    new TestGameEnv01 {
      for ((b, neighbours) <- blocksAndNeighbours) {
        val testedValue = b.neighbours
        assert(testedValue.length == 4)
        assert(neighbours.forall(testedValue.contains))
      }
    }
  }
  
  abstract class Level extends Solver with StringParserPlayground
  class Level1 extends Level {
    val level =
      """ooo-------
        |oSoooo----
        |ooooooooo-
        |-ooooooooo
        |-----ooToo
        |------ooo-""".stripMargin
  }
  
  test("voisins valides d'un bloc debout") {
    new Level1 {
      val testedValue = Block(Pos(1,4), Pos(1,4)).validNeighbours.toSet
      assert(testedValue.size === 2)
      assert(testedValue === Set((Block(Pos(1,2), Pos(1,3)), Left),
          (Block(Pos(2,4), Pos(3,4)), Down)))
    }
  }
  test("voisins valides d'un bloc couché") {
    new Level1 {
      val testedValue = Block(Pos(3,1), Pos(3,2)).validNeighbours.toSet
      assert(testedValue === Set((Block(Pos(2,1), Pos(2,2)), Up),
          (Block(Pos(3,3), Pos(3,3)), Right)))
    }
  }
}*/