package ecofarm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Feedback", schema = "dbo", catalog = "DB_Webns", uniqueConstraints = @UniqueConstraint(columnNames = {
		"Account_ID", "Product_ID" }))
public class Feedback {

	@Id
	@GeneratedValue
	@Column(name = "Feedback_ID")
	private int feedbackId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "Account_ID", nullable = false)
	private Account account;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "Product_ID", nullable = false)
	private Product product;

	@Column(name = "Star", nullable = false)
	private int ratingStar;

	@Column(name = "Feedback_Content")
	private String feedbackContent;

	@Column(name = "Status", nullable = false)
	private int status;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "Posting_Date", nullable = false, length = 23)
	private Date postingDate;

	public Feedback() {
	}

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getRatingStar() {
		return this.ratingStar;
	}

	public void setRatingStar(int ratingStar) {
		this.ratingStar = ratingStar;
	}

	public String getFeedbackContent() {
		return this.feedbackContent;
	}

	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}

	public Date getPostingDate() {
		return this.postingDate;
	}

	public void setPostingDate(Date postingDate) {
		this.postingDate = postingDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
