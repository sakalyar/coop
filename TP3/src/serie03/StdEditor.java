package serie03;

public class StdEditor implements Editor {

	Text text;
	History history;
	public StdEditor() {
		
	}
	
	
	@Override
	public int getTextLinesNb() {
		return text.getLinesNb();
	}

	@Override
	public String getTextContent() {
		
	}

	@Override
	public int getHistorySize() {
		return history.
	}

	@Override
	public int nbOfPossibleUndo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int nbOfPossibleRedo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertLine(int numLine, String s) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLine(int numLine) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void redo() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void undo() {
		// TODO Auto-generated method stub
		
	}

}
