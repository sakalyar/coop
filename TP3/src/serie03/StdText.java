package serie03;

import java.util.LinkedList;
import java.util.List;

import util.Contract;

public class StdText implements Text {
    
    // ATTRIBUTS
    
    private final List<String> lines;

    // CONSTRUCTEURS
    
    public StdText() {
        // On utilise une LinkedList pour bénéficier de l'efficacité
        // des opérations d'insertion ou de suppression de ligne
        lines = new LinkedList<String>();
    }

    // REQUETES
    
    @Override
    public int getLinesNb() {
        return lines.size();
    }
    
    @Override
    public String getLine(int i) {
        Contract.checkCondition((i >= 1) && (i <= getLinesNb()),
                "mauvais numéro de ligne : " + i);
        
        return lines.get(i - 1);
    }
    
    @Override
    public String getContent() {
        StringBuilder result = new StringBuilder();
        for (String s : lines) {
            result.append(s).append(NL);
        }
        return result.toString();
    }

    // COMMANDES
    
    @Override
    public void insertLine(int numLine, String s) {
        Contract.checkCondition((numLine >= 1) && (numLine <= getLinesNb() + 1),
                "mauvais numéro de ligne : " + numLine);
        Contract.checkCondition(s != null,
                "la chaîne fournie n'existe pas");
        
        lines.add(numLine - 1, s);
    }
    
    @Override
    public void deleteLine(int numLine) {
        Contract.checkCondition((numLine >= 1) && (numLine <= getLinesNb()),
                "mauvais numéro de ligne : " + numLine);
        
        lines.remove(numLine - 1);
    }
    
    @Override
    public void clear() {
        lines.clear();
    }
}
