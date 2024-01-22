package ecofarm.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminControllerCategory {
	
	//Chuyển hướng từ trang /index sang trang chủ admin /admin/dashboard
	@RequestMapping("index")
	public String index() {
		return "redirect:/admin/dashboard.htm";
	}
	
}
