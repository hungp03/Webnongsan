package ecofarm.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ecofarm.DAOImpl.CategoryDAOImpl;
import ecofarm.DAOImpl.FeedbackDAOImpl;
import ecofarm.DAOImpl.ProductDAOImpl;
import ecofarm.entity.Product;

@Controller
@RequestMapping("/product-detail")
public class ProductDetailController {
	private ProductDAOImpl productDAO = new ProductDAOImpl();
	private CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	private FeedbackDAOImpl feedbackDAO = new FeedbackDAOImpl();
	
	@RequestMapping(params = {"productId"})
	public String Index(@RequestParam("productId") String productId,HttpServletRequest request) {
		Product product = productDAO.getProductByID(Integer.parseInt(productId));
		if(product!=null) {
			request.setAttribute("product",product);
			request.setAttribute("relatedProducts",productDAO.getProductsByCategoryID(product.getCategory().getCategoryId()));
			request.setAttribute("categories", categoryDAO.getAllCategories());
			request.setAttribute("feedbacks", feedbackDAO.getFeedbackByProduct(product.getProductId()));
		}
		return "user/productDetails";
	}
}
