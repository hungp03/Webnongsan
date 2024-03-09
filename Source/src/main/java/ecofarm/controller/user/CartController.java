package ecofarm.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ecofarm.DAOImpl.AccountDAOImpl;
import ecofarm.DAOImpl.CartDAOImpl;
import ecofarm.entity.Account;

@Controller
public class CartController {
	private AccountDAOImpl accountDAO = new AccountDAOImpl();
	private CartDAOImpl cartDAO = new CartDAOImpl();
	@RequestMapping("cart")
	public String Index() {
		
		return "user/cart";
	}
	@RequestMapping("/AddCart")
	public String AddToCart(@RequestParam(value = "productID",required = true) int productID,
			@CookieValue(value = "userEmail",defaultValue = "",required = false) String userEmail,
			HttpSession session, HttpServletRequest request) {
//		System.out.println(userEmail);
		Account account = accountDAO.getAccountByEmail(userEmail);
//		System.out.println(account.getAccountId());
		
		cartDAO.addToCart(productID,account.getAccountId());
		return "redirect:"+request.getHeader("Referer");
	}
}
