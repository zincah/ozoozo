package ozo.spring.house.seller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.seller.service.SellerService;
import ozo.spring.house.seller.vo.SellerVO;

@Controller
public class LoginController {

	@Autowired
	SellerService sellerService;
	
	// login
	@RequestMapping(value = "/login.seller", method=RequestMethod.GET)
	public String loginView(HttpSession session) {
		if(session.getAttribute("sellercode")!=null) {
			return "index";
		}else {
			return "seller-Login";
		}
	}

	@RequestMapping(value="/login.seller", method=RequestMethod.POST)
	public String login(SellerVO vo, Model model, HttpSession session) {

		// log ó��
		System.out.println("login controller");
		SellerVO seller = sellerService.checkSeller(vo);
		
		if(seller != null) {
			session.setAttribute("sellerid", seller.getSeller_id());
			model.addAttribute("sellerid", vo.getSeller_id());
			model.addAttribute("seller", vo); // member ����
			return "index";
		}else {
			String msg = "�Է��Ͻ� ������ �߸� �Ǿ����ϴ�.";
			model.addAttribute("msg", msg);
			return "seller-Login";
		}
	}
	
	// logout
	@RequestMapping(value = "/logout.seller", method=RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:login.seller";
	}

}
