package ecofarm.DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ecofarm.DAO.IWishlistDAO;
import ecofarm.entity.Account;
import ecofarm.entity.Product;
import ecofarm.entity.Wishlist;
import ecofarm.entity.WishlistId;
import ecofarm.utility.HibernateUtil;

public class WishlistDAOImpl implements IWishlistDAO {
	private ProductDAOImpl productDAO = new ProductDAOImpl();
	private AccountDAOImpl accountDAO = new AccountDAOImpl();

	@Override
	@SuppressWarnings("unchecked")
	public List<Wishlist> getWishlistByAccountID(int accountID) {
		List<Wishlist> list = new ArrayList<>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Transaction tr = session.beginTransaction();
			String hql = "FROM Wishlist WHERE AccountID = :accountID";
			Query query = session.createQuery(hql);
			query.setParameter("accountID", accountID);
			list = query.list();
			tr.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	private Wishlist getWishlistbyID(int productID, int accountID) {
		List<Wishlist> list = new ArrayList<>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Transaction tr = session.beginTransaction();
			String hql = "FROM Wishlist WHERE AccountID =:accountID AND ProductID =:productID";
			Query query = session.createQuery(hql);
			query.setParameter("accountID", accountID);
			query.setParameter("productID", productID);
			list = query.list();
			tr.commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		if (list.size() > 0)
			return list.get(0);
		else
			return null;
	}
	@Override
	public boolean addToWishlist(int productID, int accountID) {
		boolean isAdded = false;

		Wishlist wishlist = new Wishlist();
		WishlistId wishlistId = new WishlistId();
		wishlistId.setAccountId(accountID);
		wishlistId.setProductId(productID);

		Product product = productDAO.getProductByID(productID);
		Account account = accountDAO.getAccountByID(accountID);

		Wishlist checkWishlist = getWishlistbyID(productID, accountID);
		if (checkWishlist == null) {
			wishlist.setAccount(account);
			wishlist.setProduct(product);
			wishlist.setId(wishlistId);
			Session session = HibernateUtil.getSessionFactory().openSession();
			try {
				Transaction tr = session.beginTransaction();
				session.save(wishlist);
				tr.commit();
				isAdded = true;
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			} finally {
				session.close();
			}
		}
		return isAdded;
	}
	@Override
	public boolean deleteFromWishlist(int wishlistID, int accountID) {
		boolean isDeleted = false;
		Wishlist checkWishlist = getWishlistbyID(wishlistID, accountID);
		if (checkWishlist != null) {
			Session session = HibernateUtil.getSessionFactory().openSession();
			try {
				Transaction tr = session.beginTransaction();
				session.delete(checkWishlist);
				tr.commit();
				isDeleted = true;

			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			} finally {
				session.close();
			}
		}
		return isDeleted;
	}

}
