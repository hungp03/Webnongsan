package ecofarm.DAO;

import java.util.List;

import ecofarm.entity.OrderDetail;
import ecofarm.entity.Orders;

public interface OrderDAO {
	public List<Orders> getOrderFromAccount(int accountId);

	public List<Orders> getOrderFromProduct(int productId);

	public List<OrderDetail> getOrderDetail(int orderId);

	public Orders findOrder(int id);

	public boolean update(Orders order);

	public boolean insertOrder(Orders order);

	public boolean insertOrderDetail(OrderDetail orderDetail);

	public boolean updateOrder(Orders order);

	public Orders fetchOrderDetail(Orders order);

	public List<Orders> getUnresolveOrders();

	public List<Orders> getMovingOrders();

	public List<Orders> getResolveOrders();

	public List<Orders> getCancelOrders();

	public List<Orders> getOrders();
}
