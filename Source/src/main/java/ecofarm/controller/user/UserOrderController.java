package ecofarm.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ecofarm.entity.Account;
import ecofarm.entity.Cart;
import ecofarm.entity.Category;
import ecofarm.DAO.IAccountDAO;
import ecofarm.DAO.ICartDAO;
import ecofarm.DAO.ICategoryDAO;

@Controller
@RequestMapping(value = "/order")
public class UserOrderController {
	@Autowired
	private ICartDAO cartDAO;
	@Autowired
	private IAccountDAO accountDAO;
	@Autowired
	private ICategoryDAO categoryDAO;
	
	@RequestMapping(value = "checkout")
	public String detail(ModelMap model, HttpServletRequest request, HttpSession session,
			@CookieValue(value = "userEmail", defaultValue = "", required = false) String userEmail) {
		if (userEmail != null && !userEmail.isEmpty() ) {
			List<Category> cates = categoryDAO.getAllCategories();
			Account account = accountDAO.getAccountByEmail(userEmail);
			List<Cart> cart = cartDAO.getCartByAccountID(account.getAccountId());
			model.addAttribute("cart", cart);
			model.addAttribute("categories", cates);
			model.addAttribute("user", account);
			return "user/order/checkout";
		}
		return "redirect:login.htm";
	}
}
