package tpfacade;
import java.util.*;

public interface Mailing {
	/* send a documentation with a given print id at a given address and return a confirmation message */
	public String send(int printid, String address);
}



class MailingImpl implements Mailing {
	public String send(int printid, String address) {
		return "The documentation order no " + printid + " will be sent at " + address;
	}
}




