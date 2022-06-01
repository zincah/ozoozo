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
	AdminProductManageService productService; // admin 상품 관리 service
	
	@Autowired
	AdminUserManageService userService; // admin user,seller 관리 service
	

	@RequestMapping(value = "/index.admin") // admin 첫 페이지
	public String adminIndex(HttpServletRequest request, Model model) {
		System.err.println("[Log] --- A 	Controller >>>>> adminIndex 	Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {

			int noticeCount = userService.noticeCount(); // 공지사항 개수
			int sellerCount = userService.sellerCount(); // 판매점 개수
			int waitcount = productService.registrationWait(); // 상품등록대기 개수
			int holdcount = productService.registrationHold(); // 상품등록보류 개수
			int userCount = userService.userCount(); // 일반회원 수
			List<Integer> regiList = new ArrayList<Integer>();
			regiList.add(waitcount);
			regiList.add(holdcount);
			
			List<UserVO> floatList = userService.floatingPopulation(); // 유동인구list
			List<String> dateList = new ArrayList<String>(); // 유동인구 -> date
			List<Integer> countList = new ArrayList<Integer>(); // 유동인구 -> count
			
			List<Map<String, Integer>> bestOfIndexList = userService.bestProductOfIndex(); // best 상품 판매량
			List<Integer> labelList = new ArrayList<Integer>(); // best 상품 post_id
			List<Integer> totalList = new ArrayList<Integer>(); // best 상품 판매량
			

			// 유입인구 for문
			for(int i=0; i<floatList.size(); i++) {
				UserVO vo = floatList.get(i);
				dateList.add("\""+String.valueOf(vo.getLogin_date())+"\"");
				countList.add(vo.getCount());
			}

			// best 상품 for문
			for(int j=0; j<bestOfIndexList.size(); j++) {
				Map<String, Integer> bestOfIndex = bestOfIndexList.get(j);
				labelList.add(bestOfIndex.get("od_postid"));
				totalList.add(Integer.parseInt(String.valueOf(bestOfIndex.get("total")))); // long 을 integer로 바꿈
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

	@RequestMapping(value = "/information.admin") // admin -> seller 공지사항 페이지
	public String informationView(HttpServletRequest request) {
		System.err.println("[Log] --- A 	Controller >>>>> informationView 	Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "information_zinc";
		}else {
			return "adminLogin_dj";
		}

	}

	@RequestMapping(value = "/companyManagement.admin") // admin 업체관리 페이지
	public String companyManageView(HttpServletRequest request, Model model, SellerVO vo) {
		System.err.println("[Log] --- A 	Controller >>>>> companyManageView 	Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {
			
			List<SellerVO> sellerList = userService.selectSellerList(vo); // 현재 등록된 판매점 list
			model.addAttribute("sellerList", sellerList);
			
			return "companyManagement_dh";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/productManagementList.admin") // admin 상품등록관리 페이지
	public String productManageView(HttpServletRequest request, Model model, Criteria cri, AdminProductVO pvo) {
		System.err.println("[Log] --- A 	Controller >>>>> productManageView 	Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			
			pvo.setCri(cri); // 페이징(new Criteria())
			List<AdminProductVO> postList = productService.getProductList(pvo); // 페이징 처리된 상품 리스트(10개)
			List<AdminProductVO> couponList = productService.selectCouponList(); // 쿠폰 리스트
			int total = productService.searchListCount(pvo); // 총 상품리스트 count
			
			model.addAttribute("postList", postList);
			model.addAttribute("pageMaker", cri);
			model.addAttribute("totalcount", total);
			model.addAttribute("couponList", couponList);

			return "productManagementList_zinc";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/reviewManagement.admin") // admin 리뷰신고 관리 페이지
	public String reviewManageView(HttpServletRequest request) {
		System.err.println("[Log] --- A 	Controller >>>>> reviewManageView 	Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "reviewManagement_02";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/salesStatus.admin") // 매출현황(매장별 매출, best30매출, deal매출)
	public String saleStatusView(HttpServletRequest request, AdminProductVO vo, Model model) {
		System.err.println("[Log] --- A 	Controller >>>>> saleStatusView 	Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {

			// 날짜 세팅
			vo.setStartdate(java.sql.Date.valueOf("2018-01-01"));
			MakeDate makeDate = new MakeDate(); // 날짜 포맷 클래스
	        String enddate = makeDate.makeToday();
			vo.setEnddate(java.sql.Date.valueOf(enddate)); 
			
			String fday = makeDate.findFirstDay(2022, 5);
			String lday = makeDate.findLastDay(2022, 5);
			vo.setFirstday(java.sql.Date.valueOf(fday));
			vo.setLastday(java.sql.Date.valueOf(lday));
			
			// 한달 단위 날짜 세팅하기(5월 세팅 중)
			List<String> monthList = makeDate.makeWholeMonth(2022, 5);
			
			List<AdminProductVO> sellerSaleList = productService.sellerSale(vo); // 매장별 매출 리스트
			List<List<Map<String,String>>> dailyStoreSaleList = productService.dailyStoreSales(vo); // 일별 매출 리스트
			System.out.println(dailyStoreSaleList);
			
			for(int i=0; i<sellerSaleList.size(); i++) { // 수수료 처리한 브랜드 수익(5%)
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

	@RequestMapping(value = "/calculateManagement.admin") // 관리자 정산내역 페이지 -> 안씀
	public String calculateManageView(HttpServletRequest request) {
		System.err.println("[Log] --- A 	Controller >>>>> calculateManageView 	Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "calculateManagement_dj";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/clientInformation.admin") // // admin -> user 공지사항 페이지
	public String clientInformationView(HttpServletRequest request) {
		System.err.println("[Log] --- A 	Controller >>>>> clientInformationView 	Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "clientInformation_zinc";
		}else {
			return "adminLogin_dj";
		}
	}
	

	@RequestMapping(value = "/memberManagement.admin") // 회원 관리 페이지
	public String memberManagementView(HttpServletRequest request, UserVO vo, Model model, Criteria cri) {
		System.err.println("[Log] --- A 	Controller >>>>> memberManagementView 	Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {

			vo.setCri(cri); // 페이징 설정(new Criteria())
			List<UserVO> userList = userService.getUserList(vo); // 회원 리스트
			int total = userService.getUserListCount(vo); // 총 회원 수
			
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
			
			// seller id 가져오기
			String seller = String.valueOf(dailyStoreSaleList.get(i).get(i).get("seller_id"));
			
			// data 구하는 for문
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
