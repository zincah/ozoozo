package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.user.service.U_MyPageService;
import ozo.spring.house.user.service.U_CategoryService;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;

@Controller
public class U_CategoryController {
	
	@Autowired
	U_CategoryService userCategoryService;
	
	@Autowired
	U_MyPageService mypageservice;
	
	@RequestMapping(value = "/category.com", method=RequestMethod.GET)
	public String category(UserCategoryVO vo, Model model, HttpServletRequest request, UserScrapVO svo, HttpSession session,UserProductVO pvo) {
		System.err.println("[Log] --- Category Controller >>>>> category Method");
		String[] codes = request.getParameter("catecode").split("_");
		
		if(codes.length == 2) {
			int subcate_code = Integer.parseInt(codes[1]);
			vo.setMidcate_code(subcate_code/100);
			
			if(subcate_code%100 != 0) {
				vo.setSubcate_code(subcate_code);
			}
		}
		int topcate_code = Integer.parseInt(codes[0]);

		vo.setTop_catecode(topcate_code); // url占쎌뒙占쎈뙔占쎌굲 占쎈쐻占쎈윪占쎌벁占쎈쐻占쎈윥�젆濡㏓쎗占쎈즵�뙴�뎽�쐻�뜝占� �뜝�럡��占쎄껀占쎈폇�뤃占�
		int total = userCategoryService.getCategoryCount(vo); // 占쎈쐻占쎈윪占쎌벁癲ル슪�맔占쎌굲 占쎈쨬占쎈즵獒뺣돍�삕占쎈묄 占쎌녃域뱄퐦�삕雅��겦�꼥�눧�뼃�쐻�뜝占�
		
		List<UserCategoryVO> titleList = userCategoryService.printTitle();
		List<UserCategoryVO> others = new ArrayList<UserCategoryVO>();
		
		for(int i=0; i<titleList.size(); i++) {
			UserCategoryVO cate = titleList.get(i);
			
			if(cate.getCate_code() == topcate_code) {
				model.addAttribute("title", cate);
			}else {
				others.add(cate);
			}
		}
		model.addAttribute("others", others);
		
		List<List<UserCategoryVO>> wholeList = userCategoryService.selectCategoryList(vo);
		//System.out.println(wholeList);

		model.addAttribute("wholeList", wholeList);
		
		vo.setThispage(0);
		List<UserProductVO> productList = userCategoryService.selectProductByCate(vo);
		
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();

		pvo.setCheckit(false);
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = mypageservice.userScrapList(svo);
		}
		
		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //占쎈쐻占쎈윥�댆戮⑸쐻占쎈윥占쎈묄占쎈쐻占쎈윪占쎌젌 占쎈쐻占쎈윥筌띿눨�쐻占쎈윥占쎈묄
			
			pro.setSale_price(decFormat.format(sale_price));
			
			for(int j=0; j<scrap.size(); j++) {
				UserScrapVO sc = scrap.get(j);
				if(pro.getPost_id() == sc.getSc_postid()) {
					pro.setCheckit(true);
				}
			}
		}
		
		model.addAttribute("productList", productList);
		model.addAttribute("totalCount", total);

		List<UserCategoryVO> catename = userCategoryService.getCateName(vo);
		model.addAttribute("catename", catename);
		
		// filter 占쎈쐻占쎈윪疫뀁슃�쐻占쎈윥�뜝�룞�삕 占쎈쨬占쎈즸占쎌굲占쎈쐻占쎈윪雅뚎껊쐻占쎈윪亦낅¨堉⑨옙癒��굲
		List<List<FilterVO>> optionList = userCategoryService.getFilterOption(vo);
		model.addAttribute("optionList", optionList);
		
		return "oZo_Category";
	}
	

	@RequestMapping(value = "/getFilterList.com", method=RequestMethod.POST)
	public String getFilterList(@RequestBody List<List<String>> wholeList, UserCategoryVO vo, Model model) {
		System.err.println("[Log] --- Category Controller >>>>> getFilterList Method");
		
		List<String> cates = wholeList.get(1);
		System.out.println("category " + cates);

		// category 
		vo.setTop_catecode(Integer.parseInt(cates.get(0)));
		if(cates.size()>1 && cates.get(1)!="") {
			vo.setMidcate_code(Integer.parseInt(cates.get(1)));
			if(cates.size()>2 && cates.get(2)!="") {
				vo.setSubcate_code(Integer.parseInt(cates.get(2)));
			}
		}
		
		List<String> list = wholeList.get(0);
		List<String> filterList = new ArrayList<String>();
		
		for(int i=0; i<list.size(); i++) {
			String check = list.get(i);
			if(check.equals("오늘의딜")) {
				vo.setDealCheck(true);
			}else {
				filterList.add(check);
			}
		}
		
		// filter 조건 넣어주기
		vo.setFiltering(filterList);
		vo.setOrderKind(wholeList.get(2).get(0)); 
		
		List<UserProductVO> postList = userCategoryService.getPostList(vo);
		int filterCount = userCategoryService.filterCount(vo);
		
		for(int i=0; i<postList.size(); i++) {
			UserProductVO pro = postList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###");
			
			pro.setSale_price(decFormat.format(sale_price));
		}
		
		model.addAttribute("filterCount", filterCount);
		model.addAttribute("productList", postList);
		
		return "oZo_CategoryAssist";
	}
	
}
