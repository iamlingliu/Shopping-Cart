package Login;

import java.util.*;

public class AccountManager {
	private Map<String, String> accounts;
	
	static final String ATTRIBUTE_NAME = "Account Manager";
	
	public AccountManager() {
		accounts = new HashMap<String, String>();
		createAccount("Patrick", "1234");
		createAccount("Molly", "FloPup");
	}
	
	public boolean accountExist (String username) {
		return accounts.containsKey(username);
	}
	
	public boolean isCorrenctPassword (String username, String password) {
			return accounts.get(username).equals(password);
	}
	
	public void createAccount (String username, String password) {
		accounts.put(username, password);
	}
}
