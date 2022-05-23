package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ozo.spring.house.user.service.UserCategoryService;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.service.UserScrapService;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;

@Controller
public class UserPagingController {
	
	@Autowired
	UserMainService userMainService;
	
	@Autowired
	UserCategoryService userCateService;
	
	@Autowired
	UserScrapService userScrapService;

	// main page
	@RequestMapping(value = "/getProductList.com")
	public String user_main(@RequestBody String su, UserProductVO vo, UserPagingVO pvo, UserScrapVO svo,  Model model, HttpSession session) {
		
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		
		// product list �뜝�떛源띿삕

		vo.setCheckit(false);
		
		// product list 뽑기
		int pagecount = Integer.parseInt(su);
		pvo.setThispage(pagecount); // 잘감
		
		List<UserProductVO> productList = userMainService.plusProductList(pvo);
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = userScrapService.userScrapList(svo);
		}

		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
			
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
		model.addAttribute("pagecount", pagecount);

		return "ozomain_plus";
	}
	
	// category page
	@RequestMapping(value = "/getProductListCate.com")
	public String user_cate(@RequestBody List<List<String>> wholeList, UserCategoryVO vo, UserPagingVO pvo, Model model,UserScrapVO svo, HttpSession session) {
		
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = userScrapService.userScrapList(svo);
		}
		System.out.println(wholeList);
		
		List<String> cates = wholeList.get(1);

		// category 넣어주기
		vo.setTop_catecode(Integer.parseInt(cates.get(0)));
		if(cates.size()>1 && cates.get(1)!="") {
			vo.setMidcate_code(Integer.parseInt(cates.get(1)));
			if(cates.size()>2 && cates.get(2)!="") {
				vo.setSubcate_code(Integer.parseInt(cates.get(2)));
			}
		}
		
		vo.setFiltering(wholeList.get(0));
		vo.setThispage(Integer.parseInt(wholeList.get(2).get(0)));
		
		
		//List<UserProductVO> productList = userCateService.selectProductByCate(vo);
		List<UserProductVO> productList = userCateService.getPostList(vo);
		System.out.println(productList.size());
		
		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
			
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
		
		return "cates";
	}

}
