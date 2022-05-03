package ozo.spring.house.seller.controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.service.SellerService;
import ozo.spring.house.seller.vo.ProductVO;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class LoginController {

	@Autowired
	SellerService sellerService;
	@Autowired
	ProductService productService;
	
	// login
	@RequestMapping(value = "/login.seller", method=RequestMethod.GET)
	public String loginView(HttpSession session) {
		if(session.getAttribute("seller")!=null) {
			return "index";
		}else {
			return "seller-login";
		}
	}

	@RequestMapping(value="/login.seller", method=RequestMethod.POST)
	public String login(UserVO vo, Model model, HttpSession session) {

		// log ó��
		System.out.println("--> login controller");
		SellerVO seller = sellerService.checkSeller(vo);
		
		if(seller != null) {
			session.setAttribute("seller", seller); // �Ǹ��� ���̵�
			session.setAttribute("entrydate", new SimpleDateFormat("yyyy-MM-dd").format(seller.getEntry_date())); // �Ǹ��� ���̵�
			session.setAttribute("seller_id", seller.getSeller_id());
			
			return "index";
		}else {
			String msg = "�Է��Ͻ� ������ �߸� �Ǿ����ϴ�.";
			model.addAttribute("msg", msg);
			return "seller-login";
		}
	}
	
	// logout
	@RequestMapping(value = "/logout.seller", method=RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:login.seller";
	}

}
