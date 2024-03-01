package ecofarm.DAOImpl;

import java.util.ArrayList;
import java.util.List;

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
		List<Category> list = new ArrayList();
		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			if(sessionFactory!=null) {
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
//	public List<Cat> selectAll() {
//		List<Cat> list = new ArrayList();
//		try {
//			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//			if(sessionFactory!=null) {
//				Session session = sessionFactory.openSession();
//				Transaction tr = session.beginTransaction();
//				// Thuc thi cau lenh HQL
//				String hql = "from Cat";
//				Query query = session.createQuery(hql);
//				list = query.getResultList();
//				tr.commit();
//				session.close();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
}
