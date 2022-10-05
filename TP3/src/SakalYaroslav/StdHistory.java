package serie03;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.LinkedList;
import java.util.Queue;

import com.sun.tools.javac.util.List;

public class StdHistory<E> implements History<E> {

	private Deque<E> head;
	private Queue<E> tail;
	private int m;
	
	public StdHistory(int m) {
		head = new ArrayDeque<E>();
		tail = new ArrayDeque<E>();
		this.m = m;
	}
	
	@Override
	public int getMaxHeight() {
		return m;
	}

	@Override
	public int getCurrentPosition() {
		return head.size();
	}

	@Override
	public E getCurrentElement() {
		return head.getLast();
	}

	@Override
	public int getEndPosition() {
		return (Integer) head.peekLast();
	}

	@Override
	public boolean isEmpty() {
		return getEndPosition() == 0;
	}

	@Override
	public void add(E e) {
		// ???
		if (head.size() == m) {
			head.remove();
		}
		head.add(e);
		tail.clear();
	}

	@Override
	public void goForward() {
		head.add(tail.remove());
	}

	@Override
	public void goBackward() {
		tail.add(head.removeLast());
	}
}
