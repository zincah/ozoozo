package ozo.spring.house.admin.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
public class A_Controller {
	
	@Autowired
	AdminProductManageService productService; // admin ��ǰ ���� service
	
	@Autowired
	AdminUserManageService userService; // admin user,seller ���� service
	

	@RequestMapping(value = "/index.admin") // admin ù ������
	public String adminIndex(HttpServletRequest request, Model model) {
		System.err.println("[Log] --- A 	Controller >>>>> adminIndex 	Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {

			int noticeCount = userService.noticeCount(); // �������� ����
			int sellerCount = userService.sellerCount(); // �Ǹ��� ����
			int waitcount = productService.registrationWait(); // ��ǰ��ϴ�� ����
			int holdcount = productService.registrationHold(); // ��ǰ��Ϻ��� ����
			int userCount = userService.userCount(); // �Ϲ�ȸ�� ��
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
			model.addAttribute("user", userCount);
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
		System.err.println("[Log] --- A 	Controller >>>>> informationView 	Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "information_zinc";
		}else {
			return "adminLogin_dj";
		}

	}

	@RequestMapping(value = "/companyManagement.admin") // admin ��ü���� ������
	public String companyManageView(HttpServletRequest request, Model model, SellerVO vo) {
		System.err.println("[Log] --- A 	Controller >>>>> companyManageView 	Method");
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
		System.err.println("[Log] --- A 	Controller >>>>> productManageView 	Method");
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
		System.err.println("[Log] --- A 	Controller >>>>> reviewManageView 	Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "reviewManagement_02";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/salesStatus.admin") // ������Ȳ(���庰 ����, best30����, deal����)
	public String saleStatusView(HttpServletRequest request, AdminProductVO vo, Model model) {
		System.err.println("[Log] --- A 	Controller >>>>> saleStatusView 	Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {

			// ��¥ ����
			vo.setStartdate(java.sql.Date.valueOf("2018-01-01"));
			MakeDate makeDate = new MakeDate(); // ��¥ ���� Ŭ����
	        String enddate = makeDate.makeToday();
			vo.setEnddate(java.sql.Date.valueOf(enddate)); 
			
			String fday = makeDate.findFirstDay(2022, 5);
			String lday = makeDate.findLastDay(2022, 5);
			vo.setFirstday(java.sql.Date.valueOf(fday));
			vo.setLastday(java.sql.Date.valueOf(lday));
			
			// �Ѵ� ���� ��¥ �����ϱ�(5�� ���� ��)
			List<String> monthList = makeDate.makeWholeMonth(2022, 5);
			
			List<AdminProductVO> sellerSaleList = productService.sellerSale(vo); // ���庰 ���� ����Ʈ
			List<List<Map<String,String>>> dailyStoreSaleList = productService.dailyStoreSales(vo); // �Ϻ� ���� ����Ʈ
			System.out.println(dailyStoreSaleList);
			
			for(int i=0; i<sellerSaleList.size(); i++) { // ������ ó���� �귣�� ����(5%)
				AdminProductVO ch = sellerSaleList.get(i);
				int fee = 5;
				int realPayment = (int)Math.round(ch.getPayment()*(1-fee/100.0));
				ch.setFee(fee);
				ch.setRealPayment(realPayment);
			}
			
			String json = makeJson(dailyStoreSaleList, monthList);
			
			model.addAttribute("json", json);
			model.addAttribute("sellerSaleList", sellerSaleList);
			//model.addAttribute("dailyStoreSaleList", dailyStoreSaleList);
			
			return "salesStatus_dh";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/calculateManagement.admin") // ������ ���곻�� ������ -> �Ⱦ�
	public String calculateManageView(HttpServletRequest request) {
		System.err.println("[Log] --- A 	Controller >>>>> calculateManageView 	Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "calculateManagement_dj";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/clientInformation.admin") // // admin -> user �������� ������
	public String clientInformationView(HttpServletRequest request) {
		System.err.println("[Log] --- A 	Controller >>>>> clientInformationView 	Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "clientInformation_zinc";
		}else {
			return "adminLogin_dj";
		}
	}
	

	@RequestMapping(value = "/memberManagement.admin") // ȸ�� ���� ������
	public String memberManagementView(HttpServletRequest request, UserVO vo, Model model, Criteria cri) {
		System.err.println("[Log] --- A 	Controller >>>>> memberManagementView 	Method");
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
	

	private String makeJson(List<List<Map<String,String>>> dailyStoreSaleList, List<String> monthList) {
		System.err.println("[Log] --- A 	Controller >>>>> makeJson 	Method");
		Map<String, Object> wholeMap = new HashMap<String, Object>();
		wholeMap.put("labels", monthList);
		
		int size = dailyStoreSaleList.size();
		int i = 0;
		
		
		List<Map<String, Object>> datasetList = new ArrayList<Map<String,Object>>();
		
		while(i<size) {
			Map<String, Object> dataset = new HashMap<String, Object>();
			
			List<Map<String,String>> list = dailyStoreSaleList.get(i);
			
			// seller id ��������
			String seller = String.valueOf(dailyStoreSaleList.get(i).get(i).get("seller_id"));
			
			// data ���ϴ� for��
			List<Integer> data = new ArrayList<Integer>();
			for(int j=0; j<monthList.size(); j++) {
				
				int payment = 0;
				
				for(int k=0; k<list.size(); k++) {
					Map<String, String> map = list.get(k);
					if(monthList.get(j).equals(map.get("odate"))) {
						payment = Integer.parseInt(String.valueOf(map.get("payment")));
						data.add(payment);
						continue;
					}
				}
				
				if(payment != 0) {
					
				}else {
					data.add(payment);
				}

				
			}
			
			dataset.put("data", data);
			dataset.put("label", seller);
			dataset.put("borderColor", "#f77");
			dataset.put("fill", false);

			datasetList.add(dataset);
			i++;
		}

		
		wholeMap.put("datasets", datasetList);

		JSONObject jsonMap = new JSONObject();
		jsonMap.put("data", wholeMap);
		String json = jsonMap.toJSONString();
		
		System.out.println(json);

		return json;
	}




	

	

}