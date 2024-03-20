package ecofarm.controller.user;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ecofarm.DAOImpl.AccountDAOImpl;
import ecofarm.entity.Account;

@Controller
public class UserController {
	@Autowired
	JavaMailSender mailer;
	

	private AccountDAOImpl accountDAO = new AccountDAOImpl();
	private String validateCodeFP = "";
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

	@RequestMapping("/forgotPassword")
	public String ForgotPassword(HttpServletRequest request) {
		return "user/forgotPass/username";
	}
	@RequestMapping("/mailer/send")
	public String Send(ModelMap model,@RequestParam("email") String email, HttpServletResponse response) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			String from = "giahuyvu.1712@gmail.com";
			validateCodeFP = "";
			while (validateCodeFP.length() < 6) {
				Random rand = new Random();
				validateCodeFP += rand.nextInt(10) + "";
			}
			
			String body = """
					<h1 style="font-size:13px">Xin chào <span style="color:green; font-weight:bold">%s</span> </h1>
					<h2 style="font-size:13px">Hãy xác thực email của bạn bằng mã xác thực dưới đây:</h2>
					<div style="font-size:20px;padding:5px 10px;background-color:rgba(222,222,222,0.6);display: inline-block;margin-top:5px;margin-left:5px">
					<span style="color:rgba(25, 135, 84);font-weight:bold">%s</span></div>
					""".formatted(email,validateCodeFP);
			helper.setFrom(from,from);
			helper.setTo(email);
			helper.setReplyTo(from, from);
			helper.setSubject("Hãy xác thực tài khoản của bạn");
			helper.setText(body, true);
			mailer.send(mail);
			
			Cookie cookie = new Cookie("userEmail", email);
			cookie.setMaxAge(24*60*60);
			response.addCookie(cookie);
			
			model.addAttribute("message","Gửi mail thành công");
			return "user/forgotPass/validateCode";
		}catch (Exception e) {
			model.addAttribute("message","Gửi mail thất bại");
			return "user/forgotPass/username";
		}
	}


	@RequestMapping("mailer/forgotPassword/validateCode")
	public String ValidateCode(HttpServletRequest request,@RequestParam("validateCode") String validateCode) {
		if(validateCode.equals(validateCodeFP)) {
			return "user/forgotPass/newPassword";
		}else {
			request.setAttribute("wrongCode", "Mã sai vui lòng nhập lại");
		}
		return "user/forgotPass/validateCode";
	}
	@RequestMapping("mailer/newPassword")
	public String NewPassword(HttpServletRequest request,@RequestParam("newpass") String newPass, 
			@RequestParam("confirmPass") String confirmPass,
			@CookieValue(value = "userEmail",defaultValue = "",required = true) String userEmail,
			HttpServletResponse response) {
		Cookie cookie = new Cookie("userEmail", userEmail);
		cookie.setMaxAge(24*60*60);
		response.addCookie(cookie);
		if(newPass.equals(confirmPass)) {
			accountDAO.forgotPassword(userEmail, newPass);
			return "redirect:/index.htm";
		}else {
			request.setAttribute("wrongPassword", "New Password và Confirm Password không khớp nhau vui lòng nhập lại");	
		}
		return "user/forgotPass/validateCode";
	}
}
