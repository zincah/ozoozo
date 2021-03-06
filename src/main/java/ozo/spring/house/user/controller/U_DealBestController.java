package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.service.U_MainService;
import ozo.spring.house.user.service.U_MyPageService;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class U_DealBestController {

	@Autowired
	U_MainService userMainService;

	@Autowired
	U_MyPageService mypageservice;

	@RequestMapping(value = "/todaydeal.com")
	public String main_todayDeal(Model model,HttpServletRequest request,UserScrapVO svo ){
		System.err.println("[Log] --- DealBest Controller >>>>> main_todayDeal Method");
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		HttpSession session = request.getSession();
		List<UserProductVO> todayDealList = userMainService.todayDealList();
		
		
		// timer
		List<Map<String, String>> list = userMainService.getDealEndTimeAtDealPage();
		List<Map<String, String>> dealtimelist = new ArrayList<Map<String, String>>();
		for(int i=0; i<list.size(); i++) {
			Map<String, String> dealtime = list.get(i);
			String t = "\""+String.valueOf(dealtime.get("deal_endtime"))+"\"";
			String su = t.substring(0, 20) + "\"";
			dealtime.put("deal_endtime", su);
			dealtimelist.add(dealtime);
		}
		
		String jsonArray = JSONArray.toJSONString(dealtimelist);
		model.addAttribute("dealtimelist", jsonArray); // timer ???????????? ????????????
		
		if((Integer)session.getAttribute("User_Num")!=null) {
		svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
		scrap = mypageservice.userScrapList(svo);
		
		
		for(int i=0; i<todayDealList.size(); i++) {
			UserProductVO pro = todayDealList.get(i);
			int sale_price = pro.getDeal_saleprice()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); 
			
			pro.setSale_price(decFormat.format(sale_price));
		
			for(int j=0; j<scrap.size(); j++) {
				UserScrapVO sc = scrap.get(j);
				if(pro.getPost_id() == sc.getSc_postid()) {
					pro.setCheckit(true);
				}
			}
		}
		}else {
			for(int i=0; i<todayDealList.size(); i++) {
				UserProductVO pro = todayDealList.get(i);
				int sale_price = pro.getDeal_saleprice()*(100-pro.getSale_ratio())/100;
				
				DecimalFormat decFormat = new DecimalFormat("###,###"); 
				
				pro.setSale_price(decFormat.format(sale_price));
			
				
			}
		}
		model.addAttribute("todayDealList", todayDealList);
		return "oZo_TodayDeal";
	}

	// ???????????????
	@RequestMapping(value = "/brandshop.com", method=RequestMethod.GET)
	public String main_shop(Model model, UserProductVO vo, HttpServletRequest request, UserPagingVO pvo, UserScrapVO svo, HttpSession session){
    System.err.println("[Log] --- DealBest Controller >>>>> main_shop Method");
		String brandcode = request.getParameter("brandcode");
		vo.setPost_sellerid(Integer.parseInt(brandcode));
		String catecode = "";
		
		vo.setThispage(0);
		
		if(request.getParameter("catecode") != null) {
			catecode = request.getParameter("catecode");
			String[] codes = request.getParameter("catecode").split("_");
			vo.setPo_category(Integer.parseInt(codes[0]));
			
			if(codes.length == 2) {
				System.out.println("subcategory click");
				int subcate_code = Integer.parseInt(codes[1]);
				vo.setInt(subcate_code/100*100); // mid
				
				if(subcate_code%100 != 0) {
					vo.setPo_subcate(subcate_code); 
				}
			}
			
			List<List<UserCategoryVO>> sublist = userMainService.printCateList(vo);
			model.addAttribute("sublist", sublist);
		}

		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		
		
		vo.setCheckit(false);
		
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = mypageservice.userScrapList(svo);
		}
		
		List<UserProductVO> shopItemList = userMainService.shopItemList(vo);
		int totalCount = userMainService.shopItemListCount(vo);

		for(int i=0; i<shopItemList.size(); i++){
			UserProductVO sho = shopItemList.get(i);
			int sale_price = sho.getWhole_price()*(100-sho.getSale_ratio())/100;

			DecimalFormat decFormat = new DecimalFormat("###,###");

			sho.setSale_price(decFormat.format(sale_price));
			
			for(int j=0; j<scrap.size(); j++) {
				UserScrapVO sc = scrap.get(j);
				if(sho.getPost_id() == sc.getSc_postid()) {
					sho.setCheckit(true);
				}
			}
		}
		
		List<UserCategoryVO> toplist = userMainService.printTop(vo);
		SellerVO seller = userMainService.sellerInfo(vo);
		
		List<UserCategoryVO> others = new ArrayList<UserCategoryVO>();
		for(int i=0; i<toplist.size(); i++) {
			UserCategoryVO cate = toplist.get(i);
			
			if(cate.getCate_code() == vo.getPo_category()) {
				model.addAttribute("title", cate);
			}else {
				others.add(cate);
			}
		}
		
		double brandStarRatio = userMainService.setBrandStarRatio(vo);
		
		
		//List<List<UserCategoryVO>> otherlist = userMainService.printCateList(vo);

		model.addAttribute("catecode", catecode);
		model.addAttribute("brandStarRatio", brandStarRatio);
		model.addAttribute("others", others);
		model.addAttribute("seller", seller);
		model.addAttribute("shopItemList", shopItemList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("toplist", toplist);
		
		return "oZo_ShopPage";
	}
	
	@RequestMapping(value = "/brandshopRank.com", method=RequestMethod.POST)
	public String brandshopRank(@RequestBody Map<String, String> searchMap, Model model, UserProductVO vo, HttpServletRequest request, UserScrapVO svo){
		System.err.println("[Log] --- DealBest Controller >>>>> brandshopRank Method");
		String catecode = searchMap.get("catecode");
		
		vo.setPost_sellerid(Integer.parseInt(searchMap.get("brandcode")));
		
		vo.setThispage(0);
		vo.setOrderKind(searchMap.get("ranking"));
		

		if(!catecode.equals("")) {
			String[] codes = catecode.split("_");
			vo.setPo_category(Integer.parseInt(codes[0]));
			
			if(codes.length == 2) {
				System.out.println("subcategory click");
				int subcate_code = Integer.parseInt(codes[1]);
				vo.setInt(subcate_code/100*100); // mid
				
				if(subcate_code%100 != 0) {
					vo.setPo_subcate(subcate_code); 
				}
			}
		}

		vo.setCheckit(false);
		HttpSession session = request.getSession();
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = mypageservice.userScrapList(svo);
		}
		List<UserProductVO> shopItemList = userMainService.shopItemList(vo);

		for(int i=0; i<shopItemList.size(); i++){
			UserProductVO sho = shopItemList.get(i);
			int sale_price = sho.getWhole_price()*(100-sho.getSale_ratio())/100;

			DecimalFormat decFormat = new DecimalFormat("###,###");

			sho.setSale_price(decFormat.format(sale_price));
			
			for(int j=0; j<scrap.size(); j++) {
				UserScrapVO sc = scrap.get(j);
				if(sho.getPost_id() == sc.getSc_postid()) {
					sho.setCheckit(true);
				}
			}
		}
		


		model.addAttribute("shopItemList", shopItemList);
		
		return "oZo_ShopAssist";
	}
	
	
	
	//?????????????????? ???????????????
	@RequestMapping(value = "/m_best.com")
	public String main_best(UserVO vo, Model model, HttpServletRequest request, UserProductVO uvo, UserScrapVO svo){
		System.err.println("[Log] --- DealBest Controller >>>>> main_best Method");
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		HttpSession session = request.getSession();
		List<UserProductVO> bestlist = userMainService.bestlist();
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = mypageservice.userScrapList(svo);
		
		vo.setUser_num((int)session.getAttribute("User_Num"));
		System.out.println((int)session.getAttribute("User_Num"));
		
		uvo.setCheckit(false);
		
		
		for(int i=0; i<bestlist.size(); i++) {
			UserProductVO pro = bestlist.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); 
			
			pro.setSale_price(decFormat.format(sale_price));
		
			for(int j=0; j<scrap.size(); j++) {
				UserScrapVO sc = scrap.get(j);
				if(pro.getPost_id() == sc.getSc_postid()) {
					pro.setCheckit(true);
				}
			}
		}
		
		}else {
			
			for(int i=0; i<bestlist.size(); i++) {
				UserProductVO pro = bestlist.get(i);
				int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
				
				DecimalFormat decFormat = new DecimalFormat("###,###"); 
				
				pro.setSale_price(decFormat.format(sale_price));
			
			
			}
			
		}
		
		model.addAttribute("bestlist", bestlist);
		return "oZo_BestShop";
	}
	
}
