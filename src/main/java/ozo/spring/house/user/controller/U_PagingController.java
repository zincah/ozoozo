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

import ozo.spring.house.user.service.U_CategoryService;
import ozo.spring.house.user.service.U_MainService;
import ozo.spring.house.user.service.U_MyPageService;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;

@Controller
public class U_PagingController {
	
	@Autowired
	U_MainService userMainService;
	
	@Autowired
	U_CategoryService userCateService;
	
	@Autowired
	U_MyPageService mypageService;

	// main page
	@RequestMapping(value = "/getProductList.com")
	public String user_main(@RequestBody Map<String, String> searchMap, UserProductVO vo, UserPagingVO pvo, UserScrapVO svo,  Model model, HttpSession session) {
		System.err.println("[Log] --- Paging Controller >>>>> user_main Method");
		// scrap
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		vo.setCheckit(false);
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = mypageService.userScrapList(svo);
		}
		

		// product list pagecount
		int pagecount = Integer.parseInt(searchMap.get("page"));
		pvo.setThispage(pagecount);
		pvo.setOrderKind(searchMap.get("ranking"));
		
		List<UserProductVO> productList = userMainService.plusProductList(pvo);

		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
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
		
		model.addAttribute("productList", productList);
		//model.addAttribute("pagecount", pagecount);
		
		return "oZo_MainAssist";
	}
	
	// category page
	@RequestMapping(value = "/getProductListCate.com")
	public String user_cate(@RequestBody List<List<String>> wholeList, UserCategoryVO vo, UserPagingVO pvo, Model model,UserScrapVO svo, HttpSession session) {
		System.err.println("[Log] --- Paging Controller >>>>> user_cate Method");
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = mypageService.userScrapList(svo);
		}
		
		List<String> cates = wholeList.get(1);

		// category 
		vo.setTop_catecode(Integer.parseInt(cates.get(0)));
		if(cates.size()>1 && cates.get(1)!="") {
			vo.setMidcate_code(Integer.parseInt(cates.get(1)));
			if(cates.size()>2 && cates.get(2)!="") {
				vo.setSubcate_code(Integer.parseInt(cates.get(2)));
			}
		}
		
		vo.setFiltering(wholeList.get(0));
		vo.setThispage(Integer.parseInt(wholeList.get(2).get(0)));
		vo.setOrderKind(wholeList.get(3).get(0)); // ranking
		
		//List<UserProductVO> productList = userCateService.selectProductByCate(vo);
		List<UserProductVO> productList = userCateService.getPostList(vo);
		
		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
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
		model.addAttribute("productList", productList);
		//model.addAttribute("pagecount", pagecount);
		return "oZo_CategoryAssist";
	}
	
	// brand page
	@RequestMapping(value = "/brandshopPaging.com", method=RequestMethod.POST)
	public String brandshopPaging(@RequestBody Map<String, String> searchMap, Model model, UserProductVO vo, HttpServletRequest request,UserScrapVO svo, HttpSession session){
		System.err.println("[Log] --- Paging Controller >>>>> brandshopRank Method");
		String catecode = searchMap.get("catecode");
		
		vo.setPost_sellerid(Integer.parseInt(searchMap.get("brandcode")));
		vo.setThispage(Integer.parseInt(searchMap.get("page")));
		vo.setOrderKind(searchMap.get("ranking"));
		
		if(!catecode.equals("")) {
			String[] codes = catecode.split("_");
			vo.setPo_category(Integer.parseInt(codes[0]));
			
			if(codes.length == 2) {
				int subcate_code = Integer.parseInt(codes[1]);
				vo.setInt(subcate_code/100*100); // mid
				
				if(subcate_code%100 != 0) {
					vo.setPo_subcate(subcate_code); 
				}
			}
		}
		
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = mypageService.userScrapList(svo);
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

}
