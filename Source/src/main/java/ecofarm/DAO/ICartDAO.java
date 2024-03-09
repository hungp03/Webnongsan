package ecofarm.DAO;

import java.util.HashMap;
import java.util.List;

import ecofarm.entity.Cart;

public interface ICartDAO {
	public List<Cart> getCartByAccountID(int accountID);
	public boolean addToCart(int productID, int accountID);
	public HashMap<Long, Cart> editCart(long id, HashMap<Long, Cart> cart, int quantity);
	public HashMap<Long, Cart> deleteCart(long id, HashMap<Long, Cart> cart);
}
