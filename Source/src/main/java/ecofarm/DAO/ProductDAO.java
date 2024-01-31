package ecofarm.DAO;

import java.util.Date;
import java.util.List;

import ecofarm.entity.Account;
import ecofarm.entity.Product;
public interface ProductDAO {
	public List<Product> listProducts(String productName, float price, String image, int quantity, String detail,
			Date postingDate, Date expiryDate);

	public List<Product> listProducts(int accountId);

	public List<Product> filterProductByName(String name);

	public List<Product> listProductsWithCoupon();

	public List<Product> listNewProducts();

	public List<Product> listBestSellerProducts();

	public List<Product> listProductsInCategory(int categoryId);

	public boolean insertProduct(Product product);

	public boolean updateProduct(Product product);

	public boolean deleteProduct(Product product);

	public Product getProduct(int id);

	public Account fetchProductsAccount(Account acc);
}
