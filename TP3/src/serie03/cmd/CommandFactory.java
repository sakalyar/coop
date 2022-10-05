package serie03.cmd;

import serie03.Command;
import serie03.Text;
import util.Contract;

public final class CommandFactory {
    
    private CommandFactory() {
        // rien
    }
    
    /**
     * Crée une commande d'effacement pour le texte t.
     * @pre <pre>
     *     t != null </pre>
     * @post <pre>
     *     result.getText() == t
     *     !result.done() </pre>
     */
    public static Command createClear(Text t) {
        Contract.checkCondition(t != null, "le texte donné est null");
        
        return new Clear(t);
    }
    
    /**
     * Crée une commande de suppression de ligne pour le texte t.
     * @pre <pre>
     *     t != null
     *     1 <= numLine <= t.getLinesNb() </pre>
     * @post <pre>
     *     result.getText() == t
     *     !result.done()
     *     result.isRelevantForText() </pre>
     */
    public static Command createDeleteLine(Text t, int numLine) {
        Contract.checkCondition(t != null, "le texte donné est null");
        Contract.checkCondition(numLine >= 1,
                "le numéro de ligne n'est pas valide (" + numLine + ")");
        Contract.checkCondition(numLine <= t.getLinesNb(),
                "le numéro de ligne n'est pas valide (" + numLine + ")");
        
        return new DeleteLine(t, numLine);
    }
    
    /**
     * Crée une commande d'insertion de ligne pour le texte t.
     * @pre <pre>
     *     t != null
     *     line != null
     *     1 <= numLine <= t.getLinesNb() + 1 </pre>
     * @post <pre>
     *     result.getText() == t
     *     !result.done()
     *     result.isRelevantForText() </pre>
     */
    public static Command createInsertLine(Text t, int numLine, String line) {
        Contract.checkCondition(t != null, "le texte donné est null");
        Contract.checkCondition(numLine >= 1,
                "le numéro de ligne n'est pas valide (" + numLine + ")");
        Contract.checkCondition(numLine <= t.getLinesNb() + 1,
                "le numéro de ligne n'est pas valide (" + numLine + ")");
        Contract.checkCondition(line != null,
                "la chaîne donnée vaut null");
        
        return new InsertLine(t, numLine, line);
    }
}
