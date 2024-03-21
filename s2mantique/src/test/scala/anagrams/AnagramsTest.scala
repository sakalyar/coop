package tp02

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatestplus.junit.JUnitRunner
import org.scalactic.source.Position.apply
import tp02.anagrams.Anagrams._

import scala.annotation.tailrec

@RunWith(classOf[JUnitRunner])
class AnagramsTest extends AnyFunSuite {
  test("Fréquence des caractères dans un mot") {
    assert(wordOccurrences("anagrammes") ===
      List(('a', 3), ('e', 1), ('g', 1), ('m', 2), ('n', 1), ('r', 1),
          ('s', 1)))
    assert(wordOccurrences("pot-au-feu") ===
      List(('-', 2), ('a', 1), ('e', 1), ('f', 1), ('o', 1), ('p', 1),
          ('t', 1), ('u', 2)))
  }
  test("Fréquence des caractères dans une phrase") {
    val sentence = List("Ceci", "est", "une", "phrase")
    assert(sentenceOccurrences(sentence) ===
      List(('a',1), ('c',2), ('e',4), ('h',1), ('i',1), ('n',1), ('p',1),
          ('r',1), ('s',2), ('t',1), ('u',1)))
  }
  test("Les mots du dictionnaire associés à des fréquences de caractères") {
    val freq = List(('o', 1), ('p', 1), ('r', 1), ('t', 1))
    assert(dictionaryByOccurrences(freq).sorted ===
      List("port", "trop").sorted)
    val freq2 = List(('d', 1), ('e', 1), ('o', 1), ('r', 2))
    assert(dictionaryByOccurrences(freq2).sorted ===
      List("dorer", "ordre", "roder").sorted)
  }
  test("Les anagrammes d'un mot") {
    assert(wordAnagrams("calibre").sorted ===
      List("bercail", "calibre").sorted)
    assert(wordAnagrams("eeirrl").sorted ===
      List("irreel", "relier", "relire").sorted)
  }
  test("Les sous-combinaisons de fréquences") {
    @tailrec
    def compare(l1: Occurrences, l2: Occurrences): Boolean = (l1, l2) match {
      case (Nil, _) => true
      case (_ :: _, Nil) => false
      case ((c1, n1) :: rest1, (c2, n2) :: rest2) if c1 == c2 && n1 == n2 =>
        compare(rest1, rest2)
      case ((c1, n1) :: _, (c2, n2) :: _) if c1 == c2 => n1 < n2
      case ((c1, _) :: _, (c2, _) :: _) => c1 < c2
    }
    assert(combinations(List(('a', 2), ('b', 2))).sortWith(compare) ===
      List(List(), List(('a', 1)), List(('a', 2)), List(('b', 1)),
        List(('a', 1), ('b', 1)), List(('a', 2), ('b', 1)),  List(('b', 2)),
        List(('a', 1), ('b', 2)), List(('a', 2), ('b', 2))
      ).sortWith(compare))
    assert(combinations(List(('a', 1), ('b', 3))).sortWith(compare) ===
      List(List(), List(('a', 1)), List(('a', 1), ('b', 3)),
        List(('a', 1), ('b', 1)), List(('b', 1)),  List(('b', 2)),
        List(('a', 1), ('b', 2)), List(('b', 3))
      ).sortWith(compare))
  }
  test("Les soustractions de fréquences") {
    val occ1 = List(('a', 2), ('b', 3))
    val occ2 = List(('b', 2))
    assert(subtract(occ1, occ2).sorted === List(('a', 2), ('b', 1)).sorted)
    val occ3 = List(('a', 2), ('b', 3), ('c', 1))
    val occ4 = List(('b', 3))
    assert(subtract(occ3, occ4).sorted === List(('a', 2), ('c', 1)).sorted)
  }
  test("Les anagrammes d'une phrase") {
    @tailrec
    def compare(s1: Sentence, s2: Sentence): Boolean = (s1, s2) match {
      case (Nil, _) => true
      case (_ :: _, Nil) => false
      case (w1 :: rest1, w2 :: rest2) =>
          w1 < w2 || (w1 equals w2) &&  compare(rest1, rest2)
    }
    assert(sentenceAnagrams(List("ah", "bon")).sortWith(compare) ===
      List(List("ho", "ban"), List("oh", "ban"), List("bon", "ah"),
          List("ah", "bon"), List("ban", "ho"), List("ban", "oh")
      ).sortWith(compare))
    assert(sentenceAnagrams(List("joli", "code")).sortWith(compare) ===
      List(List("il", "je", "do", "oc"),
          List("il", "je", "oc", "do"),
          List("il", "do", "je", "oc"),
          List("il", "do", "oc", "je"),
          List("il", "oc", "je", "do"),
          List("il", "oc", "do", "je"),
          List("joli", "do", "ce"),
          List("joli", "de", "oc"),
          List("joli", "de", "oc"),
          List("joli", "oc", "de"),
          List("joli", "oc", "de"),
          List("joli", "ce", "do"),
          List("joli", "code"),
          List("je", "il", "do", "oc"),
          List("je", "il", "oc", "do"),
          List("je", "do", "il", "oc"),
          List("je", "do", "oc", "il"),
          List("je", "oc", "il", "do"),
          List("je", "oc", "do", "il"),
          List("joel", "do", "ci"),
          List("joel", "ci", "do"),
          List("do", "il", "je", "oc"),
          List("do", "il", "oc", "je"),
          List("do", "joli", "ce"),
          List("do", "je", "il", "oc"),
          List("do", "je", "oc", "il"),
          List("do", "joel", "ci"),
          List("do", "oc", "il", "je"),
          List("do", "oc", "je", "il"),
          List("do", "ci", "joel"),
          List("do", "ce", "joli"),
          List("de", "joli", "oc"),
          List("de", "oc", "joli"),
          List("de", "joli", "oc"),
          List("de", "oc", "joli"),
          List("oc", "il", "je", "do"),
          List("oc", "il", "do", "je"),
          List("oc", "joli", "de"),
          List("oc", "joli", "de"),
          List("oc", "je", "il", "do"),
          List("oc", "je", "do", "il"),
          List("oc", "do", "il", "je"),
          List("oc", "do", "je", "il"),
          List("oc", "de", "joli"),
          List("oc", "de", "joli"),
          List("ci", "joel", "do"),
          List("ci", "do", "joel"),
          List("ce", "joli", "do"),
          List("ce", "do", "joli"),
          List("code", "joli")
      ).sortWith(compare)
    )
  }
}