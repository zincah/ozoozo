package ozo.spring.house.admin.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ozo.spring.house.admin.service.AdminProductManageService;
import ozo.spring.house.admin.service.AdminUserManageService;
import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.common.MakeDate;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminProductManageService productService; // admin ��ǰ ���� service
	
	@Autowired
	AdminUserManageService userService; // admin user,seller ���� service
	

	@RequestMapping(value = "/index.admin") // admin ù ������
	public String adminIndex(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {

			int noticeCount = userService.noticeCount(); // �������� ����
			int sellerCount = userService.sellerCount(); // �Ǹ��� ����
			int waitcount = productService.registrationWait(); // ��ǰ��ϴ�� ����
			int holdcount = productService.registrationHold(); // ��ǰ��Ϻ��� ����
			List<Integer> regiList = new ArrayList<Integer>();
			regiList.add(waitcount);
			regiList.add(holdcount);
			
			List<UserVO> floatList = userService.floatingPopulation(); // �����α�list
			List<String> dateList = new ArrayList<String>(); // �����α� -> date
			List<Integer> countList = new ArrayList<Integer>(); // �����α� -> count
			
			List<Map<String, Integer>> bestOfIndexList = userService.bestProductOfIndex(); // best ��ǰ �Ǹŷ�
			List<Integer> labelList = new ArrayList<Integer>(); // best ��ǰ post_id
			List<Integer> totalList = new ArrayList<Integer>(); // best ��ǰ �Ǹŷ�
			

			// �����α� for��
			for(int i=0; i<floatList.size(); i++) {
				UserVO vo = floatList.get(i);
				dateList.add("\""+String.valueOf(vo.getLogin_date())+"\"");
				countList.add(vo.getCount());
			}

			// best ��ǰ for��
			for(int j=0; j<bestOfIndexList.size(); j++) {
				Map<String, Integer> bestOfIndex = bestOfIndexList.get(j);
				labelList.add(bestOfIndex.get("od_postid"));
				totalList.add(Integer.parseInt(String.valueOf(bestOfIndex.get("total")))); // long �� integer�� �ٲ�
			}
			
			model.addAttribute("notice", noticeCount);
			model.addAttribute("seller", sellerCount);
			model.addAttribute("labelList", labelList);
			model.addAttribute("totalList", totalList);
			model.addAttribute("dateList", dateList);
			model.addAttribute("countList", countList);
			model.addAttribute("regiList", regiList);

			return "index";
		}else {
			return "adminLogin_dj";
		}

	}

	@RequestMapping(value = "/information.admin") // admin -> seller �������� ������
	public String informationView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "information_zinc";
		}else {
			return "adminLogin_dj";
		}

	}

	@RequestMapping(value = "/companyManagement.admin") // admin ��ü���� ������
	public String companyManageView(HttpServletRequest request, Model model, SellerVO vo) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {
			
			List<SellerVO> sellerList = userService.selectSellerList(vo); // ���� ��ϵ� �Ǹ��� list
			model.addAttribute("sellerList", sellerList);
			
			return "companyManagement_dh";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/productManagementList.admin") // admin ��ǰ��ϰ��� ������
	public String productManageView(HttpServletRequest request, Model model, Criteria cri, AdminProductVO pvo) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			
			pvo.setCri(cri); // ����¡(new Criteria())
			List<AdminProductVO> postList = productService.getProductList(pvo); // ����¡ ó���� ��ǰ ����Ʈ(10��)
			List<AdminProductVO> couponList = productService.selectCouponList(); // ���� ����Ʈ
			int total = productService.searchListCount(pvo); // �� ��ǰ����Ʈ count
			
			model.addAttribute("postList", postList);
			model.addAttribute("pageMaker", cri);
			model.addAttribute("totalcount", total);
			model.addAttribute("couponList", couponList);

			return "productManagementList_zinc";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/reviewManagement.admin") // admin ����Ű� ���� ������
	public String reviewManageView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "reviewManagement_02";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/salesStatus.admin") // ������Ȳ(���庰 ����, best30����, deal����)
	public String saleStatusView(HttpServletRequest request, AdminProductVO vo, Model model) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {

			// ��¥ ����
			vo.setStartdate(java.sql.Date.valueOf("2018-01-01"));
			MakeDate makeDate = new MakeDate(); // ��¥ ���� Ŭ����
	        String enddate = makeDate.makeToday();
			vo.setEnddate(java.sql.Date.valueOf(enddate)); 
			
			List<AdminProductVO> sellerSaleList = productService.sellerSale(vo); // ���庰 ���� ����Ʈ
			
			for(int i=0; i<sellerSaleList.size(); i++) { // ������ ó���� �귣�� ����(5%)
				AdminProductVO ch = sellerSaleList.get(i);
				int fee = 5;
				int realPayment = (int)Math.round(ch.getPayment()*(1-fee/100.0));
				ch.setFee(fee);
				ch.setRealPayment(realPayment);
			}
			
			model.addAttribute("sellerSaleList", sellerSaleList);
			
			return "salesStatus_dh";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/calculateManagement.admin") // ������ ���곻�� ������ -> �Ⱦ�
	public String calculateManageView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "calculateManagement_dj";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/clientInformation.admin") // // admin -> user �������� ������
	public String clientInformationView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "clientInformation_zinc";
		}else {
			return "adminLogin_dj";
		}
	}
	

	@RequestMapping(value = "/memberManagement.admin") // ȸ�� ���� ������
	public String memberManagementView(HttpServletRequest request, UserVO vo, Model model, Criteria cri) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {

			vo.setCri(cri); // ����¡ ����(new Criteria())
			List<UserVO> userList = userService.getUserList(vo); // ȸ�� ����Ʈ
			int total = userService.getUserListCount(vo); // �� ȸ�� ��
			
			model.addAttribute("userList", userList);
			model.addAttribute("totalcount", total);
			model.addAttribute("pageMaker", cri);
			
			return "memberManagement_dh";
		}else {
			return "adminLogin_dj";
		}
	}




	

	

}
