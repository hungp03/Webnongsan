package ecofarm.controller.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ecofarm.DAO.IAccountDAO;
import ecofarm.bean.UploadFile;
import ecofarm.entity.Account;
import ecofarm.utility.Mailer;

@Controller
public class UserController {

	@Autowired
	Mailer mailer;
	
	@Autowired
	@Qualifier("accountImgDir")
	UploadFile baseUploadFile;
	@Autowired
	private IAccountDAO accountDAO;
	private String validateCodeFP = "";
	private String emailValidate = "";
	private String validateCodeRegister = "";
	private String emailValidateRegister = "";
	
	@RequestMapping(value = {"/register"},method = RequestMethod.GET)
	public String Register(HttpServletRequest request) {
		request.setAttribute("user",new Account());
		return "user/login/register";
	}
	
	@RequestMapping(value = {"/register"},method = RequestMethod.POST)
	public String CreateAccount(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName,
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("avatar") MultipartFile avatar,
			HttpSession session,HttpServletRequest request) {
		boolean isAdded = false;
		Account account = new Account();
		account.setFirstName(firstName);
		account.setLastName(lastName);
		account.setEmail(email);
		account.setPassword(password);
		account.setPhoneNumber(phoneNumber);
		if(!avatar.isEmpty()) {
			try {
				account.setAvatar(baseUploadFile.uploadImage(avatar));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println(e.getMessage());
			}

		}

		if(accountDAO.checkAccountRegister(account)) {
			if(accountDAO.createAccount(account)) {
				emailValidateRegister = account.getEmail();
				isAdded = true;
			}
		}
		try {
		if(isAdded) {
			request.setAttribute("status","Đăng ký tài khoản thành công");
			session.setAttribute("userInfo", account);
			validateCodeRegister = mailer.send(emailValidateRegister);
			return "redirect:/register/validateCode.htm";
		}else {
			request.setAttribute("status","Đăng ký tài khoản không thành công");
			return "user/login/register";
		}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return "user/login/register";
		}
	}
	
	@RequestMapping(value = {"/register/validateCode"}, method = RequestMethod.GET)
	public String registerValidateForm() {
		return "user/login/registerValidate";
	}
	
	@RequestMapping(value = {"/register/validateCode"}, method = RequestMethod.POST)
	public String registerValidate(@RequestParam("validateCodeRegister") String validateCode,
			HttpServletRequest request) {
		if(validateCodeRegister.equals(validateCode)) {
			return "redirect:/index.htm";
		}else {
			request.setAttribute("wrongCode", "Mã sai vui lòng nhập lại");
		}
		return "user/login/registerValidate";
	}
	
