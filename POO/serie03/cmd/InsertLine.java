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
    private Text text;
    private int numLine;
    private String line;
    private int index;
	
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
    	super(text);
    	if (text != null && line != null &&
    		numLine > 0 && text.getLinesNb()+1 >= numLine) {
        	this.text= text;
        	this.numLine = numLine;
        	this.line = line;
            index = numLine;
    	}
    	text.insertLine(numLine, line);
    	
    }
    
    // REQUETES
    
    @Override
    public boolean isRelevantForText() {
    	int extension = done() ? 1 : 0;
        return index <= getText().getLinesNb() + extension;
    }
    
    /**
     * Le rang où l'on doit insérer la ligne dans le texte.
     */
    int getIndex() {
        return index;
    }
    
    /**
     * La ligne à insérer.
     */
    String getLine() {
    	return line;
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
    	assert !done();
        assert isRelevantForText();
        
        line = getText().getLine(index);
        getText().deleteLine(index);
    	
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
    	assert done();
        assert isRelevantForText();
        
        getText().insertLine(index, line);
    }
}
