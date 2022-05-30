package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.dao.U_DAO.cart_Allload;
import ozo.spring.house.user.service.MailSendService;
import ozo.spring.house.user.service.U_MyPageService;
import ozo.spring.house.user.service.U_MainService;
import ozo.spring.house.user.service.U_Service;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;
@Controller
public class U_PublicController {
	
	@Autowired
	U_Service userservice;
	
	@Autowired
	U_MainService userMainService;
	
	@Autowired
	U_MyPageService mypageservice;
	
	@Autowired
	MailSendService mailSendService;
	
	
	//send Emails
	private String key; // �씠硫붿씪濡� 蹂대궡吏� �궃�닔
	
	@ResponseBody
	@RequestMapping(value = "/sendEmail.com", method=RequestMethod.POST)
	public String sendEmail(@RequestBody Map<String, String> map) {
		System.out.println(map.get("email"));
		String email = map.get("email");
		key = mailSendService.sendAuthEmail(email);
		System.out.println("�씠硫붿씪 �씤利� 肄붾뱶 : " + key);
		return key;
	}
	
	@ResponseBody
	@RequestMapping(value = "/email_code_check.com", method=RequestMethod.POST)
	public Boolean checkCode(@RequestBody String Code) {
		String code = Code.replace("\"", "");
		//System.out.println("�궗�슜�옄媛� �엯�젰�븳 Code : "+code + "\n�썝�옒 肄붾뱶 : " + key);
		if(key.equals(code)) {
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping(value = "/error404.com")
	public String error404() {
		return "error/404Error";
	}
	
	@RequestMapping(value = "/error500.com")
	public String error500() {
		return "error/500Error";
	}
	//header load
	@ResponseBody
	@RequestMapping(value="/header_load.com", method= {RequestMethod.GET, RequestMethod.POST})
	public int[] get_cart_ea(HttpSession session) {
		if(session.getAttribute("UserMail")!=null) {
			cart_Allload cart_cls;
			CartVO cvo =new CartVO();
			cvo.setCart_user((Integer)session.getAttribute("User_Num"));
			cart_cls = userservice.get_cart_class(cvo);
			List<CartVO> cart_li = cart_cls.getCart_li();
			
			UserScrapVO vo = new UserScrapVO();
			vo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			List<UserScrapVO> scrap_li = mypageservice.us_list(vo);
			int[] arr = {cart_li.size(), scrap_li.size()};
			return arr;
		}else {
			return null;
		}
	}
	
	@RequestMapping(value = "/mainRanking.com")
	public String user_main(@RequestBody Map<String, String> rank, UserProductVO vo, UserScrapVO svo, Model model, HttpSession session) {
		
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();

		vo.setCheckit(false);
		
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = mypageservice.userScrapList(svo);
		}
		
		vo.setOrderKind(rank.get("ranking"));
		List<UserProductVO> productList = userMainService.mainProductList(vo);

		
		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //占쎈꺖占쎈땾占쎌젎 占쎈맙占쎈땾
			
			pro.setSale_price(decFormat.format(sale_price));
			System.out.println(pro.getPost_id());
			
			for(int j=0; j<scrap.size(); j++) {
				UserScrapVO sc = scrap.get(j);
				if(pro.getPost_id() == sc.getSc_postid()) {
					pro.setCheckit(true);
				}
			}
		}
		
		
		model.addAttribute("productList", productList); 
		//model.addAttribute("pagecount", pagecount);

		return "oZo_MainAssist";
	}
	
	// 남는 거
	@RequestMapping(value = "/shopApply.com")
	public String user_shopApply(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			return "ShopApply";
		}else {
			return "redirect:login.com";
		}
	}
	
	@RequestMapping(value = "/passwordReset.com")
	public String user_passwordReset() {
		return "passwordReset";
	}
	
	@RequestMapping(value = "/shoptest.com")
	public String shop() {
		return "shop";
	}
}
