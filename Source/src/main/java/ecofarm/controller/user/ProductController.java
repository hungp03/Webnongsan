package ecofarm.controller.user;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ecofarm.DAO.ICategoryDAO;
import ecofarm.DAO.IProductDAO;
import ecofarm.DAOImpl.PaginateDAOImpl;
import ecofarm.entity.Category;
import ecofarm.entity.Product;
import ecofarm.utility.Paginate;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private IProductDAO productDAO;
	@Autowired
	private ICategoryDAO categoryDAO;
	
	private PaginateDAOImpl paginateDAO = new PaginateDAOImpl();

	@RequestMapping()
	public ModelAndView Product(@RequestParam(value = "categoryId", required = false, defaultValue = "0") int id,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		ModelAndView mv = new ModelAndView();
		List<Product> products = productDAO.getProductsByCategoryID(id);
		List<Category> cates = categoryDAO.getAllCategories();
		mv.addObject("categories", cates);
		mv.addObject("productsByCategory", products);
		mv.addObject("latestProducts", productDAO.getLatestProductsByCaID(id));
		mv.addObject("categoryID", id);
		mv.addObject("paginateInfo", paginateDAO.getInfoPaginate(products.size(), 5, currentPage));
		mv.setViewName("user/product");
		return mv;
	}
	
	@RequestMapping(value="search", method = RequestMethod.GET)
	public String getListProduct(ModelMap model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int crrPage,
			@RequestParam(value = "sort", required = false) String sort,
			@RequestParam(required = true, value = "search") String search,
			@RequestParam(value = "minPrice", required = false) BigDecimal minPrice,
	        @RequestParam(value = "maxPrice", required = false) BigDecimal maxPrice) {
		List<Product> products = productDAO.searchProducts(search);
		List<Category> cates = categoryDAO.getAllCategories();
		
		if (minPrice != null && maxPrice != null) {
	        products = filterByPriceRange(products, minPrice, maxPrice);
	    }

	    if ("name".equals(sort)) {
	        Collections.sort(products, Comparator.comparing(Product::getProductName));
	    }

	    if ("price".equals(sort)) {
	        Collections.sort(products, Comparator.comparing(Product::getPrice));
	    }
	    
	    int totalProducts = products.size();
	    		
		Paginate paginate = paginateDAO.getInfoPaginate(totalProducts, 6, crrPage);
		List<Product> prods = products.subList(paginate.getStart(), paginate.getEnd());
		model.addAttribute("categories", cates);
		model.addAttribute("paginateInfo", paginate);
		model.addAttribute("total", totalProducts);
		model.addAttribute("products", prods);
		model.addAttribute("sort", sort);
		model.addAttribute("search", search);
		return "user/searchProduct";
	}
	
	private List<Product> filterByPriceRange(List<Product> products, BigDecimal minPrice, BigDecimal maxPrice) {
	    return products.stream()
	            .filter(product -> {
	                BigDecimal price = BigDecimal.valueOf(product.getPrice());
	                return price.compareTo(minPrice) >= 0 && price.compareTo(maxPrice) <= 0;
	            })
	            .collect(Collectors.toList());
	}

}
