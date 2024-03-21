package huffman

import huffman.Huffman.HuffmanTree
import tp01.complex.Complex

import scala.collection.immutable.::
import scala.reflect.internal.Chars

/**
 * Un objet permettant de coder et décoder des messages grâce à la méthode de
 *  Huffman.
 */
object Huffman {
  /**
   * Pour des raisons de simplicité (il s'agit d'un TP sur Scala, pas sur la
   *  compression), un bit sera représenté par un entier.
   * Ce n'est évidemment pas imaginable dans un contexte de compression réelle.
   */
  type Bit = Int

  /**
   * Un code de Huffman est un arbre binaire. 
   * Chaque feuille est associée à un caractère alphabétique et à son poids
   *  (généralement proportionnel à sa fréquence d'apparition dans le
   *  langage dans lequel sont écrits les messages).
   * Un noeud interne mémorise les caractères associés aux feuilles du
   *  sous-arbre dont il est la racine (dans l'ordre induit par un parcours en
   *  profondeur à main gauche préfixe de l'arbre) et la somme de leurs poids.
   */
  abstract class HuffmanTree
  case class Leaf(char: Char, weight: Int) extends HuffmanTree
  case class Node(left: HuffmanTree, right: HuffmanTree,
      chars: List[Char], weight: Int) extends HuffmanTree
  
  /**
   * Le poids d'un arbre est celui de sa racine.
   */
  def weight(tree: HuffmanTree): Int = tree match {
    case Leaf(_, w) => w
    case Node(_, _, _, w) => w
  }


  /**
   * La liste des caractères associés à la racine de "tree".
   */
  def chars(tree: HuffmanTree): List[Char] = tree match {
    case Leaf(c, _) => List(c)
    case Node(_, _, lc, _) => lc
  }
  
  /**
   * Renvoie un nouveau code de Huffman en faisant de "left" son sous-arbre
   *  gauche et de "right" son sous-arbre droit.
   */
  def buildTree(left: HuffmanTree, right: HuffmanTree): HuffmanTree = {
    val listChars = chars(left) ::: chars(right)
    val totalWeight = weight(left) + weight(right)

    new Node(left, right, listChars, totalWeight)

  }

  /**
   * Renvoie une liste de feuilles (codes de Huffman de taille 1), obtenue en
   *  calculant le nombre d'occurrences des caractères présents dans "chars".
   * Par exemple, si chars = (List('a', 'b', 'a')) le résultat sera :
   *  List(Leaf('a', 2), Leaf('b', 1)) ou List(Leaf('b', 1), Leaf('a', 2))
   * Il n'y a pas d'ordre imposé sur les éléments de la liste retournée.
   */
  def buildLeaves(chars: List[Char]): List[Leaf] = {
    var listLeaves = List[Leaf]()
    for (ch <- chars) {
      val leaf = Leaf(ch, chars.count(_ == ch))
      if (!listLeaves.contains(leaf)) {
        listLeaves = listLeaves :+ leaf
      }
    }
    listLeaves
  }


  /**
   * On suppose que "trees" est ordonnée par poids croissants.
   * La fonction "insert" renvoie une liste équivalente à "trees"
   *  après y avoir inséré "t".
   * Cette fonction est pratique lorsqu'on réalise un tri (par
   *  insertion) d'une liste d'arbres.
   */
  def insert[T <: HuffmanTree](t: T, trees: List[T]): List[T] = {
    trees match {
      case Nil => List(t)
      case head :: tail =>
        if (weight(t) <= weight(head))
          t :: trees
        else
          head :: insert(t, tail)
    }
  }


  /**
   * Renvoie un code de Huffman à partir de "leaves".
   */
  def buildHuffmanTree(leaves: List[Leaf]): HuffmanTree = {
    require(leaves.nonEmpty, "Les noeuds ne doivent pas etre vides !")

    def buildTreeFromList(remainingTrees: List[HuffmanTree]): HuffmanTree = {
      remainingTrees match {
        case tree :: Nil => tree
        case _ =>
          val sortedTrees = remainingTrees.sortBy(weight)
          val smallest :: secondSmallest :: rest = sortedTrees
          val newTree = buildTree(smallest, secondSmallest)
          buildTreeFromList(newTree :: rest)
      }
    }

    buildTreeFromList(leaves)
  }

  /**
   * Décode la liste de bits "bits" avec le code "tree".
   */
  def decode(tree: HuffmanTree, bits: List[Bit]): List[Char] = {
    def decodeHelper(currTree: HuffmanTree, remainingBits: List[Bit], decodedChars: List[Char]): List[Char] = {
      currTree match {
        case Leaf(char, _) => decodeHelper(tree, remainingBits, decodedChars :+ char)
        case Node(left, right, _, _) =>
          if (remainingBits.isEmpty) decodedChars
          else {
            val nextTree = if (remainingBits.head == 0) left else right
            decodeHelper(nextTree, remainingBits.tail, decodedChars)
          }
      }
    }

    decodeHelper(tree, bits, List.empty[Char])
  }

  /**
   * Renvoie la liste de bits obtenue par encodage du texte "text" avec
   *  le code de Huffman "tree".
   */
  def encode(tree: HuffmanTree, text: List[Char]): List[Bit] = {
    def encodeHelper(char: Char, codeTable: CodeTable): List[Bit] = {
      codeTable(char)
    }
    val codeTable = convert(tree)
    text.flatMap(encodeHelper(_, codeTable))
  }

  /**
   * Un outil plus efficace que l'arbre lui-même pour encoder un message :
   *  une table de codage qui associe son code à chaque caractère.
   */
  type CodeTable = Map[Char, List[Bit]]

  /**
   * Convertit l'arbre en une table de codage équivalente.
   */
  def convert(tree: HuffmanTree): CodeTable = {
    def convertHelper(currTree: HuffmanTree, currentCode: List[Bit], table: CodeTable): CodeTable = {
      currTree match {
        case Leaf(char, _) => table + (char -> currentCode.reverse)
        case Node(left, right, _, _) =>
          val leftCode = convertHelper(left, 0 :: currentCode, table)
          convertHelper(right, 1 :: currentCode, leftCode)
      }
    }

    convertHelper(tree, List.empty[Bit], Map.empty[Char, List[Bit]])
  }

  /**
   * Renvoie la liste de bits obtenue par encodage du texte "text" avec
   *  le code de Huffman "tree" (mais en utilisant en interne la table de
   *  codage correspondante).
   */
  def fastEncode(tree: HuffmanTree, text: List[Char]): List[Bit] = {
    val codeTable = convert(tree)
    text.flatMap(codeTable(_))
  }

}
