package tokenlib;

public class Token {
	// La chaîne de caractères représentant le token:
	private String	_token;
	// L'identificateur numérique du token:
	private int	_tokenId;
	// Une annotation quelconque, ex: "Adj", "Verb", "Noun"
	private String _annotation;
	
	public Token(String token, int tokenId, String annotation) {
		_token=token;
		_tokenId=tokenId;
		_annotation=annotation;
	}

	public String getTokenStr() { return _token; }
	public int getTokenId() { return _tokenId; }
	public String getAnnotation() { return _annotation; }
} 
