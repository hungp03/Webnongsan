package ecofarm.controller.admin;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ecofarm.DAOImpl.CategoryDAOImpl;
import ecofarm.DAOImpl.PaginateDAOImpl;
import ecofarm.DAOImpl.ProductDAOImpl;
import ecofarm.bean.ProductBean;
import ecofarm.bean.UploadFile;
import ecofarm.entity.Account;
import ecofarm.entity.Category;
import ecofarm.entity.Product;
import ecofarm.utility.Paginate;
import ecofarm.utility.TimeUtil;

@Controller
@RequestMapping("admin/products")
public class AdminControllerProduct {
	private final int PROD_PER_PAGE = 5;
	private CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	private PaginateDAOImpl paginateDAO = new PaginateDAOImpl();
	private ProductDAOImpl productDAO = new ProductDAOImpl();

	@RequestMapping()
	public String getListProduct(ModelMap model,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage) {
		List<Product> products = productDAO.getAllProducts();
		int totalProducts = products.size();
		Paginate paginate = paginateDAO.getInfoPaginate(totalProducts, PROD_PER_PAGE, crrPage);
		List<Product> prods = products.subList(paginate.getStart(), paginate.getEnd());
		model.addAttribute("paginate", paginate);
		model.addAttribute("products", prods);

		return "admin/product-list";
	}

	@RequestMapping("searchProduct")
	public String searchProduct(@RequestParam(required = false, value = "search") String search,
			@RequestParam(required = false, value = "crrPage", defaultValue = "1") int crrPage, ModelMap model) {
		List<Product> products = productDAO.searchProducts(search);
		// System.out.println(products.size());
		Paginate paginate = paginateDAO.getInfoPaginate(products.size(), PROD_PER_PAGE, crrPage);
		List<Product> prods = products.subList(paginate.getStart(), paginate.getEnd());
		model.addAttribute("paginate", paginate);
		model.addAttribute("products", prods);

		return "admin/product-list";
	}

	@Autowired
	@Qualifier("productImgDir")
	UploadFile productImgUpload;

	@RequestMapping(value = "create-product", method = RequestMethod.GET)
	public String getAddProduct(ModelMap model) {

		ProductBean productBean = new ProductBean();
		List<Category> cates = categoryDAO.getAllCategories();
		model.addAttribute("addProdBean", productBean);
		model.addAttribute("categories", cates);
		return "admin/product-form";
	}

	@RequestMapping(value = "create-product", method = RequestMethod.POST)
	public String postAddProduct(@ModelAttribute("addProdBean") ProductBean product, HttpSession session,
			RedirectAttributes re, ModelMap model) {

		Account acc = (Account) session.getAttribute("userInfo");
		if (acc == null) {
			System.out.print("Khong co user");
			return "redirect:/logout.htm";
		}

		Product newProduct = new Product();
		newProduct.setAccount(acc);
		Category category = categoryDAO.getCategory(product.getCategoryId());
		if (category != null) {
			newProduct.setCategory(category);
		} else {
			re.addFlashAttribute("mess", "Không tìm thấy category");
			return "redirect:/admin/products.htm";
		}
		if (!product.getImageFile().isEmpty()) {
			String photoName = productImgUpload.uploadImage(product.getImageFile());
			newProduct.setImage(photoName);
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		newProduct.setUnit(product.getUnit());
		newProduct.setPostingDate(TimeUtil.getCurrentTime());
		newProduct.setProductName(product.getProductName());
		newProduct.setPrice(product.getPrice());
		newProduct.setQuantity(product.getQuantity());
		newProduct.setDetail(product.getDetail());
		newProduct.setPostingDate(product.getPostingDate());

		boolean done = productDAO.insertProduct(newProduct);
		if (!done) {
			model.addAttribute("mess", "Thêm product thất bại");
			return "admin/product-form";
		}
		re.addFlashAttribute("mess", "Thêm thành công");
		return "redirect:/admin/products.htm";
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteProduct(@RequestParam("id") int id, RedirectAttributes re) {
		Product prod = productDAO.getProductByID(id);
		if (productDAO.deleteProduct(prod)) {
			try {
				if (prod.getImage() != null) {
					File oldImage = new File(productImgUpload.getBasePath() + prod.getImage());
					if (oldImage.exists()) {
						oldImage.delete();
					}
				}
			} catch (Exception e) {
				re.addFlashAttribute("mess", "Check product image again");
			}
			re.addFlashAttribute("mess", "Delete successful");
		} else {
			re.addFlashAttribute("mess", "An error occurred when delete");
		}
		return "redirect:/admin/products.htm";
	}

	@RequestMapping(value = "update_product/{id}", method = RequestMethod.GET)
	public String getUpdateProduct(@PathVariable("id") int id, ModelMap model) {
		Product prod = productDAO.getProductByID(id);
		List<Category> cates = categoryDAO.getAllCategories();
		ProductBean productBean = new ProductBean(prod);
		model.addAttribute("categories", cates);
		model.addAttribute("updateProdBean", productBean);
		return "admin/product-form";
	}

	@RequestMapping(value = "update_product/{id}", method = RequestMethod.POST)
	public String postUpdateProduct(@ModelAttribute("updateProdBean") ProductBean product, RedirectAttributes re,
			ModelMap model) {
		Product foundProd = productDAO.getProductByID(product.getProductId());
		if (foundProd != null) {
			Category category = categoryDAO.getCategory(product.getCategoryId());
			if (category != null) {
				foundProd.setCategory(category);
			}
			try {
				// nếu có cập nhật ảnh mới
				if (!product.getImageFile().isEmpty()) {
					String newImage = productImgUpload.uploadImage(product.getImageFile());
					// nếu có ảnh cũ, xóa nó đi
					if (foundProd.getImage() != null) {
						File oldImage = new File(productImgUpload.getBasePath() + foundProd.getImage());
						if (oldImage.exists()) {
							oldImage.delete();
						}
					}
					// Cập nhật ảnh mới cho cate
					foundProd.setImage(newImage);
					Thread.sleep(2000);
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("mess", "An error occurred");
				model.addAttribute("updateProdBean", product);
				return "admin/product-form";
			}
			foundProd.setUnit(product.getUnit());
			foundProd.setProductName(product.getProductName());
			foundProd.setPrice(product.getPrice());
			foundProd.setQuantity(product.getQuantity());
			productDAO.updateProduct(foundProd);
			re.addFlashAttribute("mess", "Update successful");
		}
		return "redirect:/admin/products.htm";
	}
}
