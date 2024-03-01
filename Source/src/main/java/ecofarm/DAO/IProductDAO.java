package ecofarm.DAO;

import java.util.List;

import ecofarm.entity.Product;

public interface IProductDAO {
	public List<Product> getProductsByCategoryID();
	public Product getProductByID();
}
