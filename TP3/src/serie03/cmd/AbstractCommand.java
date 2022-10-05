package serie03.cmd;

import serie03.Command;
import serie03.Text;
import util.Contract;

/**
 * Classe fournissant un mécanisme général pour les commandes.
 */
abstract class AbstractCommand implements Command {

    // ATTRIBUTS
    
    private boolean done;
    
    private final Text text;

    // CONSTRUCTEURS

    /**
     * @pre <pre>
     *     text != null </pre>
     * @post <pre>
     *     getText() == text
     *     !done() </pre>
     */
    protected AbstractCommand(Text text) {
        assert text != null : "le texte donné est null";

        this.text = text;
        done = false;
    }

    // REQUETES

    @Override
    public boolean done() {
        return done;
    }
    
    @Override
    public Text getText() {
        return text;
    }

    // COMMANDES
    
    @Override
    public final void act() {
        Contract.checkCondition(isRelevantForText(), "l'état du texte "
                + "n'est pas compatible avec l'application de la commande");

        if (!done()) {
            doIt();
            done = true;
        } else {
            undoIt();
            done = false;
        }
    }
    
    /**
     * Cette méthode doit être redéfinie dans les sous-classes, de sorte
     *  qu'elle implante l'action à réaliser pour exécuter la commande.
     * Elle est appelée par act() et ne doit pas être appelée directement.
     * @pre
     *     !done()
     *     isRelevantForText()
     * @post
     *     La commande a été exécutée
     */
    protected abstract void doIt();
    
    /**
     * Cette méthode doit être redéfinie dans les sous-classes, de sorte
     *  qu'elle implante l'action à réaliser pour annuler la commande.
     * Si l'état du texte correspond à celui dans lequel il était après doIt,
     *  alors undoIt rétablit le texte dans l'état où il était avant
     *  l'exécution de doIt.
     * Elle est appelée par act() et ne doit pas être appelée directement.
     * @pre
     *     done()
     *     isRelevantForText()
     * @post
     *     La commande a été annulée
     */
    protected abstract void undoIt();
}
