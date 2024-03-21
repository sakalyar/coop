package tp02.anagrams

/**
 * Un objet fournissant des outils pour construire des anagrammes de mots
 *  et de phrases.
 */
object Anagrams {
  /**
   * Un mot est une String.
   * Pour simplifier, on supposera qu'un mot ne contient que des caractères
   *  alphabétiques ou des tirets.
   * Il n'y aura aucun caractère accentué ou porteur d'un tréma ou d'une cédille.
   */
  type Word = String
  type Sentence = List[Word]

  /** 
   * Une "Occurrences" est une liste ordonnée de couples (Char, Int) (selon
   *  l'ordre alphabétique, un caractère apparaissant au plus une fois dans la
   *  liste).
   * Elle permet d'associer à un mot ou une phrase, la liste de ses
   *  caractères avec leur fréquence dans le mot ou dans la phrase.

   * Remarque : si la fréquence d'un caractère est nulle alors il n'apparait
   *  pas dans la liste.
   */
  type Occurrences = List[(Char, Int)]

  private val dictionary: List[Word] = {
    val resourceFile = new java.io.File("src/main/scala/tp02/resources/dico.txt")
    val source = io.Source.fromFile(resourceFile)
    source.getLines.toList
  }

  /** 
   * Convertit un mot en la liste des fréquences de ses caractères.
   * Les éventuelles majuscules seront assimilées aux caractères minuscules
   *  correspondants.
   */

  def wordOccurrences(w: Word): Occurrences = {
    var list: Occurrences = List()
    val wlower = w.toLowerCase()

    for (c <- wlower) {
      val existingOccurrence = list.find(pair => pair._1 == c)

      existingOccurrence match {
        case Some((char, count)) =>
          val updatedPair = (char, count + 1)
          list = list.filterNot(_ == existingOccurrence.get) :+ updatedPair
        case None =>
          list = list :+ (c, 1)
      }
    }

    list.sorted
  }


  /** 
   * Convertit une phrase en la liste des fréquences de ses caractères.
   */
  def sentenceOccurrences(s: Sentence): Occurrences = {
    var list = List.empty[(Char, Int)]
    for (w <- s) {
      val wordOccurrence = wordOccurrences(w)

      for ((char, count) <- wordOccurrence) {
        val existingOccurrence = list.find(pair => pair._1 == char)

        existingOccurrence match {
          case Some((existingChar, existingCount)) =>
            val updatedPair = (existingChar, existingCount + count)
            list = list.filterNot(_ == existingOccurrence.get) :+ updatedPair
          case None =>
            list = list :+ (char, count)
        }
      }
    }

    list.sorted
  }

  /** 
   * Une association qui fait correspondre à une liste de
   *  fréquences de caractères, les mots du dictionnaires
   *  compatibles avec cette liste.
   * Par exemple, les occurrences de caractères du mot "tri" sont :
   *  List(('i', 1), ('r', 1), ('t', 1))
   * Ce sont les mêmes occurrences pour les mots "tir" et "rit".
   * On aura donc l'entrée suivante dans l'association
   *  "dictionaryByOccurrences" :
   *  List(('i', 1), ('r', 1), ('t', 1)) -> List("rit", "tir", "tri")
   * Cela revient à regrouper les mots du dictionnaire anagrammes les
   *  uns des autres.
   */
  lazy val dictionaryByOccurrences: Map[Occurrences, List[Word]] = {
    // Group words in the dictionary by their occurrences
    val groupedWords = dictionary.groupBy(wordOccurrences)

    // Convert the grouped words into a Map[Occurrences, List[Word]]
    groupedWords.view.mapValues(_.toList).toMap
  }


  /**
   * Renvoie la liste des anagrammes de "word".
   */
  def wordAnagrams(word: Word): List[Word] = {
    var list: List[Word] = List();
    var occur : Occurrences = wordOccurrences(word)

    for (w <- dictionary) {
      if (wordOccurrences(w) == occur)
        list = list :+ (w)
    }
    list
  }
  /**
   * Retourne la liste de tous les "sous-ensembles" d'une liste de fréquences.
   * Par exemple : les sous-ensembles de la liste List(('a', 2), ('b', 2)) sont :
   *    List(
   *      List(),
   *      List(('a', 1)),
   *      List(('a', 2)),
   *      List(('b', 1)),
   *      List(('a', 1), ('b', 1)),
   *      List(('a', 2), ('b', 1)),
   *      List(('b', 2)),
   *      List(('a', 1), ('b', 2)),
   *      List(('a', 2), ('b', 2))
   *    )
   */
  def combinations(occurrences: Occurrences): List[Occurrences] = {
    def generateCombinations(occurrences: Occurrences): List[Occurrences] = occurrences match {
      case Nil => List(List())
      case (char, count) :: tail =>
        val tailCombinations = generateCombinations(tail)

        val included = for {
          subset <- tailCombinations
          n <- 1 to count
        } yield (char, n) :: subset

        val excluded = tailCombinations

        included ++ excluded
    }

    generateCombinations(occurrences)
  }


  /**
   * Renvoie la liste de fréquences obtenue en retirant "y" à "x".
   */

  /**
   * Renvoie la liste de fréquences obtenue en retirant "y" à "x".
   */
  def subtract(x: Occurrences, y: Occurrences): Occurrences = {
    val yMap = y.toMap

    def subtractOccurrence(occurrence: (Char, Int)): (Char, Int) = {
      val (char, count) = occurrence
      val newCount = count - yMap.getOrElse(char, 0)
      (char, newCount)
    }

    x.map(subtractOccurrence).filter { case (_, count) => count > 0 }
  }

  /**
   * Renvoie la liste de toutes les phrases anagrammes de "sentence".
   * Par exemple, pour le paramètre List("a", "plus"), la méthode renvoie :
   *    List(
   *      List("su", "pal")
   *      List("us", "pal")
   *      List("pu", "las")
   *      List("lu", "pas")
   *      List("plus", "a")
   *      List("a", "plus")
   *      List("pas", "lu")
   *      List("las", "pu")
   *      List("pal", "su")
   *      List("pal", "us")
   *    )
   */
  def sentenceAnagrams(sentence: Sentence): List[Sentence] = {
    def generateAnagrams(occurrences: Occurrences): List[Sentence] = {
      if (occurrences.isEmpty) List(List())
      else {
        for {
          combination <- combinations(occurrences)
          if dictionaryByOccurrences.contains(combination)
          word <- dictionaryByOccurrences(combination)
          rest <- generateAnagrams(subtract(occurrences, combination))
        } yield word :: rest
      }
    }

    generateAnagrams(sentenceOccurrences(sentence))
  }
}