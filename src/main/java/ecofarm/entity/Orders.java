package ecofarm.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Orders", schema = "dbo", catalog = "DB_Webns")
public class Orders {
	@Id
	@GeneratedValue
	@Column(name = "Order_ID", unique = true, nullable = false)
	private int orderId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "Account_ID", nullable = false)
	private Account account;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "Order_Time", nullable = false, length = 23)
	private Date orderTime;

	@Column(name = "Order_Status", nullable = false)
	private int status;

	@OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
	private Set<OrderDetail> orderDetails = new HashSet<>(0);

	@Column(name = "Address")
	private String address;

	@Column(name = "Total_Price")
	private float price;

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String defaultAddress) {
		this.address = defaultAddress;
	}

	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Date getOrderTime() {
		return this.orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int i) {
		this.status = i;
	}

	public Set<OrderDetail> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

}
