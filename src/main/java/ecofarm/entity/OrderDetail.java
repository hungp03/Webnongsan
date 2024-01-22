package ecofarm.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;


@Entity
@Table(name = "OrderDetail", schema = "dbo", catalog = "DB_Webns")
public class OrderDetail {

	@EmbeddedId
	private OrderDetailId id;

	@ManyToOne(fetch = FetchType.EAGER)
	@MapsId("order_Id")
	@JoinColumn(name = "Order_ID", nullable = false, insertable = false, updatable = false)
	private Orders order;

	@ManyToOne(fetch = FetchType.EAGER)
	@MapsId("product_Id")
	@JoinColumn(name = "Product_ID", nullable = false, insertable = false, updatable = false)
	private Product product;

	@Column(name = "Quantity", nullable = false)
	private int quantity;

	public OrderDetail(OrderDetailId id, Orders order, Product product, int quantity) {
		this.id = id;
		this.order = order;
		this.product = product;
		this.quantity = quantity;
	}

	public OrderDetail() {

	}

	public OrderDetailId getId() {
		return this.id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}

	public Orders getOrder() {
		return this.order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}