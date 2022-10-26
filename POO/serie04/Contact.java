package serie04;

/**
 * Modélise un contact.
 * Tout contact est une personne décrite par :
 * <ul>
 *      <li> son nom</li>
 *      <li> son prénom</li>
 *      <li> sa civilité</li>
 * </ul>
 * @inv <pre>
 *     (getLastName() != null) && (getFirstName() != null)
 *     !getLastName().equals("") || !getFirstName().equals("")
 *     getCivility() != null
 *     toString().equals(
 *         getCivility() + " " + getFirstName() + " " + getLastName()
 *     )
 *     forall c in Contact :
 *         this.equals(c)
 *             <==> this.getCivility() == c.getCivility()
 *                  && this.getFirstName().equals(c.getFirstName())
 *                  && this.getLastName().equals(c.getLastName())
 *         this.equals(c) ==> this.hashcode() == c.hashCode()
 * </pre>
 * 
 * @cons <pre>
 *     $DESC$ Un contact de nom n et de prénom p.
 *     $ARGS$ String n, String p
 *     $PRE$
 *         n != null && p != null
 *         !n.equals("") || !p.equals("")
 *     $POST$
 *         getLastName().equals(n)
 *         getFirstName().equals(p)
 *         getCivility() == Civ.UKN </pre>
 *         
 * @cons <pre>
 *     $DESC$ Un contact de civilité c, de nom n et de prénom p.
 *     $ARGS$ Civ c, String n, String p
 *     $PRE$
 *         c != null && n != null && p != null
 *         !n.equals("") || !p.equals("")
 *     $POST$
 *         getLastName().equals(n)
 *         getFirstName()Contact.equals(p)
 *         getCivility() == c </pre>
 */
public interface Contact {

    // REQUETES
    
    /**
     * Teste l'équivalence de ce contact avec other.
     */
    @Override
    boolean equals(Object other);
    
    /**
     * La civilité du contact.
     */
    Civ getCivility();

    /**
     * Le prénom du contact.
     */
    String getFirstName();
    
    /**
     * Le nom de famille du contact.
     */
    String getLastName();
    
    /**
     * Fonction de dispersion définie sur les contacts.
     */
    @Override
    int hashCode();

    // COMMANDES
    
    /**
     * Donne un contact qui diffère de this uniquement par la civilité. 
     * Les modification suivantes sont autorisées :
     * <pre>
     *   UKN --> MR, MRS ou MS
     *   MRS --> MS
     *   MS  --> MRS
     * </pre>
     * Toute autre modification est interdite (voir {@link serie04.Civ}).
     * @pre <pre>
     *     civility != null && getCivility().canEvolveTo(civility) </pre>
     * @post <pre>
     *     result.getCivility() == civility
     *     result.getFirstName() == this.getFirstName()
     *     result.getLastName() == this.getLastName() </pre>
     */
    Contact evolve(Civ civility);
}
