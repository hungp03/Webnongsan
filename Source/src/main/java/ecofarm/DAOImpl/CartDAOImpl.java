package ecofarm.DAOImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ecofarm.DAO.ICartDAO;
import ecofarm.entity.Account;
import ecofarm.entity.Cart;
import ecofarm.entity.CartId;
import ecofarm.entity.Product;
import ecofarm.utility.HibernateUtil;

public class CartDAOImpl implements ICartDAO {
	private ProductDAOImpl productDAO = new ProductDAOImpl();
	private AccountDAOImpl accountDAO = new AccountDAOImpl();
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Cart> getCartByAccountID(int accountID) {
		List<Cart> list = new ArrayList<>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Transaction tr = session.beginTransaction();
			String hql = "FROM Cart WHERE AccountID =: accountID";
			Query query = session.createQuery(hql);
			query.setParameter("accountID", accountID);
			list = query.list();
			tr.commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean addToCart(int productID, int accountID) {
		boolean isAdded = false;
		Cart cart = new Cart();
		CartId cartId = new CartId();
		cartId.setAccountId(accountID);
		cartId.setProductId(productID);
		
		Product product = productDAO.getProductByID(productID);
		Account account = accountDAO.getAccountByID(accountID);
		
		Cart checkCart = getCartByID(productID, accountID);
		if(product!=null) {
			cart.setAccount(account);
			cart.setProduct(product);
			cart.setId(cartId);
			if(checkCart==null) {
				cart.setQuantity(1);
				Session session = HibernateUtil.getSessionFactory().openSession();
				try {
					Transaction tr = session.beginTransaction();
					session.save(cart);
					tr.commit();
					isAdded = true;
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					e.printStackTrace();
				}finally {
					session.close();
				}
			}else {
				cart.setQuantity(checkCart.getQuantity()+1);
				Session session = HibernateUtil.getSessionFactory().openSession();
				try {
					Transaction tr = session.beginTransaction();
					session.update(cart);
					tr.commit();
					isAdded = true;
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					e.printStackTrace();
				}finally {
					session.close();
				}
			}
		}
		return isAdded;
	}
	@SuppressWarnings("unchecked")
	private Cart getCartByID(int productID, int accountID) {
		List<Cart> list = new ArrayList<>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Transaction tr = session.beginTransaction();
			String hql = "FROM Cart WHERE AccountID =:accountID AND ProductID =:productID";
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
		if(list.size() > 0) return list.get(0);
		else return null;
	}

	@Override
	public HashMap<Long, Cart> editCart(long id, HashMap<Long, Cart> cart, int quantity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<Long, Cart> deleteCart(long id, HashMap<Long, Cart> cart) {
		// TODO Auto-generated method stub
		return null;
	}

}
