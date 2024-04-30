package ecofarm.DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.transaction.annotation.Transactional;
import ecofarm.DAO.IProfileDAO;
import ecofarm.entity.Account;
import ecofarm.entity.Address;
import ecofarm.entity.District;
import ecofarm.entity.Feedback;
import ecofarm.entity.OrderDetail;
import ecofarm.entity.Province;
import ecofarm.entity.Ward;
@Transactional
public class ProfileDAOImpl implements IProfileDAO{

	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Account getProfileInfo(Account account) {
		Account accountInfo = null;
		Session session = sessionFactory.openSession();
		try {
			int accountID = account.getAccountId();
			Transaction tr = session.beginTransaction();
			String hql = "FROM Account WHERE AccountID =:accountID";
			Query query = session.createQuery(hql);
			query.setParameter("accountID", accountID);
			accountInfo = (Account) query.uniqueResult(); // Lấy phần tử duy nhất
			tr.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		return accountInfo;
	}
	@Override
	@SuppressWarnings("unchecked")
	public Account getAccountByID(int accountID) {
		List<Account> accounts = new ArrayList<>();
		Session session = sessionFactory.openSession();
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
//		System.out.println(accounts.get(0).getAccountId());
		if (accounts.size() > 0) {
			return accounts.get(0);
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Address> getAllAddressInfo(Account account) {
		List<Address> allAddressInfo = new ArrayList<>();
		Session session = sessionFactory.openSession();
		try {
			int accountID = account.getAccountId();
			Transaction tr = session.beginTransaction();
			String hql = "FROM Address WHERE accountID =:accountID";
			Query query = session.createQuery(hql);
			query.setParameter("accountID", accountID);
			allAddressInfo = query.list();
			tr.commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		return allAddressInfo;
	}
	@Override
	public boolean changePassword(Account account, String newPassword) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		boolean isChange = false;
		try {
			if (account != null) {
				account.setPassword(BCrypt.hashpw(newPassword, BCrypt.gensalt(12)));
				session.update(account);
			}
			tr.commit();
			isChange = true;
		} catch (Exception e) {
			tr.rollback();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return isChange;
	}
	@Override
	public boolean changeProfileInfo(int accountID, Account changeInfo) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		boolean isUpdated = false;
		try {
			Account updatedAccount = getAccountByID(accountID);
			String newFirstName = changeInfo.getFirstName();
			String newLastName = changeInfo.getLastName();
			String newEmail = changeInfo.getEmail();
			String newPhoneNumber = changeInfo.getPhoneNumber();
			updatedAccount.setFirstName(newFirstName);

			updatedAccount.setLastName(newLastName);
			updatedAccount.setEmail(newEmail);
			updatedAccount.setPhoneNumber(newPhoneNumber);
			session.update(updatedAccount);
			tr.commit();
			isUpdated = true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		return isUpdated;
	}
	@Override
	public boolean deleteAddress(int deletedAddressId) {
		Session session = sessionFactory.openSession();
		boolean isDeleted = false;
		try {
			String hql = "FROM Address WHERE addressId =:deletedAddressId";
			Query query = session.createQuery(hql);
			query.setParameter("deletedAddressId", deletedAddressId);
			Address deletedAddress = (Address) query.uniqueResult();
			if (deletedAddress == null) {
				session.close();
				return false;
			}
			Transaction tr = session.beginTransaction();
			session.delete(deletedAddress);
			tr.commit();
			isDeleted = true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		return isDeleted;
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<District> getDistrict(int provinceId) {
		List<District> allDistrict = new ArrayList<>();
		Session session = sessionFactory.openSession();
		try {
			String hql = "FROM District WHERE ProvinceID =:provinceId";
			Query query = session.createQuery(hql);
			query.setParameter("provinceId", provinceId);
			allDistrict = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		return allDistrict;
	}
	@Override
	public Ward getWard(int wardId) {
		Session session = sessionFactory.openSession();
		Ward ward = null;
		try {
			String hql = "FROM Ward WHERE WardID =:wardId";
			Query query = session.createQuery(hql);
			query.setParameter("wardId", wardId);
			ward = (Ward) query.uniqueResult();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		return ward;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Province> getAllProvince() {
		List<Province> allProvince = new ArrayList<>();
		Session session = sessionFactory.openSession();
		try {
			String hql = "FROM Province";
			Query query = session.createQuery(hql);
			allProvince = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		return allProvince;
	}
	
	@Override
	public List<OrderDetail> getAllOrderDetail(Account account) {
		Session session = sessionFactory.openSession();
		try {
			int accountID = account.getAccountId();
			String hql = "FROM Order WHERE AccountID =:accountID ";
			Query query = session.createQuery(hql);
			query.setParameter("accountID", accountID);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}


	@Override
	public List<Feedback> getAllFeedbackDetail(Account account) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean addNewAddress(Address newAddress) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		boolean isCreate = false;
		try {
			session.save(newAddress);
			isCreate = true;
			tr.commit();
		}catch (Exception e) {
			// TODO: handle exception
			tr.rollback();
			System.out.println(e.getMessage());
			e.printStackTrace();
		}finally {
			session.close();
		}
		return isCreate;
	}
	@Override
	public boolean checkPassword(int accountId,String password) {
		Account account = getAccountByID(accountId);
		boolean isSameAsOldPassword = false;
		String encryptedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
		if(encryptedPassword.equals(account.getPassword())) {
			isSameAsOldPassword = true;
		}
		return isSameAsOldPassword;
	}
//	@Override
//	public boolean changePassword(int accountId, String password) {
//		// TODO Auto-generated method stub
//		Session session = sessionFactory.openSession();
//		Transaction tr = session.beginTransaction();
//		boolean isChange = false;
//		try {
//			Account account = getAccountByID(accountId);
//			account.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
//			session.save(account);
//			tr.commit();
//			isChange = true;
//		}catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//			e.printStackTrace();
//		}finally {
//			session.close();
//		}
//		return false;
//	}
	
//	public boolean checkPassword(int accountId,String password) {
//		Session session = sessionFactory.openSession();
//		boolean isSameAsOldPassword = false;
//		try {
//			String hql = "FROM Account WHERE AccountID = :accountId";
//			Query query = session.createQuery(hql);
//			Account account = (Account) query.uniqueResult();
//			
//			Transaction tr = session.beginTransaction();
////			String encryptedPassword = BCrypt.hashpw(account.getPassword(), BCrypt.gensalt(12));
//		}catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//			e.printStackTrace();
//		}finally {
//			session.close();
//		}
//		return false;
//	}
}
