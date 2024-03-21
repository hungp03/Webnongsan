package ecofarm.controller.user;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ecofarm.DAOImpl.AccountDAOImpl;
import ecofarm.DAOImpl.CategoryDAOImpl;
import ecofarm.DAOImpl.ProductDAOImpl;


@Controller
public class HomeController {

	private CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	private ProductDAOImpl productDAO = new ProductDAOImpl();
	private AccountDAOImpl accountDAO = new AccountDAOImpl();
	
	@RequestMapping(value={"/index"},method=RequestMethod.GET)
	public String Index(@CookieValue(value = "userEmail",defaultValue = "",required = false) String userEmail, 
			HttpServletRequest request,HttpSession session) {
		
		if(!userEmail.equals("")) {
			session.setAttribute("userInfo", accountDAO.getAccountByEmail(userEmail));
		}
		
		request.setAttribute("categories", categoryDAO.getAllCategories());
		request.setAttribute("latestProducts",productDAO.getLatestProduct());
		request.setAttribute("products",productDAO.getAllProducts());
		request.setAttribute("reviewProducts", productDAO.getReviewProduct());
		request.setAttribute("ratedProducts", productDAO.getRatedProduct());
		return "user/index";
	}
}
