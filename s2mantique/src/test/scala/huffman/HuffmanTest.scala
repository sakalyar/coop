package huffman

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatestplus.junit.JUnitRunner
import Huffman._
import scala.math.Ordered

@RunWith(classOf[JUnitRunner])
class HuffmanTest extends AnyFunSuite {
  trait TestTools {
    val tree1 = 
      Node(
          Node(
              Node(Leaf('b', 5), Leaf('c', 6), List('b', 'c'), 11),
              Leaf('k', 12),
              List('b', 'c', 'k'),
              23),
          Node(
              Leaf('d', 14),
              Node(
                  Node(Leaf('a', 3), Leaf('m', 4), List('a', 'm'), 7),
                  Leaf('g', 8),
                  List('a', 'm', 'g'),
                  15),
              List('d', 'a', 'm', 'g'),
              29),
          List('b', 'c', 'k', 'd', 'a', 'm', 'g'),
          52)
    val tree2 =
      Node(
          Node(Leaf('b', 5), Leaf('c', 6), List('b', 'c'), 11),
          Leaf('k', 12),
          List('b', 'c', 'k'),
          23)
    val tree3 =
      Node(
          Leaf('d', 14),
          Node(
              Node(Leaf('a', 3), Leaf('m', 4), List('a', 'm'), 7),
              Leaf('g', 8),
              List('a', 'm', 'g'),
              15),
          List('d', 'a', 'm', 'g'),
          29)
          
    val lf1 = Leaf('a', 2)
    val lf2 = Leaf('b', 1)
    val lf3 = Leaf('e', 1)
    val lf4 = Leaf('d', 3)
    val lf5 = Leaf('g', 5)
    class OrderedLeaf(char: Char, weight: Int) extends Leaf(char, weight) with Ordered[OrderedLeaf] {
      def compare(that: OrderedLeaf) = this.char - that.char
    }
    object OrderedLeaf {
      def apply(lf: Leaf) = new OrderedLeaf(lf.char, lf.weight)
    }

    val frenchCode: HuffmanTree = 
    Node(
        Node(
            Node(
                Leaf('s',121895),
                Node(
                    Leaf('d',56269),
                    Node(
                        Node(
                            Node(
                                Leaf('x',5928),
                                Leaf('j',8351),
                                List('x','j'),
                                14279
                            ),
                            Leaf('f',16351),
                            List('x','j','f'),
                            30630
                        ),
                        Node(
                            Node(
                                Node(
                                    Node(
                                        Leaf('z',2093),
                                        Node(
                                            Leaf('k',745),
                                            Leaf('w',1747),
                                            List('k','w'),
                                            2492
                                        ),
                                        List('z','k','w'),
                                        4585
                                    ),
                                    Leaf('y',4725),
                                    List('z','k','w','y'),
                                    9310
                                ),
                                Leaf('h',11298),
                                List('z','k','w','y','h'),
                                20608
                            ),
                            Leaf('q',20889),
                            List('z','k','w','y','h','q'),
                            41497
                        ),
                        List('x','j','f','z','k','w','y','h','q'),
                        72127
                    ),
                    List('d','x','j','f','z','k','w','y','h','q'),
                    128396
                ),
                List('s','d','x','j','f','z','k','w','y','h','q'),
                250291
            ),
            Node(
                Node(
                    Leaf('o',82762),
                    Leaf('l',83668),
                    List('o','l'),
                    166430
                ),
                Node(
                    Node(
                        Leaf('m',45521),
                        Leaf('p',46335),
                        List('m','p'),
                        91856
                    ),
                    Leaf('u',96785),
                    List('m','p','u'),
                    188641
                ),
                List('o','l','m','p','u'),
                355071
            ),
            List('s','d','x','j','f','z','k','w','y','h','q','o','l','m','p',
                'u'),
            605362
        ),
        Node(
            Node(
                Node(
                    Leaf('r',100500),
                    Node(
                        Leaf('c',50003),
                        Node(
                            Leaf('v',24975),
                            Node(
                                Leaf('g',13288),
                                Leaf('b',13822),
                                List('g','b'),
                                27110
                            ),
                            List('v','g','b'),
                            52085
                        ),
                        List('c','v','g','b'),
                        102088
                    ),
                    List('r','c','v','g','b'),
                    202588
                ),
                Node(
                    Leaf('n',108812),
                    Leaf('t',111103),
                    List('n','t'),
                    219915
                ),
                List('r','c','v','g','b','n','t'),
                422503
            ),
            Node(
                Leaf('e',225947),
                Node(
                    Leaf('i',115465),
                    Leaf('a',117110),
                    List('i','a'),
                    232575
                ),
                List('e','i','a'),
                458522
            ),
            List('r','c','v','g','b','n','t','e','i','a'),
            881025
        ),
        List('s','d','x','j','f','z','k','w','y','h','q','o','l','m','p','u',
            'r','c','v','g','b','n','t','e','i','a'),
        1486387
    )
    val codeTable = Map[Char, List[Bit]]('b' -> List(0,0,0),
        'c' -> List(0,0,1), 'k' -> List(0,1), 'd' -> List(1,0),
        'a' -> List(1,1,0,0), 'm' -> List(1,1,0,1), 'g' -> List(1,1,1))
    val bitList = List(1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0,
          0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1,
          0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1,
          0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1,
          1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0)
    val text = "cestvraimentdrolececodage".toList
  }
  
