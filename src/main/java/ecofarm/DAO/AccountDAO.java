package ecofarm.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ecofarm.entity.Account;
import ecofarm.entity.Role;

@Transactional
public interface AccountDAO {
	public static enum EnumRoleID{
		ADMIN, GUEST
	}
	
	public Account findAccountByEmail(String login);

	public Account getAccount(int id);

	public Role getRoleViaEnum(EnumRoleID roleID);

	public boolean addAccountToDB(Account acc);

	public List<Account> listAccountWithRole(EnumRoleID roleID);

	public List<Account> listAccounts();

	public boolean updateAccount(Account account);

	public boolean deleteAccount(Account account);

}
