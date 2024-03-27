package tokenlib;

public class Token {
	// La chaîne de caractères représentant le token:
	private String token;
	// L'identificateur numérique du token:
	private int	tokenId;
	// Une annotation quelconque, ex: "Adj", "Verb", "Noun"
	private String annotation;
	
	public Token(String token, int tokenId, String annotation) {
		this.token=token;
		this.tokenId=tokenId;
		this.annotation=annotation;
	}

	public String getTokenStr() { return token; }
	public int getTokenId() { return tokenId; }
	public String getAnnotation() { return annotation; }
} 
