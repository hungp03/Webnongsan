package ecofarm.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ecofarm.DAO.IAccountDAO.EnumRole;
import ecofarm.DAOImpl.AccountDAOImpl;
import ecofarm.DAOImpl.PaginateDAOImpl;
import ecofarm.entity.Account;
import ecofarm.utility.Paginate;

@Controller
@RequestMapping("admin/user")
public class AdminControllerUser {
	private final int USER_PER_PAGE = 10;
	private AccountDAOImpl accountDAO = new AccountDAOImpl();
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

}
