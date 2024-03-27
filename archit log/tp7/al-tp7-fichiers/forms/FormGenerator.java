package forms;

public interface FormGenerator {
	public void addTitleHeader(String formTitle); // Émet un titre centré.
	public void addSeparator();      // Émet une ligne de separation
	public void addNameLine();       // Émet un champ nom : __________
	public void addFirstNameLine();  // Émet un champ prénom : __________
	public void addEmailLine();      // Émet un champ courriel : __________
	public String send();            // Retourne le flux du formulaire construit
}
