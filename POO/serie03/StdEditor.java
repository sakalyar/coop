package serie03;

public class StdEditor implements Editor {

	private Text text;
	private Text oldText;
	private StdHistory<Command> history;
	private Command c;
	private int m;
	private Object curelem;
	
	public StdEditor(int m) {
		history = new StdHistory<Command>(m);
		this.m = m;
		history.add(c);
		curelem = history.getCurrentElement();
		c.act();
	}
	
	@Override
	public int getTextLinesNb() {
		return text.getLinesNb();
	}

	@Override
	public String getTextContent() {
		return text.getContent();
	}

	@Override
	public int getHistorySize() {
		return history.getEndPosition();
	}

	@Override
	public int nbOfPossibleUndo() {
		return history.getCurrentPosition();
	}

	@Override
	public int nbOfPossibleRedo() {
		return history.getEndPosition() - history.getCurrentPosition();
	}

	@Override
	public void clear() {
		text = new StdText();
		history = new StdHistory<Command>(m);
	}

	@Override
	public void insertLine(int numLine, String s) {
		this.text.insertLine(numLine, s);
	}

	@Override
	public void deleteLine(int numLine) {
		this.text.deleteLine(numLine);
	}

	@Override
	public void redo() {
		history.goForward();
		curelem = history.getCurrentElement();
		c.act();
		
	}

	@Override
	public void undo() {
		curelem = history.getCurrentElement();
		history.goBackward();
		c.act();
	}
}
