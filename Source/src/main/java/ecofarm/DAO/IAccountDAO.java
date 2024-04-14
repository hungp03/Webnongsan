package ecofarm.DAO;

import java.util.List;

import ecofarm.entity.Account;
import ecofarm.entity.Role;

public interface IAccountDAO {
	public boolean createAccount(Account account);

	public boolean checkAccountRegister(Account account);

	public boolean checkAccountLogin(Account account);

	public Account getAccountByEmail(String email);

	public Account getAccountByID(int accountID);

	public boolean forgotPassword(String username, String password);

	public static enum EnumRole {
		GUEST, ADMIN, EMPLOYEE,
	}
	

	public List<Account> listAccountWithRole(EnumRole role, String search);

	public List<Account> listAccounts();

	public boolean updateAccount(Account account);

	public boolean deleteAccount(Account account);
	
	public Role getRoleByEnum(EnumRole role);
}
