package ecofarm.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class WishlistId implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "Product_ID", nullable = false)
	private int productId;

	@Column(name = "Account_ID", nullable = false)
	private int accountId;

	public WishlistId() {
	}

	public WishlistId(int productId, int accountId) {
		this.productId = productId;
		this.accountId = accountId;
	}

	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getAccountId() {
		return this.accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

}
