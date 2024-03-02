package ecofarm.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ecofarm.DAOImpl.CategoryDAOImpl;
import ecofarm.DAOImpl.ProductDAOImpl;
import ecofarm.entity.Product;

@Controller
@RequestMapping("/product-detail")
public class ProductDetailController {
	private ProductDAOImpl productDAO = new ProductDAOImpl();
	private CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	
	@RequestMapping(params = {"productId"})
	public ModelAndView Index(@RequestParam("productId") String productId) {
		ModelAndView mv = new ModelAndView();
		Product product = productDAO.getProductByID(Integer.parseInt(productId));
		mv.addObject("product",product);
		mv.addObject("relatedProducts",productDAO.getProductsByCategoryID(product.getCategory().getCategoryId()));
		mv.addObject("categories", categoryDAO.getAllCategories());
		mv.setViewName("user/productDetails");
		return mv;
	}
}
