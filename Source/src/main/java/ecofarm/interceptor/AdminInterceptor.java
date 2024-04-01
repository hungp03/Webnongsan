package ecofarm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ecofarm.DAO.IAccountDAO.EnumRoleID;
import ecofarm.entity.Account;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Account user = (Account) session.getAttribute("user");
		if (user != null) {
			System.out.print(user.getRole().getRoleId());
		}
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login.htm"); // Không có user thì cho vào đăng nhập
			return false;
		} else if (user.getRole().getRoleId().equals(EnumRoleID.ADMIN.toString())) {
			return true;
		}
		session.removeAttribute("user");
		response.sendRedirect(request.getContextPath() + "/");
		return false;
	}

}