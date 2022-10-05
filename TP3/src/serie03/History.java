package serie03;

/**
 * Une interface spécifiant les fonctionnalités d'un outil de gestion
 *  d'historique.
 * Un historique est une structure linéaire, de taille courante n bornée par
 *  une taille maximale m.
 * Il possède un élément courant, qui est le seul élément de l'historique
 *  accessible aux clients à un instant donné.
 * L'accès à l'élément courant se fait à l'aide d'une position qui prend ses
 *  valeurs entre 1 et n lorsqu'elle désigne l'un des n éléments de
 *  l'historique, ou 0 lorsqu'elle n'en désigne aucun.
 * On peut changer d'élément courant dans l'historique en faisant avancer ou
 *  reculer la position courante.
 * On peut aussi ajouter un nouvel élément juste après l'élément courant : tous
 *  les éléments de l'historique situés après l'élément courant (s'il y en a)
 *  sont perdus et l'élément fraîchement ajouté devient à la fois l'élément
 *  courant et le dernier élément.
 * Si la position courante était égale à m avant l'ajout (historique plein),
 *  le plus ancien élément de l'historique (celui qui était en position 1 avant
 *  l'ajout) a été perdu pour gagner la place de l'élément ajouté.
 * Enfin, un historique est initialement vide, mais dès qu'on lui aura ajouté
 *  un élément, il ne le sera plus jamais puisqu'on ne pourra pas le vider.
 * @inv <pre>
 *     getMaxHeight() > 0
 *     0 <= getCurrentPosition() <= getEndPosition() <= getMaxHeight()
 *     isEmpty() <==> getEndPosition() == 0
 *     getCurrentPosition() > 0
 *         ==> getCurrentElement() != null
 *             getCurrentElement() == l'élément en getCurrentPosition()
 * </pre>
 * @cons <pre>
 *     $DESC$ Un historique vide de taille maximale maxHeight.
 *     $ARGS$ int maxHeight
 *     $PRE$
 *         maxHeight > 0
 *     $POST$
 *         getMaxHeight() == maxHeight
 *         isEmpty() </pre>
 */
public interface History<E> {
    
    // REQUETES

    /**
     * La taille maximale de l'historique.
     */
    int getMaxHeight();
    
    /**
     * La position courante dans l'historique.
     */
    int getCurrentPosition();
    
    /**
     * L'élément de l'historique, désigné par la position courante.
     * @pre <pre>
     *     getCurrentPosition() > 0 </pre>
     */
    E getCurrentElement();
    
    /**
     * La position du dernier élément de l'historique.
     */
    int getEndPosition();
    
    /**
     * Indique si cet historique est vide.
     */
    boolean isEmpty();

    // COMMANDES
    
    /**
     * Ajoute l'élément <code>e</code> à la suite de l'élément courant
     *  et supprime les éléments postérieurs à cet élément courant.
     * S'il n'y a pas d'élément courant, ajoute simplement <code>e</code>
     *  comme premier élément.
     * L'élément <code>e</code> devient le nouvel élément courant.
     * @pre <pre>
     *     e != null </pre>
     * @post <pre>
     *     !isEmpty()
     *     old isEmpty()
     *         ==> getCurrentPosition() == 1
     *     ! old isEmpty()
     *         ==> getCurrentPosition() == 
     *                 min(old getCurrentPosition() + 1, getMaxHeight())
     *     getCurrentElement() == e
     *     getEndPosition() == getCurrentPosition()
     *     si l'historique était plein, le plus ancien élément a disparu </pre>
     */
    void add(E e);
    
    /**
     * Avance le curseur vers la fin de l'historique.
     * @pre <pre>
     *     getCurrentPosition() < getEndPosition() </pre>
     * @post <pre>
     *     getCurrentPosition() == old getCurrentPosition() + 1 </pre>
     */
    void goForward();
    
    /**
     * Recule le curseur vers le début de l'historique.
     * @pre <pre>
     *     getCurrentPosition() > 0 </pre>
     * @post <pre>
     *     getCurrentPosition() == old getCurrentPosition() - 1 </pre>
     */
    void goBackward();
}
