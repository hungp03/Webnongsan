package ecofarm.DAO;

import ecofarm.entity.Account;

public interface IAccountDAO {
	public boolean createAccount(Account account);
	public boolean checkAccountRegister(Account account);
	public boolean checkAccountLogin(Account account);
	public Account getAccountByEmail(String email);
	public Account getAccountByID(int accountID);
}
