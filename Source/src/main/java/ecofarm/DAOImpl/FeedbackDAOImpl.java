package ecofarm.DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ecofarm.DAO.IFeedbackDAO;
import ecofarm.entity.Feedback;
import ecofarm.utility.HibernateUtil;

public class FeedbackDAOImpl implements IFeedbackDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Feedback> getFeedbackByProduct(int productId) {
		List<Feedback> list = new ArrayList<>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tr = session.beginTransaction();
		try {
			String hql = "FROM Feedback WHERE ProductID = :productId";
			Query query = session.createQuery(hql);
			query.setParameter("productId", productId);
			list = query.list();
			tr.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tr.rollback();
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			session.close();
		}
		if(list.size() > 0) return list;
		return null;
	}

	@Override
	public boolean addFeedback(int productId, int accountId) {
		// TODO Auto-generated method stub
		return false;
	}

}
