package serie03;

/**
 * Une commande est un objet capable de modifier un texte selon certains 
 *  critères.
 * La sémantique de la commande ne pourra être complète que dans les classes
 *  qui implémenteront cette interface.
 * @inv <pre>
 *     getText() != null </pre>
 */
public interface Command {
    
    // REQUETES
    
    /**
     * Indique que la commande a été préalablement exécutée.
     */
    boolean done();
    
    /**
     * Le texte sur lequel la commande agit.
     */
    Text getText();
    
    /**
     * Indique si la commande est applicable à son texte.
     */
    boolean isRelevantForText();

    // COMMANDES
    
    /**
     * Définit l'action qu'effectue la commande sur le texte associé.
     * @pre <pre>
     *     isRelevantForText() </pre>
     * @post <pre>
     *     old !done()
     *         ==> done()
     *             la commande a fait son action sur son texte
     *     old done()
     *         ==> !done()
     *             la commande a défait son action sur son texte </pre>
     */
    void act();
}
