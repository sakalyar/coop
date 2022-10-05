
package serie03;

/**
 * Un texte est une chaîne de caractères structurée en lignes.
 * @inv <pre>
 *     getLinesNb() >= 0
 *     forall i in [1..getLinesNb()] : getLine(i) != null
 *     getContent() != null
 *     getContent().equals(sum(i in [1..getLinesNb()], getLine(i) + NL)) </pre>
 * @cons
 * $DESC$
 *     Un texte vide
 * $ARGS$
 * $PRE$
 * $POST$
 *     getLinesNb() == 0
 */
public interface Text {
    
    // CONSTANTES
    
    String NL = "\n";
    
    // REQUETES
    
    /**
     * Le nombre de lignes du texte.
     */
    int getLinesNb();
    
    /**
     * La i-ème ligne du texte.
     * @pre <pre>
     *     1 <= i <= getLinesNb() </pre>
     */
    String getLine(int i);
    
    /**
     * Le contenu de ce texte sous forme d'une chaîne constituée des lignes
     *  terminées par des retours chariot.
     */
    String getContent();
    
    // COMMANDES

    /**
     * Insère la chaîne <code>s</code> en ligne <code>numLine</code>.
     * @pre <pre>
     *     (1 <= numLine) && (numLine <= getLinesNb()+1)
     *     s != null </pre>
     * @post <pre>
     *     getLinesNb() == old getLinesNb() + 1
     *     getLine(numLine).equals(s)
     *     forall i in [numLine + 1 .. getLinesNb()] :
     *         getLine(i).equals(old getLine(i - 1)) </pre>
     */
    void insertLine(int numLine, String s);
    
    /**
     * Supprime la ligne <code>numLine</code>.
     * @pre <pre>
     *     (1 <= numLine) && (numLine <= getLinesNb()) </pre>
     * @post <pre>
     *     getLinesNb() == old getLinesNb() - 1
     *     forall i in [numLine .. getLinesNb()] :
     *         getLine(i).equals(old getLine(i + 1)) </pre>
     */
    void deleteLine(int numLine);
    
    /**
     * Efface la totalité du texte.
     * @post <pre>
     *     getContent().equals("") </pre>
     */
    void clear();
}
