package ecofarm.controller.user;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ecofarm.entity.Province;
import ecofarm.utility.HibernateUtil;


@Controller
public class HomeController {


	@RequestMapping(value={"/","/index"},method=RequestMethod.GET)
	public ModelAndView Index() {
		ModelAndView mv = new ModelAndView("user/index");
//		List<Product> list = productService.listAllProducts();
//		mv.addObject("products",list);
//		mv.addObject("categories", categoryService.listAllCategories());
		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			if(sessionFactory!=null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction ts = session.beginTransaction();
					Province province = new Province();
					province.setName("Jerry");
					session.save(province);
					ts.commit();
				}finally {
					session.close();
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return mv;
	}
}
