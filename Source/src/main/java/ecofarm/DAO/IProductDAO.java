package ecofarm.DAO;

import java.util.List;

import ecofarm.entity.Product;

public interface IProductDAO {
	public List<Product> getAllProducts();
	public List<Product> getProductsByCategoryID(int categoryID);
	public List<Product> getLatestProductsByCaID(int categoryID);
	public Product getProductByID(int productID);
	
	public List<Product> getLatestProduct();
	public List<Product> getReviewProduct();
	public List<Product> getRatedProduct();
}
