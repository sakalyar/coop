package serie03;

/**
 * Une interface qui spécifie la notion d'éditeur de texte (réduit)
 *  doté d'un mécanisme d'historique de commandes.
 * Les fonctionnalités (minimales ici) sont :
 * <ul>
 *   <li>insérer une ligne de texte ;</li>
 *   <li>supprimer une ligne de texte ;</li>
 *   <li>effacer le texte ;</li>
 * </ul>
 * @inv <pre>
 *     getTextLinesNb() >= 0
 *     getTextContent() != null
 *     getTextContent().equals("") <==> getTextLinesNb() == 0
 *     0 <= nbOfPossibleUndo() 
 *     0 <= nbOfPossibleRedo()
 *     0 < getHistorySize()
 *     nbOfPossibleUndo() + nbOfPossibleRedo() <= getHistorySize() </pre>
 * @cons
 * $DESC$
 *     Un éditeur doté d'un texte vide et d'un historique de taille 
 *      <code>DEFAULT_HISTORY_SIZE</code>
 * $ARGS$
 * $PRE$
 * $POST$
 *     getTextLinesNb() == 0
 *     nbOfPossibleUndo() == 0
 *     nbOfPossibleRedo() == 0
 *     getHistorySize() == DEFAULT_HISTORY_SIZE
 * @cons
 * $DESC$
 *     Un éditeur doté d'un texte vide et d'un historique de taille 
 *      <code>historySize</code>
 * $ARGS$
 *     int historySize
 * $PRE$
 *     historySize > 0
 * $POST$
 *     getTextLinesNb() == 0
 *     nbOfPossibleUndo() == 0
 *     nbOfPossibleRedo() == 0
 *     getHistorySize() == historySize
 */
public interface Editor {

    // CONSTANTES
    
    /**
     * La taille par défaut de l'historique.
     */
    int DEFAULT_HISTORY_SIZE = 5;

    // REQUETES
    
    /**
     * Retourne le nombre de lignes du texte de l'éditeur.
     */
    int getTextLinesNb();
    
    /**
     * Les lignes de texte de l'éditeur, mises bout à bout, séparées
     *  par des marques de nouvelle ligne ("\n").
     */
    String getTextContent();
    
    /**
     * Le nombre maximal de commandes que peut contenir l'historique.
     */
    int getHistorySize();
    
    /**
     * Le nombre d'appels à <code>undo</code> qu'il est possible de réaliser
     *  avant d'atteindre le début de l'historique.
     */
    int nbOfPossibleUndo();
    
    /**
     * Le nombre d'appels à <code>redo</code> qu'il est possible de réaliser
     *  avant d'atteindre la fin de l'historique.
     */
    int nbOfPossibleRedo();
    
    // COMMANDES
    
    /**
     * Efface le texte.
     * @post <pre>
     *     getTextLinesNb() == 0
     *     nbOfPossibleUndo() == 
     *         min(old nbOfPossibleUndo() + 1, getHistorySize())
     *     nbOfPossibleRedo() == 0
     *     La commande d'effacement que l'on vient d'exécuter est celle qui
     *      serait annulée par un undo immédiat </pre>
     */
    void clear();
    
    /**
     * Insère la chaîne <code>s</code> à la ligne <code>numLine</code>.
     * @pre <pre>
     *     s != null
     *     1 <= numLine <= getTextLinesNb() + 1 </pre>
     * @post <pre>
     *     getTextLinesNb() == old getTextLinesNb() + 1
     *     nbOfPossibleUndo() == 
     *         min(old nbOfPossibleUndo() + 1, getHistorySize())
     *     nbOfPossibleRedo() == 0
     *     La ligne s a été insérée dans le texte à la position numLine
     *     La commande d'insertion que l'on vient d'exécuter est celle qui
     *      serait annulée par un undo immédiat </pre>
     */
    void insertLine(int numLine, String s);
    
    /**
     * Supprime la ligne <code>numLine</code>.
     * @pre <pre>
     *     1 <= numLine <= getTextLinesNb() </pre>
     * @post <pre>
     *     getTextLinesNb() == old getTextLinesNb() - 1
     *     nbOfPossibleUndo() == 
     *         min(old nbOfPossibleUndo() + 1, getHistorySize())
     *     nbOfPossibleRedo() == 0
     *     La ligne en position numLine a été retirée du texte
     *     La commande de suppression que l'on vient d'exécuter est celle qui
     *      serait annulée par un undo immédiat </pre>
     */
    void deleteLine(int numLine);
    
    /**
     * Refait la dernière commande annulée (non déjà refaite).
     * @pre <pre>
     *     nbOfPossibleRedo() > 0 </pre>
     * @post <pre>
     *     nbOfPossibleUndo() == old nbOfPossibleUndo() + 1
     *     nbOfPossibleRedo() == old nbOfPossibleRedo() - 1
     *     La dernière commande annulée a été répétée
     *      un appel immédiat à undo permet de l'annuler à nouveau </pre>
     */
    void redo();
    
    /**
     * Annule la dernière commande exécutée.
     * @pre <pre>
     *     nbOfPossibleUndo() > 0 </pre>
     * @post <pre>
     *     nbOfPossibleUndo() == old nbOfPossibleUndo() - 1
     *     nbOfPossibleRedo() == old nbOfPossibleRedo() + 1
     *     La dernière commande a été annulée
     *      un appel immédiat à redo permet de l'exécuter à nouveau </pre>
     */
    void undo();
}
