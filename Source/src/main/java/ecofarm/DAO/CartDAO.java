package ecofarm.DAO;

import java.util.List;

import ecofarm.entity.Cart;

public interface CartDAO {
	public boolean insertCart(Cart cart);

	public boolean deleteCart(Cart cart);

	public boolean updateCart(Cart cart);

	public int updateQuantity(int productId, int quantity);

	public Cart getCart(int accountId, int productId);

	public List<Cart> getCart(int accountId);

	public int removeCart(int accountId);

}
