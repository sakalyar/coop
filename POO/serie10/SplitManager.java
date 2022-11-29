package serie10;

import java.io.File;
import java.io.IOException;

/**
 * Modélise le type abstrait SplitManager.
 * Un gestionnaire de fragmentation est un objet capable de découper un gros
 *  fichier en fichiers plus petits.
 * Le principe est le suivant : on configure le gestionnaire en lui appliquant
 *  autant de fois que l'on souhaite une des méthodes setSplits* (en changeant
 *  la taille des morceaux à chaque fois).
 * Puis on commande au gestionnaire de fragmenter effectivement le fichier
 *  selon la dernière configuration effectuée (méthode split()).
 * Le nom des fragments produits est formé sur la base du nom du fichier
 *  source, augmenté d'un numéro de séquence.
 * Enfin, un fichier est fragmentable si et seulement s'il existe bien en tant
 *  que fichier dans le système de fichiers et qu'il est accessible en lecture
 *  pour le programme et de taille strictement positive.
 * 
 * @inv <pre>
 *     Let f   ::= getFile()
 *         gSS ::= getSplitsSizes()
 *     getDescription() != null
 *     getDescription().equals(FileStateTester.describe(getFile()))
 *     canSplit() <==> FileStateTester.isSplittable(getFile())
 *     !canSplit() ==> getMaxFragmentNb() == 0
 *     canSplit()
 *         ==> gSS != null
 *             1 <= |gSS| <= getMaxFragmentNb()
 *             getMaxFragmentNb() ==
 *                 min(MAX_FRAGMENT_NB, ceil(f.length() / MIN_FRAGMENT_SIZE))
 *             forall i, 0 <= i < |gSS| - 1 : gSS[i] >= MIN_FRAGMENT_SIZE
 *             gSS[|gSS| - 1] >= 1
 *             sum(0 <= i < |gSS|, gSS[i]) == f.length()
 *             getSplitsNames() != null
 *             |getSplitsNames()| == |gSS|
 *             forall i, 0 <= i < |getSplitsNames()| :
 *                 getSplitsNames()[i]
 *                     .equals(f.getAbsolutePath() + "." + (i + 1)) </pre>
 * 
 * @cons <pre>
 * $DESC$
 *     Un gestionnaire de fragmentation sans fichier.
 * $ARGS$
 *     -
 * $POST$
 *     getFile() == null </pre>
 * 
 * @cons <pre>
 * $DESC$
 *     Un gestionnaire de fragmentation basé sur le fichier file.
 * $ARGS$
 *     File file
 * $PRE$
 *     file != null
 * $POST$
 *     file.equals(getFile())
 *     canSplit() ==> |getSplitsSizes()| == 1 </pre>
 */
public interface SplitManager {
    
    // CONSTANTES
   
    /**
     * Borne supérieure pour le nombre maximal de fragments.
     */
    int MAX_FRAGMENT_NB = 100;
    
    /**
     * Taille minimale d'un fragment (en octets) sauf peut-être pour le dernier.
     */
    int MIN_FRAGMENT_SIZE = 1024;

    // REQUETES
    
    /**
     * Indique si le fichier sous-jacent peut être fragmenté, c'est-à-dire si
     *  un chemin a bien été défini et qu'il représente un fichier (pas un
     *  répertoire) accessible en lecture pour le programme, et de taille
     *  strictement positive.
     */
    boolean canSplit();

    /**
     * Décrit l'état de fragmentabilité du fichier géré par ce gestionnaire.
     * Lorsque le fichier n'est pas fragmentable, explique pourquoi.
     */
    String getDescription();
   
    /**
     * Le fichier à fragmenter, géré par ce gestionnaire.
     */
    File getFile();
    
    /**
     * Le nombre maximal de fragments que supporte la configuration courante de
     *  ce gestionnaire.
     */
    int getMaxFragmentNb();
    
    /**
     * Les noms des fragments du fichier sous-jacent.
     * @pre <pre>
     *     canSplit() </pre>
     */
    String[] getSplitsNames();
    
    /**
     * Les tailles des fragments du fichier sous-jacent.
     * @pre <pre>
     *     canSplit() </pre>
     */
    long[] getSplitsSizes();
   
    // COMMANDES
    
    /**
     * Change de fichier à fragmenter.
     * @pre <pre>
     *     f != null </pre>
     * @post <pre>
     *     getFile().equals(f)
     *     canSplit() ==> |getSplitsSizes()| == 1 </pre>
     */
    void changeFor(File f);
    