  test("poids d'un arbre") {
    assert(weight(Leaf('a', 3)) === 3)
    new TestTools {
      assert(weight(tree1) === 52)
    }
  }
  test("les caractères associés à un noeud") {
    assert(chars(Leaf('a', 3)) === List('a'))
    new TestTools {
      assert(chars(tree1) === List('b', 'c', 'k', 'd', 'a', 'm', 'g'))
    }
  }
  test("construction d'un arbre à partir de deux sous-arbres") {
    new TestTools {
      assert(buildTree(tree2, tree3) === tree1)
    }
  }
  test("construction d'une liste de feuilles") {
    new TestTools {
      val leafList = buildLeaves(List('a', 'd', 'd', 'b', 'e', 'd', 'a'))
      val orderedLeafList =
        leafList.map{ case Leaf(c,w) => new OrderedLeaf(c, w) } 
      val witness = List(OrderedLeaf(lf1), OrderedLeaf(lf2),
          OrderedLeaf(lf3), OrderedLeaf(lf4))
      assert(orderedLeafList.sorted === witness.sorted)
    }
  }
  test("insertion d'un arbre dans une liste d'arbres de poids croissants") {
    new TestTools {
      assert(insert(tree1, List(tree2, tree3)) === List(tree2, tree3, tree1)) 
      assert(insert(tree2, List(tree3, tree1)) === List(tree2, tree3, tree1)) 
      assert(insert(tree3, List(tree2, tree1)) === List(tree2, tree3, tree1))
      assert(insert(Leaf('d', 25), List(tree2, tree3, tree1)) ===
        List(tree2, Leaf('d', 25), tree3, tree1))
    }
  }
  test("construction d'un arbre de Huffman") {
    new TestTools {
      val leaves = List(Leaf('b', 5), Leaf('g', 8), Leaf('c', 6), Leaf('k', 12),
          Leaf('d', 14), Leaf('a', 3), Leaf('m', 4))
      assert(buildHuffmanTree(leaves) === tree1)
    }
  }
  test("décodage d'un texte") {
    val code: List[Bit] = List(0,0,1,1,1,0,1,0,1,1,1,0,0,1,1,0,1,0,0,1,1,0,1,
      0,1,1,0,0,1,1,1,1,1,0,1,0,1,1,0,0,0,0,1,0,1,1,1,0,0,1,0,0,1,0,0,0,1,0,0,
      0,1,0,1)
    new TestTools {
      assert(decode(frenchCode, code) === "huffmanestcool".toList)
    }
  }
  test("encodage d'un texte") {
    new TestTools {
      assert(encode(frenchCode, text) === bitList)
    }
  }
  test("conversion d'un arbre de Huffman en une table de codage") {
    new TestTools {
      assert(convert(tree1) === codeTable)
    }
  }
  test("encodage rapide d'un texte") {
    new TestTools {
      assert(fastEncode(frenchCode, text) === bitList)
    }
  }
}