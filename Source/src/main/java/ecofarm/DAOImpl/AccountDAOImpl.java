package ecofarm.DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ecofarm.DAO.IAccountDAO;
import ecofarm.entity.Account;
import ecofarm.entity.Role;
import ecofarm.utility.HibernateUtil;

public class AccountDAOImpl implements IAccountDAO {
	private static final Logger logger = LoggerFactory.getLogger(AccountDAOImpl.class);

	@Override
	public boolean createAccount(Account account) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		account.setPassword(BCrypt.hashpw(account.getPassword(), BCrypt.gensalt(12)));
		account.setStatus(0);
		account.setRole(getRoleByID("GUEST"));
		boolean isCreated = false;
		try {
			Transaction tr = session.beginTransaction();
			session.save(account);
			tr.commit();
			isCreated = true;
		} catch (Exception e) {
			logger.error("Error creating account: " + e.getMessage(), e);
			throw new RuntimeException("Error creating account", e);
		} finally {
			session.close();
		}
		return isCreated;
	}

	@SuppressWarnings("unchecked")
	private Role getRoleByID(String roleID) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Role> list = new ArrayList<>();
		try {
			Transaction tr = session.beginTransaction();
			String hql = "FROM Role WHERE RoleID = :roleID";
			Query query = session.createQuery(hql);
			query.setParameter("roleID", roleID);
			list = query.list();
			tr.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Account getAccountByEmail(String email) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Account> list = new ArrayList<>();
		try {
			Transaction tr = session.beginTransaction();
			String hql = "FROM Account WHERE Email = :email";
			Query query = session.createQuery(hql);
			query.setParameter("email", email);
			list = query.list();
			tr.commit();
		} catch (Exception e) {
			logger.error("Error getting account by email: " + e.getMessage(), e);
			throw new RuntimeException("Error getting account by email", e);
		} finally {
			session.close();
		}

		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}

	}

	@Override
	public boolean checkAccountRegister(Account account) {
		List<Account> allAccounts = getAllAccounts();
		if (account.getEmail() == null)
			return false;
		if (account.getFirstName() == null)
			return false;
		if (account.getLastName() == null)
			return false;
		if (account.getPhoneNumber() == null)
			return false;

		for (Account el : allAccounts) {
			if (account.getEmail().equals(el.getEmail()))
				return false;
			if (account.getFirstName().equals(el.getFirstName()))
				return false;
			if (account.getLastName().equals(el.getLastName()))
				return false;
			if (account.getPhoneNumber().equals(el.getPhoneNumber()))
				return false;
		}
		return true;
	}

	@SuppressWarnings("unchecked")
	private List<Account> getAllAccounts() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Account> list = new ArrayList<>();
		try {
			Transaction tr = session.beginTransaction();
			String hql = "FROM Account";
			list = session.createQuery(hql).list();
			tr.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public boolean checkAccountLogin(Account account) {
		String pass = account.getPassword();
		Account user = getAccountByEmail(account.getEmail());
		if (user != null) {
			if (BCrypt.checkpw(pass, user.getPassword()))
				return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Account getAccountByID(int accountID) {
		List<Account> accounts = new ArrayList<>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Transaction tr = session.beginTransaction();
			String hql = "FROM Account WHERE AccountID =:accountID";
			Query query = session.createQuery(hql);
			query.setParameter("accountID", accountID);
			accounts = query.list();
			tr.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (accounts.size() > 0) {
			return accounts.get(0);
		}
		return null;

	}

	@Override
	public boolean forgotPassword(String username, String password) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tr = session.beginTransaction();
		try {
			Account account = getAccountByEmail(username);
			if (account != null) {
				account.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
				session.update(account);
			}
			tr.commit();
			return true;
		} catch (Exception e) {
			tr.rollback();
			System.out.println(e.getMessage());
		}finally {
			session.close();
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Account> listAccountWithRole(EnumRoleID roleID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction t = session.beginTransaction();
		List<Account> list = null;
		try {

			String hql = "FROM Account WHERE RoleID = :roleID";
			Query query = session.createQuery(hql);
			query.setParameter("roleID", roleID.toString());
			list = query.list();

			t.commit();
		} catch (HibernateException e) {
			if (session != null && session.getTransaction() != null) {
				t.rollback(); // Rollback nếu có lỗi
			}
			e.printStackTrace(); // Xử lý hoặc ghi log lỗi
		} finally {
			if (session != null && session.isOpen()) {
				session.close(); // Đóng session
			}
		}
		return list;
	}

	@Override
	public List<Account> listAccounts() {
		Session ss = HibernateUtil.getSessionFactory().getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Account> list = ss.createQuery("FROM Account").list();
		return list;
	}

	@Override
	public boolean updateAccount(Account account) {
		Session ss = HibernateUtil.getSessionFactory().openSession();
		Transaction t = ss.beginTransaction();
		try {
			ss.update(account);
			t.commit();
			return true;
		} catch (Exception e) {
			System.out.println("Update Account - error: " + e.getMessage());
			t.rollback();
		} finally {
			ss.close();
		}
		return false;
	}

	@Override
	public boolean deleteAccount(Account account) {
		Session ss = HibernateUtil.getSessionFactory().openSession();
		Transaction t = ss.beginTransaction();
		try {
			ss.delete(account);
			t.commit();
			return true;
		} catch (Exception e) {
			System.out.println("Delete Account - error: " + e.getMessage());
			t.rollback();
		} finally {
			ss.close();
		}
		return false;
	}

}
