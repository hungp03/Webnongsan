package ecofarm.DAO;

import java.util.List;

import ecofarm.entity.Category;

public interface CategoryDAO {
	public boolean deleteCategory(Category category);

	public boolean addCategory(Category newCategory);

	public List<Category> getListCategories();

	public List<Category> getListCategoriesHasProduct();

	public Category getCategory(int id);

	public boolean updateCategory(Category changedCategory);

	public List<Category> searchCategory(String alikeName);

	public Category fetchCategory(Category category);
}