    /**
     * Déconnecte le fichier de ce gestionnaire.
     * @post <pre>
     *     getFile() == null
     *     !canSplit() </pre>
     */
    void close();
    
    /**
     * Fixe la taille des fragments de fichier.
     * Seul le dernier fragment peut être de taille inférieure à
     *  MIN_FRAGMENT_SIZE.
     * @pre <pre>
     *     canSplit()
     *     size >= max(
     *          MIN_FRAGMENT_SIZE,
     *          ceil(getFile().length() / getMaxFragmentNb())) </pre>
     * @post <pre>
     *     Let gSS ::= getSplitsSizes()
     *         lg  ::= getFile().length()
     *     |gSS| == ceil(lg / size)
     *     forall i, 0 <= i < |gSS| - 1 : gSS[i] == size
     *     gSS[|gSS| - 1] == lg - sum(0 <= i < |gSS| - 1, gSS[i]) </pre>
     */
    void setSplitsSizes(long size);
    
    /**
     * Fixe la taille des fragments de fichier.
     * Si la somme des tailles passées est inférieure à la taille du fichier à
     *  fragmenter on rajoute un dernier fragment qui contient ce qu'il reste.
     * Si la somme des tailles passées est supérieure à la taille du fichier à
     *  fragmenter on tronque l'argument.
     * @pre <pre>
     *     canSplit()
     *     sizes != null
     *     1 <= |sizes|
     *     sum(0 <= i < |sizes|, sizes[i]) < getFile().length()
     *         ==> |sizes| < getMaxFragmentNb()
     *     sum(0 <= i < |sizes|, sizes[i]) >= getFile().length()
     *         ==> |sizes| <= getMaxFragmentNb()
     *     forall i, 0 <= i < |sizes| : sizes[i] >= MIN_FRAGMENT_SIZE </pre>
     * @post <pre>
     *     Let gSS ::= getSplitsSizes()
     *         lg  ::= getFile().length()
     *     lg <= sum(0 <= i < |sizes|, sizes[i]) ==> |gSS| <= |sizes|
     *     lg > sum(0 <= i < |sizes|, sizes[i]) ==> |gSS| == |sizes| + 1
     *     forall i, 0 <= i < |gSS| - 1 : gSS[i] == sizes[i]
     *     gSS[|gSS| - 1] == lg - sum(0 <= i < |gSS| - 1, sizes[i]) </pre>
     */
    void setSplitsSizes(long[] sizes);
    
    /**
     * Fixe le nombre des fragments de fichier, qui sont alors tous à peu près
     *  de la même taille.
     * @pre <pre>
     *     canSplit()
     *     1 <= splitsNb <= getMaxFragmentNb() </pre>
     * @post <pre>
     *     Let gSS ::= getSplitsSizes()
     *         n   ::= getFile().length()
     *         q   ::= n / splitsNb
     *         r   ::= n % splitsNb
     *     |gSS| == splitsNb
     *     q >= MIN_FRAGMENT_SIZE
     *         ==> forall i, 0 <= i < r : gSS[i] == q + 1
     *             forall i, r <= i < |gSS| : gSS[i] == q
     *     q < MIN_FRAGMENT_SIZE
     *         ==> forall i, 0 <= i <|gSS| - 1 : gSS[i] == MIN_FRAGMENT_SIZE
     *             gSS[|gSS| - 1] == n - sum(0 <= i < |gSS| - 1, gSS[i]) </pre>
     */
    void setSplitsNumber(int splitsNb);
    
    /**
     * Effectue réellement la fragmentation du fichier sur le disque.
     * @pre <pre>
     *     canSplit() </pre>
     * @post <pre>
     *     forall i, 0 <= i < |getSplitsSizes()| :
     *         getSplitsSizes()[i] == La taille du fichier sur disque de nom
     *                                getSplitsNames()[i]
     *     le fichier associé à getFile() a même contenu que la
     *         concaténation des fichiers de nom getSplitsNames() </pre>
     * @throws java.io.FileNotFoundException
     *     s'il n'est pas possible de créer ou d'ouvrir en écriture l'un des
     *         fichiers fragments
     * @throws IOException
     *     s'il s'est produit une erreur d'entrée/sortie durant l'écriture dans
     *         les fichiers fragments
     */
    void split() throws IOException;
}
