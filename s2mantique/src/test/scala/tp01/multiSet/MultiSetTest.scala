package tp01.multiSet

/*
@RunWith(classOf[JUnitRunner])
class MultiSetTest extends AnyFunSuite {
  trait testMultiSets {
    val m1 = MultiSet(Map('a' -> 3, 'b' -> 2, 'c' -> 5))
    val m2 = MultiSet(Map('d' -> 2, 'b' -> 3, 'e' -> 1, 'c' -> 2, 'f' -> 8))
  }

  test("Représentation textuelle d'un multiset") {
    new testMultiSets {
      assert(m1.toString === "MultiSet(a -> 3, b -> 2, c -> 5)")
    }
  }
  test("Egalité de deux multisets") {
    new testMultiSets {
      assert(m1.equals(MultiSet(Map('a' -> 3, 'b' -> 2, 'c' -> 5))))
    }
  }
  test("Hashcode de deux multisets égaux") {
    new testMultiSets {
      assert(m1.## === MultiSet(Map('a' -> 3, 'b' -> 2, 'c' -> 5)).##)
    }
  }

  test("Taille d'un multiset") {
    new testMultiSets {
      assert(m1.size === 3)
    }
  }
  test("Cardinal d'un multiset") {
    new testMultiSets {
      assert(m2.card === 16)
    }
  }
  test("Nombre d'occurrences d'un élément présent") {
    new testMultiSets {
      assert(m2.count('f') === 8)
    }
  }
  test("nombre d'occurrences d'un élément absent") {
    new testMultiSets {
      assert(m1.count('d') === 0)
    }
  }
  test("Présence d'un élément") {
    new testMultiSets {
      assert(m2.mem('b'))
    }
  }
  test("Absence d'un élément") {
    new testMultiSets {
      assert(!m1.mem('e'))
    }
  }
  test("Multiset sous-ensemble d'un autre") {
    new testMultiSets {
      assert(MultiSet(Map('a' -> 1, 'c' -> 2)).subsetOf(m1))
    }
  }
  test("Ajout d'un élément déjà présent") {
    new testMultiSets {
      assert(m1.add('b', 2) === MultiSet(Map('a' -> 3, 'b' -> 4, 'c' -> 5)))
    }
  }
  test("Ajout d'un élément absent") {
    new testMultiSets {
      assert(m1.add('d', 3) === MultiSet(Map('a' -> 3, 'b' -> 2, 'c' -> 5, 'd' -> 3)))
    }
  }
  test("Suppression de certaines occurrences d'un élément présent") {
    new testMultiSets {
      assert(m1.remove('a', 2) === MultiSet(Map('a' -> 1, 'b' -> 2, 'c' -> 5)))
    }
  }
  test("Suppression de plus d'occurrences d'un élément que n'en contient un multiset") {
    new testMultiSets {
      assert(m1.remove('b', 4) === MultiSet(Map('a' -> 3, 'c' -> 5)))
    }
  }
  test("Maximum de deux multisets") {
    new testMultiSets {
      assert(m1.maximum(m2) === MultiSet(
        Map('a' -> 3, 'b' -> 3, 'c' -> 5, 'd' -> 2, 'e' -> 1, 'f' -> 8)))
    }
  }
  test("Union de deux multisets") {
    new testMultiSets {
      assert(m1.union(m2) === MultiSet(
        Map('a' -> 3, 'b' -> 5, 'c' -> 7, 'd' -> 2, 'e' -> 1, 'f' -> 8)))
    }
  }
  test("Différence de deux multisets 01") {
    new testMultiSets {
      assert(m1.diff(m2) === MultiSet(
        Map('a' -> 3, 'c' -> 3)))
    }
  }
  test("Différence de deux multisets 02") {
    new testMultiSets {
      assert(m2.diff(m1) === MultiSet(
        Map('b' -> 1, 'd' -> 2, 'e' -> 1, 'f' -> 8)))
    }
  }
  test("Intersection de deux multisets") {
    new testMultiSets {
      assert(m1.inter(m2) === MultiSet(
        Map('b' -> 2, 'c' -> 2)))
    }
  }
}*/