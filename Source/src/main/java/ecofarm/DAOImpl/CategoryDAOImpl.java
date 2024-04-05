package ecofarm.DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import ecofarm.DAO.ICategoryDAO;
import ecofarm.entity.Category;
import ecofarm.utility.HibernateUtil;

public class CategoryDAOImpl implements ICategoryDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getAllCategories() {
		List<Category> list = new ArrayList<>();
		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				Transaction tr = session.beginTransaction();
				String hql = "from Category";
				Query query = session.createQuery(hql);
				list = query.list();
				tr.commit();
				session.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteCategory(Category category) {
		Session ss = HibernateUtil.getSessionFactory().openSession();
		Transaction t = ss.beginTransaction();
		try {
			ss.delete(category);
			t.commit();
			return true;
		} catch (Exception e) {
			System.out.println("Delete category failed: " + e.getMessage());
			t.rollback();
		} finally {
			ss.close();
		}
		return false;
	}

	@Override
	public boolean addCategory(Category newCategory) {
		Session ss = HibernateUtil.getSessionFactory().openSession();
		Transaction t = ss.beginTransaction();
		try {
			ss.save(newCategory);
			t.commit();
			return true;
		} catch (Exception e) {
			System.out.println("Add category failed: " + e.getMessage());
			t.rollback();
		} finally {
			ss.close();
		}
		return false;
	}

	@Override
	public List<Category> getListCategoriesHasProduct() {
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			Transaction t = session.beginTransaction();
			String hql = "FROM Category WHERE SIZE(products) > 0";
			Query query = session.createQuery(hql);
			@SuppressWarnings("unchecked")
			List<Category> list = query.list();
			t.commit();
			return list;
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	public Category getCategory(int id) {
		String hql = "FROM Category WHERE id = :id";
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction t = session.beginTransaction();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Category category = null;
		try {
			category = (Category) query.uniqueResult();
			t.commit();
		} catch (Exception e) {
			System.out.println(e);
		}
		return category;
	}

	@Override
	public boolean updateCategory(Category category) {
		Session ss = HibernateUtil.getSessionFactory().openSession();
		Transaction t = ss.beginTransaction();
		try {
			ss.update(category);
			t.commit();
			return true;
		} catch (Exception e) {
			System.out.println("Update category failed: " + e.getMessage());
			t.rollback();
		} finally {
			ss.close();
		}
		return false;
	}

	@Override
	public List<Category> searchCategory(String alikeName) {
		Session ss = HibernateUtil.getSessionFactory().openSession();
		Transaction t = ss.beginTransaction();

		alikeName = (alikeName == null) ? "%" : "%" + alikeName + "%";

		String hql = "FROM Category WHERE Name LIKE :name";

		Query query = ss.createQuery(hql);
		query.setParameter("name", alikeName);

		@SuppressWarnings("unchecked")
		List<Category> list = query.list();

		t.commit();
		ss.close();

		return list;
	}

	@Override
	public Category fetchCategory(Category category) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction t = session.beginTransaction();
		Category fc = null;

		try {
			fc = (Category) session.get(Category.class, category.getCategoryId());
			Hibernate.initialize(fc.getProducts());
			t.commit();

		} catch (Exception e) {
			t.rollback();
			System.out.println("Fetch Category occur error");
			System.out.println(e);
		} finally {
			session.close();
		}

		return fc == null ? category : fc;
	}
}
