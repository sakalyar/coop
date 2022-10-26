package serie06;

import java.util.HashMap;
import java.util.Map;

public class StdStock<E> implements Stock<E> {

	Hashmap<E, Integer> m = new HashMap<E, Integer>();
	
	@Override
	public int getNumber(E e) {
		return -1;
	}

	@Override
	public int getTotalNumber() {
		return 0;
	}

	@Override
	public void addElement(E e) {
		 System.out.println(e);
	}

	@Override
	public void addElement(E e, int qty) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeElement(E e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeElement(E e, int qty) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reset() {
		// TODO Auto-generated method stub
		
	}

}
