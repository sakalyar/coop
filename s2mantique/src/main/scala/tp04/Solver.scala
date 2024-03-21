package tp04

/**
 * Un "solver" est un environnement de jeu auquel sont ajoutées des méthodes
 *  permettant le calcul d'une solution (minimale en nombre de mouvements).
 */
/*trait Solver extends GameEnv {
  /** Le bloc au démarrage du jeu. */
  def startBlock: Block = {
  }

  /** Le bloc est-il à la verticale sur la position finale ? */
  def done(b: Block): Boolean = {
  }
  
  /** Modélise l'historique des mouvements du bloc. */
  type History = List[Move]

  /**
   * Cette méthode prend en paramètres un bloc et l'historique des mouvements
   *  qui ont permis de l'amener à sa position actuelle (le dernier
   *  mouvement étant en tête de l'historique).
   * Elle retourne une liste de couples, chacun étant constitué d'un bloc
   *  voisin valide de b et de l'historique enrichi du mouvement ayant permis
   *  d'atteindre ce voisin.
   */
  def neighboursAndHistory(b: Block, history: History): List[(Block, History)]
      = ???

  /**
   * Retourne la sous-liste de "neighbours" constituée des blocs non encore
   *  explorés (i.e. non présents dans "explored").
   * Cette méthode évitera de tourner en rond lors de la recherche d'une
   *  solution.
   */
  def selectNewNeighbours(neighbours: List[(Block, History)],
      explored: Set[Block]): List[(Block, History)] = ???

  /**
   * Cette méthode est au coeur de la technique de recherche des solutions.
   *  Elle réalise une partie du parcours en largeur dans l'arbre des 
   *  solutions.
   * Le paramètre "initial" est une liste de blocs atteints dernièrement et
   *  accompagnés de leur historique (classés selon leur longueur en ordre
   *  croissant).
   * Le paramètre "explored" recense tous les blocs déjà atteints.
   * 
   * Si la liste "initial" est vide ou contient un bloc en position finale,
   *  elle est retournée telle quelle.
   * Sinon, on détermine les voisins, non encore explorés, du bloc désigné par
   *  le premier élément de la liste "initial", on construit une nouvelle
   *  liste à partir de la queue de la liste "initial" et des nouveaux voisins
   *  repérés et on réitère le processus sur cette nouvelle liste.
   */
  def discover(initial: List[(Block, History)], explored: Set[Block]):
      List[(Block, History)] = ???

  /**
   * La plus courte (ou une des plus courtes) solution permettant d'atteindre
   *  le but depuis la position de départ.
   * La liste vide, s'il n'y a pas de solution.
   */
  lazy val solution: List[Move] = ???
}*/
