package ecofarm.controller.user;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ecofarm.DAO.IAccountDAO;
import ecofarm.DAO.ICartDAO;
import ecofarm.DAO.IFeedbackDAO;
import ecofarm.DAO.IProductDAO;
import ecofarm.bean.FeedbackBean;
import ecofarm.entity.Account;
import ecofarm.entity.Cart;
import ecofarm.entity.Feedback;
import ecofarm.entity.Product;

@Controller
public class FeedbackController {
	@Autowired
	IProductDAO productDAO;
	@Autowired
	IAccountDAO accountDAO;
	@Autowired
	ICartDAO cartDAO;
	@Autowired
	IFeedbackDAO feedbackDAO;

	@RequestMapping(value = { "/addFeedback" }, method = RequestMethod.GET)
	public String showwAddFeedbackForm(HttpServletRequest request, HttpSession session,
			@RequestParam(value = "productId", required = true) int productId,
			@CookieValue(value = "userEmail", defaultValue = "", required = false) String userEmail, Model model) {
		if (userEmail.equals("")) {
			request.setAttribute("user", new Account());
			return "user/login";
		}
		Account account = accountDAO.getAccountByEmail(userEmail);
		if (account != null) {
			cartDAO.addToCart(productId, account.getAccountId());
			Product product = productDAO.getProductByID(productId);
			List<Cart> list = cartDAO.getCartByAccountID(account.getAccountId());

			session.setAttribute("carts", list);
			session.setAttribute("totalPrice", cartDAO.getTotalPrice(list));
			request.setAttribute("userInfo", account);
			request.setAttribute("product", product);
			FeedbackBean feedback = new FeedbackBean();
			feedback.setAccountID(account.getAccountId());
			feedback.setProductID(productId);
			feedback.setStatus(1);
			model.addAttribute("feedback", feedback);
			return "user/addFeedback";
		}
		return "user/index";
	}

	@RequestMapping(value = { "/addFeedback" }, method = RequestMethod.POST)
	public String addFeedbackForm(@Validated @ModelAttribute("feedback") FeedbackBean feedbackBean,BindingResult errors,ModelMap model,
			HttpServletRequest request,
			@RequestParam(value = "productId", required = true) int productId,
			@CookieValue(value = "userEmail", defaultValue = "", required = false) String userEmail) {
		if (feedbackBean.getFeedbackContent().equals(null)) {
			    errors.rejectValue("feedbackContent", "feedbackBean", "Tên không được bỏ trống và không chấp nhận kí tự đặc biệt");
			}

		if (errors.hasErrors()) {
			model.addAttribute("message", "Chi tiết đánh giá không hợp lệ.");
		} else {
			feedbackBean.setPostingDate(new Date());
			Account account = accountDAO.getAccountByEmail(userEmail);
			Product product = productDAO.getProductByID(productId);
			feedbackBean.setStatus(1);
			Feedback feedback = new Feedback();
			feedback.setAccount(account);
			feedback.setFeedbackContent(feedbackBean.getFeedbackContent());
			feedback.setPostingDate(feedbackBean.getPostingDate());
			feedback.setProduct(product);
			feedback.setRatingStar(feedbackBean.getRatingStar());
			feedback.setStatus(feedbackBean.getStatus());
			boolean res = feedbackDAO.addFeedback(feedback);
			if(res) {
				model.addAttribute("message","Thêm feedback thành công");
			}else {
				model.addAttribute("message","Thêm feedback thất bại");
			}
		}
		return "redirect:index.htm";
	}
}
