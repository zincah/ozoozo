package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.user.service.UserCategoryService;
import ozo.spring.house.user.service.UserScrapService;
import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;

@Controller
public class UserCategoryController {
	
	@Autowired
	UserCategoryService userCategoryService;
	
	@Autowired
	UserScrapService userScrapService;
	
	@RequestMapping(value = "/category.com", method=RequestMethod.GET)
	public String category(UserCategoryVO vo, Model model, HttpServletRequest request, UserScrapVO svo, HttpSession session,UserProductVO pvo) {

		String[] codes = request.getParameter("catecode").split("_");
		
		if(codes.length == 2) {
			int subcate_code = Integer.parseInt(codes[1]);
			vo.setMidcate_code(subcate_code/100);
			
			if(subcate_code%100 != 0) {
				vo.setSubcate_code(subcate_code);
			}
		}

		int topcate_code = Integer.parseInt(codes[0]);
		System.out.println(topcate_code);
		

		vo.setTop_catecode(topcate_code); // url濡� �쟾�떖諛쏆� 肄붾뱶
		int total = userCategoryService.getCategoryCount(vo); // �쟾泥� 媛쒖닔 蹂대궡湲�
		
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
			scrap = userScrapService.userScrapList(svo);
		}
		
		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //�냼�닔�젏 �븿�닔
			
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
		
		// filter �샃�뀡 媛��졇�삤湲�
		List<List<FilterVO>> optionList = userCategoryService.getFilterOption(vo);
		model.addAttribute("optionList", optionList);
		
		return "ozocategory_zinc";
	}
	

	@RequestMapping(value = "/getFilterList.com", method=RequestMethod.POST)
	public String getFilterList(@RequestBody List<List<String>> wholeList, UserCategoryVO vo, Model model) {
		
		System.out.println(wholeList);
		
		List<String> cates = wholeList.get(1);

		// category �꽔�뼱二쇨린
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
		System.out.println(filterList);
		
		// list에서 remove 0하면 사라짐
		vo.setFiltering(filterList);
		vo.setOrderKind(wholeList.get(2).get(0)); // 순위 넣어주기
		
		List<UserProductVO> postList = userCategoryService.getPostList(vo);
		int filterCount = userCategoryService.filterCount(vo);
		System.out.println("filtering count" + filterCount);
		
		for(int i=0; i<postList.size(); i++) {
			UserProductVO pro = postList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //�냼�닔�젏 �븿�닔
			
			pro.setSale_price(decFormat.format(sale_price));
		}
		
		model.addAttribute("filterCount", filterCount);
		model.addAttribute("productList", postList);
		
		return "cates";
	}
	
}
