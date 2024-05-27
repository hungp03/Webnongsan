package ecofarm.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ecofarm.DAO.ICategoryDAO;
import ecofarm.bean.Company;
import ecofarm.entity.Category;
import ecofarm.utility.Mailer;

@RequestMapping("contact")
@Controller
public class ContactController {
	@Autowired
	Mailer mailer;
	@Autowired
	@Qualifier("ecofarm")
	Company company;
	@Autowired
	private ICategoryDAO categoryDAO;
	
	@RequestMapping(value="",method = RequestMethod.GET)
	public String ContactForm(HttpServletRequest request) {
		List<Category> cates = categoryDAO.getAllCategories();
		request.setAttribute("categories", cates);
		request.setAttribute("company", company);
		return "user/contact";
	}
	@RequestMapping(value="",method = RequestMethod.POST)
	public String Contact(@RequestParam("title") String title,
			@RequestParam("emailContact") String emailContact,
			@RequestParam("phone") String phone,
			@RequestParam("comments") String comments,
			ModelMap model) {
		try {
			mailer.sendForUs(emailContact, title, comments);
			model.addAttribute("message","Gửi mail thành công");
			return "redirect:/index.htm";
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
			model.addAttribute("message","Gửi mail thất bại");
			return "user/contact";
		}
	}
}
