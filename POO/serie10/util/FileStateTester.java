package serie10.util;

import java.io.File;

/**
 * Bibliothèque permettant de tester l'état de "fragmentabilité" d'un fichier.
 * Un fichier est fragmentable ssi il existe en tant que fichier
 *  (<code>File.isFile</code> retourne <code>true</code>), est accessible en
 *  lecture (<code>File.canRead</code> retourne <code>true</code>) et s'il est
 *  de taille non nulle (<code>File.length</code> retourne une valeur
 *  strictement positive).
 * Bien entendu, l'état d'un fichier peut évoluer au cours du temps et
 *  l'information le concernant aussi : elle n'est donc valable qu'au moment
 *  où elle est demandée.
 */
public final class FileStateTester {
        
    // CONSTRUCTEURS

    private FileStateTester() {
        // rien
    }

    // OUTILS
    
    /**
     * Un texte décrivant l'état de fragmentabilité du fichier géré.
     * @post <pre>
     *     Aucun fichier n'a été défini
     *         ==> result.equals("Aucun fichier n'a été défini")
     *     Le fichier n'existe pas ou n'est pas lisible
     *         ==> result.equals(
     *             "Le fichier X n'existe pas ou n'est pas lisible")
     *     Le fichier est bien défini mais de taille nulle
     *         ==> result.equals("Le fichier X est vide")
     *     Dans tous les autres cas
     *         ==> result.equals("Le fichier X est fragmentable") </pre>
     */
    public static String describe(File file) {
        State s = State.stateOf(file);
        if (file == null) {
            return s.description;
        }
        return String.format(s.description, file.getAbsolutePath());
    }
    
    /**
     * Indique l'état de fragmentabilité de file au moment de l'appel.
     * Deux appels effectués à deux instants différents peuvent retourner des
     *  valeurs différentes (en fonction de l'évolution de l'état interne du
     *  fichier).
     * @post <pre>
     *     result == true ssi le fichier est fragmentable </pre>
     */
    public static boolean isSplittable(File file) {
        return State.stateOf(file) == State.SPLITTABLE;
    }

    // TYPES IMBRIQUES
    
    private enum State {
        NOT_VALID("Le fichier \"%1$s\" n'existe pas ou n'est pas lisible"),
        EMPTY("Le fichier \"%1$s\" est vide"),
        SPLITTABLE("Le fichier \"%1$s\" est fragmentable"),
        UNDEFINED("Aucun fichier n'a été défini");
        
        private String description;
        State(String d) {
            description = d;
        }

        private static State stateOf(File f) {
            if (f == null) {
                return UNDEFINED;
            }
            if (!f.isFile() || !f.canRead()) {
                return NOT_VALID;
            }
            if (f.length() == 0) {
                return EMPTY;
            }
            return SPLITTABLE;
        }
    }
}
