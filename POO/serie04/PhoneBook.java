package serie04;

import java.util.List;
import java.util.NavigableSet;

/**
 * Modélise un annuaire téléphonique permettant d'associer une liste de
 *  numéros de téléphone à un contact.
 * Une entrée au plus par contact.
 * @inv <pre>
 *     contacts() != null
 *     isEmpty() <==> (contacts().size() == 0)
 *     forall p in Contact :
 *         contains(p) <==> contacts().contains(p)
 *         !contains(p) ==> phoneNumbers(p) == null
 *     forall p in contacts() :
 *         phoneNumbers(p) != null
 *         phoneNumbers(p).size() > 0
 *         forall n in phoneNumbers(p) :
 *             n != null
 *             phoneNumbers(p).lastIndexOf(n) == phoneNumbers(p).indexOf(n)
 * </pre>
 * @cons <pre>
 *     $DESC$ Un annuaire vide.
 *     $ARGS$ -
 *     $POST$ isEmpty() </pre>
 */
public interface PhoneBook<C extends Contact & Comparable<C>, N> {
    
    // REQUETES
    
    /**
     * Retourne une vue ordonnée des contacts présents dans l'annuaire.
     * Les ajouts sur cet ensemble sont impossibles.
     * Cet ensemble est partagé avec l'annuaire de sorte que le retrait d'un
     *  élément de cet ensemble entraine la suppression dans l'annuaire de
     *  l'entrée correspondante.
     * Dans l'autre sens, tout ajout ou toute suppression d'entrée dans
     *  l'annuaire entraine l'ajout ou la suppression du contact correspondant
     *  dans cet ensemble.
     */
    NavigableSet<C> contacts();
    
    /**
     * Retourne vrai ssi p est dans l'annuaire.
     * @pre <pre>
     *     p != null </pre>    
     */
    
    boolean contains(C p);
    
    /**
     * Retourne vrai ssi l'annuaire est vide.
     */
    boolean isEmpty();
    
    /**
     * Retourne la liste des numéros de p telle qu'à l'instant de la demande.
     * @pre <pre>
     *     p != null </pre>
     */
    List<N> phoneNumbers(C p);

    // COMMANDES
    
    /**
     * Ajoute une nouvelle entrée dans l'annuaire.
     * @pre <pre>
     *     (p != null) && !contains(p)
     *     n != null </pre>
     * @post <pre>
     *     contains(p)
     *     phoneNumbers(p).size() == 1
     *     phoneNumbers(p).get(0).equals(n) </pre>
     */
    void addEntry(C p, N n);
    
    /**
     * Ajoute une nouvelle entrée dans l'annuaire.
     * L'ordre initial des numéros est préservé.
     * Dans le cas où un numéro serait présent plusieurs fois dans nums, seule
     *  la première occurrence (en partant de la gauche) sera conservée.
     * @pre <pre>
     *     (p != null) && !contains(p)
     *     (nums != null) && (nums.size() > 0)
     *     forall i : nums.get(i) != null </pre>
     * @post <pre>
     *     Let list ::= phoneNumbers(p)
     *     contains(p)
     *     list.size() <= nums.size()
     *     forall i in [0..nums.size() - 1], exist j in [0..list.size() - 1] :
     *         j <= i && list.get(j).equals(nums.get(i))
     *         forall k in [0..list.size() - 1] :
     *             k != j ==> !list.get(k).equals(list.get(j))
     *     forall e1, e2 in nums :
     *         nums.indexOf(e1) <= nums.indexOf(e2)
     *             ==> list.indexOf(e1) <= list.indexOf(e2) </pre>
     */
    void addEntry(C p, List<N> nums);
    
    /**
     * Ajoute un numéro à la fin de la liste des numéros d'un contact.
     * Ne fait rien si le numéro est déjà dans la liste de p.
     * @pre <pre>
     *     p != null && contains(p)
     *     n != null </pre>
     * @post <pre>
     *     contains(p)
     *     Let oldSize  ::= old phoneNumbers(p).size()
     *         oldNum_i ::= old phoneNumbers(p).get(i)
     *     old !phoneNumbers(p).contains(n)
     *         ==> phoneNumbers(p).size() == oldSize + 1
     *             phoneNumbers(p).indexOf(n) == oldSize
     *     old phoneNumbers(p).contains(n)
     *         ==> phoneNumbers(p).size() == oldSize
     *     forall i in [0..oldSize - 1] :
     *         phoneNumbers(p).get(i).equals(oldNum_i) </pre>
     */
    void addPhoneNumber(C p, N n);
    
    /**
     * Réinitialise l'annuaire.
     * @post <pre>
     *     isEmpty() </pre>
     */
    void clear();
    
    /**
     * Supprime un numéro donné pour un contact donné.
     * Si ce numéro est le seul numéro de la personne, l'entrée complète est
     *  retirée de l'annuaire.
     * Ne fait rien si le numéro n'est pas dans la liste des numéros de p.
     * @pre <pre>
     *     (p != null) && contains(p)
     *     n != null </pre>
     * @post <pre>
     *     old phoneNumbers(p).contains(n) 
     *         ==> old phoneNumbers(p).size() == 1
     *                 ==> !contains(p)
     *             old phoneNumbers(p).size() > 1
     *                 ==> Let oldSize  ::= old phoneNumbers(p).size()
     *                         oldPlace ::= old  phoneNumbers(p).indexOf(n)
     *                         oldNum_i ::= old phoneNumbers(p).get(i)
     *                     phoneNumbers(p).size() == oldSize - 1
     *                     forall i in [0..oldPlace - 1] :
     *                         phoneNumbers(p).get(i).equals(oldNum_i)
     *                     forall i in [oldPlace..phoneNumbers(p).size() - 1] :
     *                         phoneNumbers(p).get(i).equals(oldNum_(i + 1))
     *     old !phoneNumbers(p).contains(n)
     *         ==> phoneNumbers(p).size() == old phoneNumbers(p).size()
     *             phoneNumbers(p).equals(old phoneNumber(p)) </pre>
     */
    void deletePhoneNumber(C p, N n);
    
    /**
     * Supprime un contact de l'annuaire.
     * @pre <pre>
     *     p != null </pre>
     * @post <pre>
     *     !contains(p) </pre>
     */
    void removeEntry(C p);
}
