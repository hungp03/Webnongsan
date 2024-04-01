package ecofarm.DAOImpl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ecofarm.DAO.IOrderDAO;
import ecofarm.entity.OrderDetail;
import ecofarm.entity.Orders;
import ecofarm.utility.HibernateUtil;


public class OrderDAOImpl implements IOrderDAO {

	@Override
	public List<Orders> getOrderFromAccount(int accountId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			String hql = "FROM Orders WHERE account.accountID = :accountId";
			Query query = session.createQuery(hql);
			query.setParameter("accountId", accountId);
			@SuppressWarnings("unchecked")
			List<Orders> orderList = query.list();
			return orderList;
		} finally {
			session.close();
		}
	}

	@Override
	public List<OrderDetail> getOrderDetail(int orderId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			String hql = "FROM OrderDetail WHERE order.orderId = :orderId";
			Query query = session.createQuery(hql);
			query.setParameter("orderId", orderId);
			@SuppressWarnings("unchecked")
			List<OrderDetail> list = query.list();
			return list;
		} finally {
			session.close();
		}
	}

	@Override
	public boolean insertOrder(Orders order) {
		Session ss = HibernateUtil.getSessionFactory().openSession();
		Transaction t = ss.beginTransaction();
		try {
			ss.save(order);
			t.commit();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			ss.close();
		}
		return false;
	}

	@Override
	public boolean insertOrderDetail(OrderDetail orderDetail) {
		Session ss = HibernateUtil.getSessionFactory().openSession();
		Transaction t = ss.beginTransaction();
		try {

			ss.save(orderDetail);
			t.commit();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			ss.close();

		}
		return false;
	}

	@Override
	public boolean updateOrder(Orders order) {
		Session ss = HibernateUtil.getSessionFactory().openSession();
		Transaction t = ss.beginTransaction();
		try {

			ss.saveOrUpdate(order);
			t.commit();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			ss.close();

		}
		return false;
	}

	@Override
	public List<Orders> getUnresolveOrders() {
		String hql = "From Orders where status = 0";
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Orders> listOrders = query.list();
		return listOrders;
	}

	@Override
	public List<Orders> getMovingOrders() {
		String hql = "From Orders where status = 1";
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Orders> listOrders = query.list();
		return listOrders;
	}

	@Override
	public List<Orders> getResolveOrders() {
		String hql = "From Orders where StatusOrder = 2";
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Orders> listOrders = query.list();
		return listOrders;
	}

	@Override
	public List<Orders> getCancelOrders() {
		String hql = "From Orders where StatusOrder = 3";
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Orders> listOrders = query.list();
		return listOrders;
	}

	@Override
	public boolean update(Orders order) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(order);
			t.commit();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();

		}
		return false;
	}

	@Override
	public Orders fetchOrderDetail(Orders order) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Orders tOrder = null;
		try {
			tOrder = (Orders) session.get(Orders.class, order.getOrderId());
			Hibernate.initialize(tOrder.getOrderDetails());
			tx.commit();

		} catch (Exception e) {
			tx.rollback();
			System.out.println("Fetch Order occur error");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return tOrder == null ? order : tOrder;
	}

	@Override
	public Orders findOrder(int id) {
		String hql = "FROM Orders WHERE orderId = :id";
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Orders order = null;
		try {
			order = (Orders) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return order;
	}

	@Override
	public List<Orders> getOrders() {
		 try {
		        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        session.beginTransaction(); 
		        String hql = "From Orders";
		        Query query = session.createQuery(hql);
		        @SuppressWarnings("unchecked")
		        List<Orders> listOrders = query.list();
		        session.getTransaction().commit();
		        return listOrders;
		    } catch (HibernateException ex) {
		        throw ex; 
		    }
	}
}
