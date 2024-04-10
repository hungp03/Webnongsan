package ecofarm.controller.admin;

import java.io.File;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ecofarm.DAOImpl.CategoryDAOImpl;
import ecofarm.DAOImpl.PaginateDAOImpl;
import ecofarm.bean.CategoryBean;
import ecofarm.bean.UploadFile;
import ecofarm.entity.Category;
import ecofarm.utility.Paginate;

@Controller
@RequestMapping("/admin/category")
public class AdminControllerCategory {
	private final int CATE_PER_PAGE = 5;
	private CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	private PaginateDAOImpl paginateDAO = new PaginateDAOImpl();

	@RequestMapping()
	public String getCategoryList(ModelMap model,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage,
			@RequestParam(value = "filter", defaultValue = "0") int filter) {

		// Lấy danh sách tất cả các categories
		List<Category> categories = categoryDAO.getAllCategories();

		// Tính toán tổng số lượng danh mục dựa trên danh sách đã lọc
		int totalCategories = categories.size();
		// Áp dụng filter
		if (filter == 1) {
			categories = categories.stream().filter(r -> r.getProducts().size() == 0).collect(Collectors.toList());
		} else if (filter == 2) {
			categories = categories.stream().filter(r -> r.getProducts().size() > 0).collect(Collectors.toList());
		}

		// Lấy thông tin phân trang
		Paginate paginate = paginateDAO.getInfoPaginate(totalCategories, CATE_PER_PAGE, crrPage);

		// Lấy danh sách category cho trang hiện tại
		List<Category> cates = categories.subList(paginate.getStart(), paginate.getEnd());

		model.addAttribute("paginate", paginate);
		model.addAttribute("categories", cates);
		model.addAttribute("filter", filter);

		return "admin/category-list";
	}

	@RequestMapping("searchCategory")
	public String gCategoryWithSearch(@RequestParam(required = false, value = "search") String search,
			@RequestParam(required = false, value = "crrPage", defaultValue = "1") int crrPage, ModelMap model) {
		List<Category> categories = categoryDAO.searchCategory(search);
		Paginate paginate = paginateDAO.getInfoPaginate(categories.size(), CATE_PER_PAGE, crrPage);

		// Lấy danh sách category cho trang hiện tại
		List<Category> cates = categories.subList(paginate.getStart(), paginate.getEnd());

		model.addAttribute("paginate", paginate);
		model.addAttribute("categories", cates);

		return "admin/category-list";
	}

	@Autowired
	@Qualifier("categoryImgDir")
	UploadFile baseUploadFile;

	@RequestMapping("addcategory")
	public String gCategoryAdd(ModelMap model) {
		CategoryBean categoryBean = new CategoryBean();
		model.addAttribute("addCate", categoryBean);
		return "admin/category-form";
	}

	@RequestMapping(value = "addcategory", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("addCate") CategoryBean categoryBean,RedirectAttributes re, BindingResult errors) {
		if (categoryBean != null) {
			Category category = new Category();
			category.setName(categoryBean.getName());
			if (!categoryBean.getFileImage().isEmpty()) {
				String photoName = baseUploadFile.uploadImage(categoryBean.getFileImage());
				category.setImage(photoName);

				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			boolean done = categoryDAO.addCategory(category);
			if (!done) {
				re.addFlashAttribute("mess", "Add failed");
			}
			re.addFlashAttribute("mess", "Add successful");
		}

		return "redirect:/admin/category.htm";
	}

	@RequestMapping("update_category{id}")
	public String gUpdateCate(@PathVariable("id") int id, ModelMap model) {
		Category cate = categoryDAO.getCategory(id);
		CategoryBean categoryBean = new CategoryBean(cate);
		model.addAttribute("updateCate", categoryBean);
		return "admin/category-form";
	}

	@RequestMapping(value = "update_category{id}", method = RequestMethod.POST)
	public String pUpdateCate(@ModelAttribute("updateCate") CategoryBean categoryBean, ModelMap model, RedirectAttributes re) {
		// Lấy cate được chọn
		Category category = categoryDAO.getCategory(categoryBean.getId());
		// nếu có cate trả về
		if (category != null) {
			// Đặt tên mới
			category.setName(categoryBean.getName());
			try {
				// nếu có cập nhật ảnh mới
				if (!categoryBean.getFileImage().isEmpty()) {
					String newImage = baseUploadFile.uploadImage(categoryBean.getFileImage());
					// nếu có ảnh cũ, xóa nó đi
					if (category.getImage() != null) {
						File oldImage = new File(baseUploadFile.getBasePath() + category.getImage());
						if (oldImage.exists()) {
							oldImage.delete();
						}
					}
					// Cập nhật ảnh mới cho cate
					category.setImage(newImage);
					Thread.sleep(2000);
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("mess", "An error occurred");
				model.addAttribute("updateCate", categoryBean);
				return "admin/category-form";
			}
			categoryDAO.updateCategory(category);
			re.addFlashAttribute("mess", "Update successful");
		}
		return "redirect:/admin/category.htm";
	}
	
	@RequestMapping(value="delete",  method = RequestMethod.POST)
	public String deleteCate(@RequestParam("id") int id, RedirectAttributes re) {
		Category category = categoryDAO.getCategory(id);
		if (categoryDAO.deleteCategory(category)) {
			try {
					// nếu có ảnh, xóa nó đi
					if (category.getImage() != null) {
						File oldImage = new File(baseUploadFile.getBasePath() + category.getImage());
						if (oldImage.exists()) {
							oldImage.delete();
						}
					}
			} catch (Exception e) {
				re.addFlashAttribute("mess", "Check category image again");
			}
			re.addFlashAttribute("mess", "Delete successful");
		} else {
			re.addFlashAttribute("mess", "An error occurred");
		}

		return "redirect:/admin/category.htm";
	}
}
