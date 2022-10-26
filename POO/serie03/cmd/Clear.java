package serie03.cmd;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import serie03.Text;

/**
 * @inv <pre>
 *     getBackup() != null
 *     isRelevantForText() </pre>
 */
class Clear extends AbstractCommand {
    
    // ATTRIBUTS
	private Text text;
	private int numLines;
	private boolean done = false;
	private final List<String> backup;
	
    // CONSTRUCTEURS
    
	
    /**
     * Une commande de vidage du texte.
     * @pre <pre>
     *     text != null </pre>
     * @post <pre>
     *     getText() == text
     *     !done()
     *     |getBackup()| == 0 </pre>
     */
    Clear(Text text) {
    	super(text);
    	backup = new ArrayList<String>();
    	this.text = super.getText();
    	if (text != null) {
    		for (int i = 1; i <= text.getLinesNb(); ++i) {
    			backup.add(text.getLine(i));
    		}
    		done = false;
    	}
    	numLines = backup.size();
    }
    
    // REQUETES
    
    /**
     * La liste des lignes composant le texte juste avant d'exécuter undoIt.
     */
    List<String> getBackup() {
    	return backup;
    }
    
    @Override
    public boolean isRelevantForText() {
    	if (text != null)
    		return true;
    	return false;
    }
    
    // COMMANDES

    /**
     * Efface la totalité du texte.
     * @post <pre>
     *     |getBackup()| == old getText().getLinesNb()
     *     forall i in [0..|getBackup()| - 1] :
     *         getBackup().get(i).equals(old getText().getLine(i + 1))
     *     getText().getLinesNb() == 0 </pre>
     */
    @Override
    protected void doIt() {
    	numLines = getText().getLinesNb();
    	for (int i = 0; i < getText().getLinesNb(); ++i) {
    		backup.add(getText().getLine(i));
    	}
    	text.clear();
    	done = true;
    }
    
    /**
     * Régénère la totalité du texte.
     * @post <pre>
     *     getText().getLinesNb() == old |getBackup()|
     *     forall i in [1..getText().getLinesNb()] :
     *         getText().getLine(i).equals(old getBackup().get(i - 1)) </pre>
     */
    @Override
    protected void undoIt() {
    	for (int i = 0; i < numLines; ++i) {
    		text.insertLine(i, getBackup().get(i));
    	}
    	backup.clear();
    	done = false;
    }
}
