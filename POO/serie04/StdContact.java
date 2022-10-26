package serie04;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

public class StdContact implements Contact, Comparable {

	String firstName;
	String lastName;
	Civ civility;
	
	public StdContact(String n, String p) {
		if (n != null && p != null &&
			!n.equals("") && !p.equals("")) {
			lastName = n;
			firstName = p;
			civility = Civ.UKN;
		}
	}
	
	public StdContact(Civ c, String n, String p) {
		if (n != null && p != null &&
				n != "" && p != "") {
				lastName  = n;
				firstName = p;
				civility = c;
			}
		}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((civility == null) ? 0 : civility.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object other) {
		if (this == other)
			return true;
		if (other == null)
			return false;
		if (getClass() != other.getClass())
			return false;
		StdContact otherContact = (StdContact) other;
		if (civility != otherContact.civility)
			return false;
		if (firstName == null) {
			if (otherContact.firstName != null)
				return false;
		} else if (!firstName.equals(otherContact.firstName))
			return false;
		return true;
	}
	
	@Override
	public int compareTo(Object o) {
		
		// isInstanceOf
		try {
			if ((o instanceof Contact)) {
				int x = this.compareTo(o);
				
				return x;
			}
		} catch(Exception exception) {
			System.out.println("Illegal conversion: " + exception.getMessage());
		}
		return 0;
	}

	// Correcte
	@Override
	public Civ getCivility() {
		return civility;
	}

	// Correcte
	@Override
	public String getFirstName() {
		return firstName;
	}

	// Correcte
	@Override
	public String getLastName() {
		return lastName;
	}

	//??
	@Override
	public Contact evolve(Civ newCivility) {
		if(civility != null && getCivility().canEvolveTo(civility))
			return new StdContact(newCivility, firstName, lastName);
		return this;
	}
}
