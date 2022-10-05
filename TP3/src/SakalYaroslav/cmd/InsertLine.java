package serie03.cmd;

import serie03.Text;

/**
 * @inv <pre>
 *     1 <= getIndex()
 *     isRelevantForText()
 *         <==> getIndex() <= getText().getLinesNb() + (done() ? 0 : 1)
 *     getLine() != null </pre>
 */
class InsertLine extends AbstractCommand {

    // ATTRIBUTS
    
    // ...
    
    // CONSTRUCTEURS
    
    /**
     * Une commande d'insertion de la chaîne <code>line</code> en
     *  position <code>index</code> dans <code>text</code>.
     * @pre <pre>
     *     text != null
     *     line != null
     *     1 <= numLine <= text.getLinesNb() + 1 </pre>
     * @post <pre>
     *     getText() == text
     *     !done()
     *     getIndex() == numLine
     *     getLine().equals(line)
     *     isRelevantForText() </pre>
     */
    InsertLine(Text text, int numLine, String line) {
        // ...
    }
    
    // REQUETES
    
    @Override
    public boolean isRelevantForText() {
        // ...
    }
    
    /**
     * Le rang où l'on doit insérer la ligne dans le texte.
     */
    int getIndex() {
        // ...
    }
    
    /**
     * La ligne à insérer.
     */
    String getLine() {
        // ...
    }
    
    // COMMANDES
    
    /**
     * Exécute l'insertion de la chaîne dans le texte.
     * @post <pre>
     *     getIndex() == old getIndex()
     *     getLine() == old getLine()
     *     getText().getLinesNb() == old getText().getLinesNb() + 1
     *     forall i in [1..getIndex() - 1] :
     *         getText().getLine(i).equals(old getText().getLine(i))
     *     getText().getLine(getIndex()).equals(old getLine())
     *     forall i in [getIndex() + 1..getText().getLinesNb()] :
     *         getText().getLine(i).equals(old getText().getLine(i - 1)) </pre>
     */
    @Override
    protected void doIt() {
        // ...
    }
    
    /**
     * Annule l'insertion de la chaîne dans le texte.
     * @post <pre>
     *     getIndex() == old getIndex()
     *     getLine() == old getLine()
     *     getText().getLinesNb() == old getText().getLinesNb() - 1
     *     forall i in [1..getIndex() - 1] :
     *         getText().getLine(i).equals(old getText().getLine(i))
     *     forall i in [getIndex()..getText().getLinesNb()] :
     *         getText().getLine(i).equals(old getText().getLine(i + 1)) </pre>
     */
    @Override
    protected void undoIt() {
        // ...
    }
}
