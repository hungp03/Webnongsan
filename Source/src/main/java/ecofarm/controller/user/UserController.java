package ecofarm.controller.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ecofarm.DAOImpl.AccountDAOImpl;
import ecofarm.entity.Account;

@Controller
public class UserController {

	private AccountDAOImpl accountDAO = new AccountDAOImpl();
	
	@RequestMapping(value = {"/register"},method = RequestMethod.GET)
	public String Register(HttpServletRequest request) {
		request.setAttribute("user",new Account());
		return "user/register";
	}
	
	@RequestMapping(value = {"/register"},method = RequestMethod.POST)
	public String CreateAccount(@ModelAttribute("user") Account account,HttpSession session,HttpServletRequest request) {
		boolean isAdded = false;
		if(accountDAO.checkAccountRegister(account)) {
			if(accountDAO.createAccount(account)) {
				isAdded = true;
			}
		}
		
		if(isAdded) {
			request.setAttribute("status","Đăng ký tài khoản thành công");
			session.setAttribute("userInfo", account);
			return "redirect:/index.htm";
		}else {
			request.setAttribute("status","Đăng ký tài khoản không thành công");
			return "redirect:"+request.getHeader("Referer");
		}
	}
	@RequestMapping(value = {"/login"},method = RequestMethod.GET)
	public String Login(HttpServletRequest request) {
		request.setAttribute("user", new Account());
		return "user/login";
	}
	@RequestMapping(value = {"/login"},method = RequestMethod.POST)
	public String Login(@ModelAttribute("user") Account account,
			HttpSession session,HttpServletRequest request,
			HttpServletResponse response) {
		boolean isLogin = false;
		String checkRemember = request.getParameter("isRemember");

		if(accountDAO.checkAccountLogin(account)) {	
			isLogin = true;
		}
		
		
		if(isLogin) {
			 // Lưu thông tin người dùng vào phiên nếu đăng nhập thành công
			Account loggedInUser = accountDAO.getAccountByEmail(account.getEmail());
			
			if(checkRemember!= null) {
				Cookie cookie = new Cookie("userEmail", loggedInUser.getEmail());
				cookie.setMaxAge(24*60*60);
				response.addCookie(cookie);
			}else {
				Cookie cookie = new Cookie("userEmail", loggedInUser.getEmail());
				cookie.setMaxAge(-1);
				response.addCookie(cookie);
			}
			request.setAttribute("status","Đăng nhập tài khoản thành công");
			return "redirect:/index.htm";
		}else {
			request.setAttribute("status","Đăng nhập tài khoản không thành công");
			return "redirect:"+request.getHeader("Referer");
		}
	}
	
	@RequestMapping(value = {"/logout"},method = RequestMethod.GET)
	public String Logout(HttpServletRequest request,HttpSession session, HttpServletResponse response,
			@CookieValue(value = "userEmail",defaultValue = "",required = true) String userEmail) {
		Cookie cookie = new Cookie("userEmail",userEmail);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		 // Xóa thông tin người dùng khỏi phiên
	    session.removeAttribute("userInfo");
	    session.invalidate(); // Hủy phiên đăng nhập hiện tại
		return "redirect:"+request.getHeader("Referer");
	}
}
