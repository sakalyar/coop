package serie03.cmd;

import serie03.Text;

/**
 * @inv <pre>
 *     1 <= getIndex()
 *     isRelevantForText()
 *         <==> getIndex() <= getText().getLinesNb() + (done() ? 1 : 0)
 *     done() ==> getLine() != null </pre>
 */
class DeleteLine extends AbstractCommand {

    // ATTRIBUTS
    
    private final int index;
    
    private String line;

    // CONSTRUCTEURS
    
    /**
     * Une commande de suppression de la ligne de rang <code>numLine</code>
     *  dans <code>text</code>.
     * @pre <pre>
     *     text != null
     *     1 <= numLine <= text.getLinesNb() </pre>
     * @post <pre>
     *     getText() == text
     *     !done()
     *     getIndex() == numLine
     *     isRelevantForText() </pre>
     */
    DeleteLine(Text text, int numLine) {
        super(testPrecondAndGetText(text, numLine));
        index = numLine;
    }
    
    // REQUETES
    
    @Override
    public boolean isRelevantForText() {
        int extension = done() ? 1 : 0;
        return index <= getText().getLinesNb() + extension;
    }
    
    /**
     * Le rang où l'on doit supprimer la ligne dans le texte.
     */
    int getIndex() {
        return index;
    }
    
    /**
     * La ligne à supprimer.
     */
    String getLine() {
        return line;
    }
    
    // COMMANDES
    
    /**
     * Exécute la suppression d'une ligne dans le texte.
     * @post <pre>
     *     getIndex() == old getIndex()
     *     getText().getLinesNb() == old getText().getLinesNb() - 1
     *     getLine().equals(old getText().getLine(getIndex()))
     *     forall i in [1..getIndex() - 1] :
     *         getText().getLine(i).equals(old getText().getLine(i))
     *     forall i in [getIndex()..getText().getLinesNb()] :
     *         getText().getLine(i).equals(old getText().getLine(i + 1)) </pre>
     */
    @Override
    protected void doIt() {
        assert !done();
        assert isRelevantForText();
        
        line = getText().getLine(index);
        getText().deleteLine(index);
    }
    
    /**
     * Annule la suppression d'une ligne dans le texte.
     * @post <pre>
     *     getIndex() == old getIndex()
     *     getText().getLinesNb() == old getText().getLinesNb() + 1
     *     forall i in [1..getIndex() - 1] :
     *         getText().getLine(i).equals(old getText().getLine(i))
     *     getText().getLine(getIndex()).equals(old getLine())
     *     forall i in [getIndex() + 1..getText().getLinesNb()] :
     *         getText().getLine(i).equals(old getText().getLine(i - 1)) </pre>
     */
    @Override
    protected void undoIt() {
        assert done();
        assert isRelevantForText();
        
        getText().insertLine(index, line);
    }
    
    // OUTILS
    
    private static Text testPrecondAndGetText(Text t, int n) {
        assert t != null
                : "le texte donné est null";
        assert n >= 1
                : "le numéro de ligne n'est pas valide (" + n + ")";
        assert n <= t.getLinesNb()
                : "le numéro de ligne n'est pas valide (" + n + ")";
        
        return t;
    }
}
