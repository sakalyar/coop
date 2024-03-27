package tokenlib;
import java.util.Iterator;
import java.util.List;

public interface TokenIndex {
	int addNewToken(String token, String annotation);
	String getToken(int tokenId);
	int getTokenId(String Token);
	String getAnnotation(int tokenId);
	Token getTokenMapping(int tokenId);
	int getNbTokens();
	List<Integer> tokenize(Iterator<String> stringSequence);
}
