package ecofarm.controller.user;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ecofarm.DAOImpl.CategoryDAOImpl;
import ecofarm.DAOImpl.ProductDAOImpl;


@Controller
public class HomeController {

	private CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	private ProductDAOImpl productDAO = new ProductDAOImpl();
	
	@RequestMapping(value={"/index"},method=RequestMethod.GET)
	public ModelAndView Index() {
		ModelAndView mv = new ModelAndView("user/index");
		mv.addObject("categories", categoryDAO.getAllCategories());
		mv.addObject("latestProducts",productDAO.getLatestProduct());
		mv.addObject("products",productDAO.getAllProducts());
		return mv;
	}
}
