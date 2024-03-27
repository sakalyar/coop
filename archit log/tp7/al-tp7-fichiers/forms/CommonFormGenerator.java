package forms;

public abstract class CommonFormGenerator implements FormGenerator {
	protected StringBuilder form = new StringBuilder();
	protected static final String companyName = "EvilCorp";

	public String send() {
		return form.toString();
	}
}