	@RequestMapping(value = {"/login"},method = RequestMethod.GET)
	public String Login(HttpServletRequest request) {
		request.setAttribute("user", new Account());
		return "user/login/login";
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
			session.setAttribute("userInfo", loggedInUser);
			//Thêm role vào khi đăng nhập 
			Cookie cookie_role_name = new Cookie("userRole", BCrypt.hashpw(loggedInUser.getRole().getRoleId(), BCrypt.gensalt(10)));
			response.addCookie(cookie_role_name);
			if(checkRemember!= null) {
				Cookie cookie = new Cookie("userEmail", loggedInUser.getEmail());
				Cookie cookie_role = new Cookie("userRole", BCrypt.hashpw(loggedInUser.getRole().getRoleId(), BCrypt.gensalt(10)));
				cookie.setMaxAge(24*60*60);
				cookie_role.setMaxAge(24*3600);
				response.addCookie(cookie);
				response.addCookie(cookie_role);
			}else {
				Cookie cookie = new Cookie("userEmail", loggedInUser.getEmail());
				Cookie cookie_role = new Cookie("userRole", BCrypt.hashpw(loggedInUser.getRole().getRoleId(), BCrypt.gensalt(10)));
				cookie.setMaxAge(-1);
				cookie_role.setMaxAge(-1);
				response.addCookie(cookie);
			}
			request.setAttribute("status","Đăng nhập tài khoản thành công");
			return "redirect:/index.htm";
		}else {
			request.setAttribute("message","Email hoặc password của bạn không chính xác. Vui lòng kiểm tra lại.");
//			return "redirect:"+request.getHeader("Referer");
			return "user/login/login";
		}
	}
	
	@RequestMapping(value = {"/logout"},method = RequestMethod.GET)
	public String Logout(HttpServletRequest request,HttpSession session, HttpServletResponse response,
			@CookieValue(value = "userEmail",defaultValue = "",required = false) String userEmail) {
		Cookie cookie = new Cookie("userEmail",userEmail);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		 // Xóa thông tin người dùng khỏi phiên
		Cookie cookie_role = new Cookie("userRole",null);
		cookie_role.setMaxAge(0);
		response.addCookie(cookie_role);
		// Xóa user role ra khỏi phiên
	    session.removeAttribute("userInfo");
	    session.invalidate(); // Hủy phiên đăng nhập hiện tại
		return "redirect:"+request.getHeader("Referer");
	}

	@RequestMapping(value="/forgotPassword",method = RequestMethod.GET)
	public String ForgotPassword(HttpServletRequest request) {
		return "user/forgotPass/username";
	}
	
	@RequestMapping(value = "/forgotPassword",method = RequestMethod.POST)
	public String Send(ModelMap model,@RequestParam("email") String email, 
			HttpServletResponse response,HttpServletRequest request,
			HttpSession session) {

		try {
			Account account = accountDAO.getAccountByEmail(email);
			if(account!=null) {
				validateCodeFP =  mailer.send(email);
				emailValidate = email;
				
				model.addAttribute("messageEmail","Gửi mail thành công");
				return "redirect:/forgotPassword/validateCode.htm";
			}else {
				request.setAttribute("message", "Email chưa được đăng ký tài khoản! Vui lòng kiểm tra lại");
				return "user/forgotPass/username";
			}
		}catch (Exception e) {
			model.addAttribute("messageEmail","Gửi mail thất bại");
			return "user/forgotPass/username";
		}
	}
	
	@RequestMapping(value = "/forgotPassword/validateCode",method = RequestMethod.GET)
	public String validateCodeForm() {
		return "user/forgotPass/validateCode";
	}


	@RequestMapping(value = "/forgotPassword/validateCode",method = RequestMethod.POST)
	public String ValidateCode(HttpServletRequest request,@RequestParam("validateCode") String validateCode) {
		if(validateCode.equals(validateCodeFP)) {
			return "redirect:/forgotPassword/newPassword.htm";
		}else {
			request.setAttribute("wrongCode", "Mã sai vui lòng nhập lại");
		}
		return "user/forgotPass/validateCode";
	}
	
	@RequestMapping(value = "/forgotPassword/newPassword",method = RequestMethod.GET)
	public String NewPasswordForm(HttpServletResponse response) {
		Cookie cookie = new Cookie("userEmail", emailValidate);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		return "user/forgotPass/newPassword";
	}
	
	
	@RequestMapping(value = "/forgotPassword/newPassword",method = RequestMethod.POST)
	public String NewPassword(HttpServletRequest request,
			@RequestParam("confirmPass") String confirmPass,
			@RequestParam("newPass") String newPass,
			HttpServletResponse response,
			HttpSession session){

		if(newPass.equals(confirmPass)) {
			accountDAO.forgotPassword(emailValidate, newPass);
			Account account = accountDAO.getAccountByEmail(emailValidate);
				
			session.setAttribute("userInfo", account);
			return "redirect:/index.htm";
		}else {
			
			request.setAttribute("message","New Password và confirm password không giống nhau vui lòng nhập lại");
		}
		return "user/forgotPass/newPassword";
	}
}
