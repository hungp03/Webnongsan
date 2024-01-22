package ecofarm.DAO;

import java.util.List;

import ecofarm.entity.Cart;

public interface CartDAO {
	boolean insertCart(Cart cart);

	boolean deleteCart(Cart cart);

	boolean updateCart(Cart cart);

	int updateQuantity(int productId, int quantity);

	Cart getCart(int accountId, int productId);

	List<Cart> getCart(int accountId);

	int removeCart(int accountId);

}
