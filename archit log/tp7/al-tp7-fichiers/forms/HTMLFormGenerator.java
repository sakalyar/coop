package forms;

public class HTMLFormGenerator extends CommonFormGenerator {
	public void addTitleHeader(String formTitle) {
		form.append("<b>"+companyName+"</b><br><br>\n"+
			"<center>"+formTitle+"</center><br>\n");
	}
	public void addSeparator() {
		form.append("<br><hr>\n");
	}
	public void addNameLine() {
		form.append("Nom : <input type='text' name='name'><br>\n");
	}
	public void addFirstNameLine() {
		form.append("Prénom : <input type='text' name='firstname'><br>\n");
	}
	public void addEmailLine() {
		form.append("Adresse e-mail : <input type='text' name='email'><br>\n");
	}
}
