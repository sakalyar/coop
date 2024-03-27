package forms;

public class PDFFormGenerator extends CommonFormGenerator {
	protected void addCenteredText(String text) {
		String centerpad="                                               ";
		form.append(centerpad.substring( (centerpad.length()-formTitle.length()) / 2 ) + formTitle+"\n");

	}
	public void addTitleHeader(String formTitle) {
		addCenteredText("-=≡≣ "+companyName+" ≣≡=-");
		addCenteredText(formTitle);
	}
	public void addSeparator() {
		form.append("-----------------------------------------------\n");
	}
	public void addNameLine() {
		form.append("Nom : _________________________________________\n");
	}
	public void addFirstNameLine() {
		form.append("Prénom : ______________________________________\n");
	}
	public void addEmailLine() {
		form.append("Adresse e-mail : ______________________________\n");
	}
}
