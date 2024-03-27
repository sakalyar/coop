import forms.*;

public class TestForm {
	public static FormGenerator getFormGenerator() {
		// Obscure fonction retournant un generateur de formulaire.
		// Vous la definirez pour vos tests.
		// Ex: return new HTMLFormGenerator();
		return new ...
	}
	
	public static void testGenerator(FormGenerator fg) {
		fg.addTitleHeader("Your newsletter subscription");
		fg.addSeparator();
		fg.addNameLine();
		fg.addFirstNameLine();
		fg.addSeparator();
		fg.addEmailLine();

		String Result = fg.send();
		System.out.println(Result);
	}
	
	public static void main(String[] args) {
		testGenerator(getFormGenerator());
	}
}


