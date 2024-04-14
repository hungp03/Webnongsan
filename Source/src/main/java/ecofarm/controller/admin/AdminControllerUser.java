package ecofarm.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ecofarm.DAO.IAccountDAO;
import ecofarm.DAO.IAccountDAO.EnumRole;
import ecofarm.DAOImpl.PaginateDAOImpl;
import ecofarm.bean.UploadFile;
import ecofarm.bean.UserBean;
import ecofarm.entity.Account;
import ecofarm.entity.Role;
import ecofarm.utility.Paginate;

@Controller
@RequestMapping("admin/user")
public class AdminControllerUser {
	private final int USER_PER_PAGE = 10;
	@Autowired
	private IAccountDAO accountDAO;
	private PaginateDAOImpl paginateDAO = new PaginateDAOImpl();

	@RequestMapping()
	public String index() {
		return "redirect:get-employee.htm";
	}

	@RequestMapping("get-employee")
	public String getListEmployee(ModelMap model, @RequestParam(required = false, value = "search") String search,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage) {
		List<Account> accounts = accountDAO.listAccountWithRole(EnumRole.EMPLOYEE, search);

		int totalFeedbacks = accounts.size();
		Paginate paginate = paginateDAO.getInfoPaginate(totalFeedbacks, USER_PER_PAGE, crrPage);
		List<Account> accs = accounts.subList(paginate.getStart(), paginate.getEnd());
		model.addAttribute("paginate", paginate);
		model.addAttribute("accounts", accs);
		model.addAttribute("source", "get-employee.htm");
		return "admin/user-list";
	}

	@RequestMapping("get-guest")
	public String getListGuest(ModelMap model,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage,
		 @RequestParam(required = false, value = "search") String search) {
		List<Account> accounts = accountDAO.listAccountWithRole(EnumRole.GUEST, search);

		int totalFeedbacks = accounts.size();
		Paginate paginate = paginateDAO.getInfoPaginate(totalFeedbacks, USER_PER_PAGE, crrPage);
		List<Account> accs = accounts.subList(paginate.getStart(), paginate.getEnd());
		model.addAttribute("paginate", paginate);
		model.addAttribute("accounts", accs);
		model.addAttribute("source", "get-guest.htm");
		return "admin/user-list";
	}

	@RequestMapping("changestatus")
	public String modifyStatus(@RequestParam("id") int id, RedirectAttributes re) {
		Account acc = accountDAO.getAccountByID(id);
		String role = acc.getRole().getRoleId().toLowerCase();
		if (acc != null) {
			// System.out.println(acc.getStatus());
			if (acc.getStatus() == 1)
				acc.setStatus(0);
			else if (acc.getStatus() == 0)
				acc.setStatus(1);
			boolean completed = accountDAO.updateAccount(acc);
			if (completed) {
				re.addFlashAttribute("mess", "Sửa trạng thái thành công");
			} else {
				re.addFlashAttribute("mess", "Sửa trạng thái thất bại");
			}
		}
		return String.format("redirect:/admin/user/get-%s.htm", role);
	}
	
	@RequestMapping(value = {"create-guest", "create-employee"}, method = RequestMethod.GET)
	public String getCreateUser(HttpServletRequest request,ModelMap model) {
		UserBean acc = new UserBean();
		String uri = request.getRequestURI();
		String role = uri.contains("guest") ? "Guest" : uri.contains("employee") ? "Employee" : "";
		model.addAttribute("role", role);
		model.addAttribute("userbean", acc);
		return "admin/register-user";
	}
	
	@Autowired
	@Qualifier("accountImgDir")
	UploadFile accountImgUpload;
	
	@RequestMapping(value = {"create-guest", "create-employee"}, method = RequestMethod.POST)
	public String createEmployee(HttpServletRequest request, @Validated @ModelAttribute("userbean") UserBean user,
			BindingResult errors, RedirectAttributes reAttributes, ModelMap model) {
		String uri = request.getRequestURI();
	    String _role = uri.contains("create-guest") ? "Guest" : uri.contains("create-employee") ? "Employee" : "";
		Role role = _role.equals("Employee") ? accountDAO.getRoleByEnum(EnumRole.EMPLOYEE) : accountDAO.getRoleByEnum(EnumRole.GUEST);
		Account account = null;
		String photoName = null;
		if (!errors.hasErrors()) {
			if (!user.getAvatar().isEmpty()) {
				photoName = accountImgUpload.uploadImage(user.getAvatar());
				System.out.println("Account photo: " + photoName);
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			account = new Account(role, user.getLastName(), user.getFirstName(), user.getEmail(), user.getPhoneNumber(),
					photoName, user.getPassword());
			if (!user.getAvatarDir().isEmpty()) {
				account.setAvatar(user.getAvatarDir());
			}

			if (accountDAO.getAccountByEmail(user.getEmail())!=null) {
				model.addAttribute("userbean", user);
				model.addAttribute("role", _role);
				model.addAttribute("mess", "Thông tin đã tồn tại trên hệ thống");
				return "admin/register-user";
			}

			if (accountDAO.createAccount(account)) {
				reAttributes.addFlashAttribute("mess", "Tạo tài khoản thành công");
				return String.format("redirect:/admin/user/get-%s.htm", _role.toLowerCase());
			}
		}
		model.addAttribute("userbean", user);
		model.addAttribute("role", _role);
		return "admin/register-user";
	}
	
}
