package ecofarm.DAO;

import java.util.List;

import ecofarm.entity.Feedback;

public interface IFeedbackDAO {
	public List<Feedback> getFeedbackByProduct(int productId);
	public boolean addFeedback(int productId,int accountId);
}
