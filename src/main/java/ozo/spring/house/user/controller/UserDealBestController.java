package ozo.spring.house.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.dao.UserMainDAO;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.service.UserScrapService;
import ozo.spring.house.user.vo.ScrapVO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserDealBestController {

	@Autowired
	UserMainService userMainService;

	@Autowired
	UserScrapService userscrapservice;

	@RequestMapping(value = "/todaydeal.com")
	public String main_todayDeal(Model model,HttpServletRequest request,UserScrapVO svo ){
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		List<UserProductVO> todayDealList = userMainService.todayDealList();
		HttpSession session = request.getSession();
		if((Integer)session.getAttribute("User_Num")!=null) {
		svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
		scrap = userscrapservice.userScrapList(svo);
		
		
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
		System.out.println("todaydealListsize"+ todayDealList.size());
		return "ozotodaydeal_zinc";
	}

	// 브랜드
	@RequestMapping(value = "/brandshop.com", method=RequestMethod.GET)
	public String main_shop(Model model, UserProductVO vo, HttpServletRequest request){
		
		String brandcode = request.getParameter("brandcode");
		vo.setPost_sellerid(Integer.parseInt(brandcode));
		
		vo.setThispage(0);
		
		if(request.getParameter("catecode") != null) {
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
			System.out.println("subli size" + sublist.size());
		}

		
		List<UserProductVO> shopItemList = userMainService.shopItemList(vo);
		int totalCount = userMainService.shopItemListCount(vo);

		for(int i=0; i<shopItemList.size(); i++){
			UserProductVO sho = shopItemList.get(i);
			int sale_price = sho.getWhole_price()*(100-sho.getSale_ratio())/100;

			DecimalFormat decFormat = new DecimalFormat("###,###");

			sho.setSale_price(decFormat.format(sale_price));
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
		model.addAttribute("others", others);
		
		//List<List<UserCategoryVO>> otherlist = userMainService.printCateList(vo);

		//model.addAttribute("otherlist", otherlist);
		model.addAttribute("seller", seller);
		model.addAttribute("shopItemList", shopItemList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("toplist", toplist);
		
		return "ozoshop_main";
	}
	
	@RequestMapping(value = "/brandshopRank.com", method=RequestMethod.POST)
	public String brandshopRank(@RequestBody Map<String, String> searchMap, Model model, UserProductVO vo, HttpServletRequest request){
		
		vo.setPost_sellerid(Integer.parseInt(searchMap.get("brandcode")));
		
		vo.setThispage(0);
		vo.setOrderKind(searchMap.get("ranking"));
		
		if(request.getParameter("catecode") != null) {
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
		}
		
		List<UserProductVO> shopItemList = userMainService.shopItemList(vo);

		for(int i=0; i<shopItemList.size(); i++){
			UserProductVO sho = shopItemList.get(i);
			int sale_price = sho.getWhole_price()*(100-sho.getSale_ratio())/100;

			DecimalFormat decFormat = new DecimalFormat("###,###");

			sho.setSale_price(decFormat.format(sale_price));
		}
		


		model.addAttribute("shopItemList", shopItemList);
		
		return "ozoshop_mainplus";
	}
	
	
	
	//실시간 베스트
	@RequestMapping(value = "/m_best.com")
	public String main_best(UserVO vo, Model model, HttpServletRequest request, UserProductVO uvo, UserScrapVO svo){
		//
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		HttpSession session = request.getSession();
		List<UserProductVO> bestlist = userMainService.bestlist();
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = userscrapservice.userScrapList(svo);
		
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
			
		}
		
		model.addAttribute("bestlist", bestlist);
		System.out.println("bestlist"+ bestlist.size());
		System.out.println("베스트 뿌린다아!");
		return "ozobest_zinc";
	}
	
}
