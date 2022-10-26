package serie04;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.TreeMap;
import java.util.TreeSet;

import util.Contract;

public class StdPhoneBook<C extends Contact & Comparable<C>, N> implements PhoneBook<C, N> {

	
	
	private NavigableMap<C, List<N>> contactsMap;
	
	public NavigableSet<C> contacts() {
		return contactsMap.navigableKeySet();
		
	}
	
	// Correcte
	public StdPhoneBook() {
		contactsMap = new TreeMap<C, List<N>>();
	}
	
	//?
	public boolean contains(C p) {
		if (p != null) {
			NavigableSet<C> s = contacts();
			for (C cont : s) {
				if (cont.equals(p)) {
					return true;
				}
			}
		}
		return false;
	}

	
	// ??
	@Override
	public boolean isEmpty() {
		return contacts().size() == 0;
	}
	
	// Presumblement Correcte
	@Override
	public List<N> phoneNumbers(C p) {
		
		List<N> phoneNumbersList = new ArrayList<N>();
		for (C contact : contactsMap.keySet()) {
			if (contact.equals(p)) {
				phoneNumbersList =  contactsMap.get(contact);
				return phoneNumbersList; 
			}
		}
		return phoneNumbersList;
	}

	// Correcte?
	@Override
	public void addEntry(C p, N n) {
		if ((p != null) && !contains(p) && n != null) {
			List<N> phoneNumbersList = new ArrayList<N>();
			phoneNumbersList.add(n);
			contactsMap.put(p, phoneNumbersList);
		}
	}

	@Override
	public void addEntry(C p, List<N> nums) {
		if ((p != null) && !contains(p) && nums != null) {
//			List<N> phoneNumbersList = phoneNumbers(p);
//			phoneNumbersList.addAll(nums);
			contactsMap.put(p, nums);
		}
	}

	@Override
	public void addPhoneNumber(C p, N n) {
		if (p != null && n != null) {
			List<N> phoneNumbersList = phoneNumbers(p);
			phoneNumbersList.add(n);
			contactsMap.put(p, phoneNumbersList);
		}
	}

	//Correcte
	@Override
	public void clear() {
		contactsMap.clear();
	}

	@Override
	public void deletePhoneNumber(C p, N n) {
		List<N> numbers = new ArrayList<N>();
		numbers = contactsMap.get(p);
		numbers.remove(n);
		contactsMap.replace(p, numbers);
//		for(Iterator<NavigableMap<C, List<N>>> iter = contactsMap.iterator(); iter.hasNext(); ) {
//		    Map<String, Object> map = iter.next();
//		    Object c_id = map.get("c_id");
//		    if (c_id == null || c_id.equals(matching_c_id))
//		        iter.remove();
//		}
//		contactsMap.remove(p, n);
//		Iterator phonesIter = contacts().descendingIterator();
//		while (phonesIter.hasNext()) {
//			Object obj = phonesIter.next();
//		}
	}

	@Override
	public void removeEntry(C p) {
		contactsMap.remove(p);
	}


}
