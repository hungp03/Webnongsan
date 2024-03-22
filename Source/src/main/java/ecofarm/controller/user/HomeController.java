package ecofarm.controller.user;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ecofarm.DAOImpl.AccountDAOImpl;
import ecofarm.DAOImpl.CartDAOImpl;
import ecofarm.DAOImpl.CategoryDAOImpl;
import ecofarm.DAOImpl.ProductDAOImpl;
import ecofarm.DAOImpl.WishlistDAOImpl;
import ecofarm.entity.Account;
import ecofarm.entity.Cart;
import ecofarm.entity.Wishlist;


@Controller
public class HomeController {

	private CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	private ProductDAOImpl productDAO = new ProductDAOImpl();
	private AccountDAOImpl accountDAO = new AccountDAOImpl();
	private CartDAOImpl cartDAO = new CartDAOImpl();
	private WishlistDAOImpl wishlistDAO = new WishlistDAOImpl();
	
	@RequestMapping(value={"/index"},method=RequestMethod.GET)
	public String Index(@CookieValue(value = "userEmail",defaultValue = "",required = false) String userEmail, 
			HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		if(!userEmail.equals("")) {
			session.setAttribute("userInfo", accountDAO.getAccountByEmail(userEmail));
			Account account =accountDAO.getAccountByEmail(userEmail);
			if(account!=null) {
				List<Cart> list = cartDAO.getCartByAccountID(account.getAccountId());
				session.setAttribute("totalPrice", cartDAO.getTotalPrice(list));
				session.setAttribute("carts", list);
				List<Wishlist> wishlist = wishlistDAO.getWishlistByAccountID(account.getAccountId());
				session.setAttribute("wishlist", wishlist);
			}
		}else {
			Account account =(Account)session.getAttribute("userInfo");
			if(account!=null) {
				Cookie cookie = new Cookie("userEmail", account.getEmail());
				cookie.setMaxAge(-1);
				response.addCookie(cookie);
				List<Cart> list = cartDAO.getCartByAccountID(account.getAccountId());
				session.setAttribute("totalPrice", cartDAO.getTotalPrice(list));
				session.setAttribute("carts", list);
				//Tính số lượng wishlist khi đăng nhập
				List<Wishlist> wishlist = wishlistDAO.getWishlistByAccountID(account.getAccountId());
				session.setAttribute("wishlist", wishlist);
				}
		}
		
		request.setAttribute("categories", categoryDAO.getAllCategories());
		request.setAttribute("latestProducts",productDAO.getLatestProduct());
		request.setAttribute("products",productDAO.getAllProducts());
		request.setAttribute("reviewProducts", productDAO.getReviewProduct());
		request.setAttribute("ratedProducts", productDAO.getRatedProduct());
		return "user/index";
	}
}
