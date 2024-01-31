package ecofarm.DAO;

import java.util.List;

import ecofarm.entity.Wishlist;

public interface WishlistDAO {
	boolean insertWishlist(Wishlist wishlist);

	boolean deleteWishlist(Wishlist wishlist);

	boolean updateWishlist(Wishlist wishlist);

	Wishlist getWishlist(int accountId, int productId);

	List<Wishlist> Wishlist(int accountId);

	int removeWishlist(int accountId);

	List<Wishlist> getWishlist(int accountId);

}