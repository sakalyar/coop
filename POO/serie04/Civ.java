package serie04;

public enum Civ {
	UKN {boolean test(Civ c) {return c == MR || c == MRS || c == MS;}},
	MR {boolean test(Civ c) {return c == MR;}},
	MRS {boolean test(Civ c) {return c == MRS || c == MS;}},
	MS {boolean test(Civ c) {return c == MRS || c == MS;}};

	String result;
	boolean canEvolveTo(Civ civility) {
		if (this == UKN) {
			if (civility.equals(MR) ||  civility.equals(MRS) || civility.equals(MS))
				return true;
		}
		if (this == MRS) {
			if (civility.equals(MS))
				return true;
		}
		if (this == MS) {
			if (civility.equals(MRS))
				return true;
		}
		return false;
	}
	
	public String toString() {
		if (this == UKN) {
			return "";
		}
		if (this == MR) {
			return "M.";
		}
		if (this == MRS) {
			return "Mme";
		}
		if (this == MS)
			return "Mlle";
		return null;
	}
	
}
