package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
public class UserCategoryController {
	
	@Autowired
	UserCategoryService userCategoryService;
	
	@RequestMapping(value = "/category.com", method=RequestMethod.GET)
	public String category(UserCategoryVO vo, Model model, HttpServletRequest request) {

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
		

		vo.setTop_catecode(topcate_code); // url로 전달받은 코드
		int total = userCategoryService.getCategoryCount(vo); // 전체 개수 보내기
		
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
		System.out.println(wholeList.size());

		model.addAttribute("wholeList", wholeList);
		
		vo.setThispage(0);
		List<UserProductVO> productList = userCategoryService.selectProductByCate(vo);
		
		
		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
			
			pro.setSale_price(decFormat.format(sale_price));
		}
		
		model.addAttribute("productList", productList);
		model.addAttribute("totalCount", total);

		List<UserCategoryVO> catename = userCategoryService.getCateName(vo);
		model.addAttribute("catename", catename);
		
		// filter 옵션 가져오기
		List<List<FilterVO>> optionList = userCategoryService.getFilterOption(vo);
		model.addAttribute("optionList", optionList);
		
		return "ozocategory_zinc";
	}
	

	@RequestMapping(value = "/getFilterList.com", method=RequestMethod.POST)
	public String getFilterList(@RequestBody List<List<String>> wholeList, UserCategoryVO vo, Model model) {
		
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

		List<UserProductVO> postList = userCategoryService.getPostList(vo);
		int filterCount = userCategoryService.filterCount(vo);
		System.out.println("filtering count" + filterCount);
		
		for(int i=0; i<postList.size(); i++) {
			UserProductVO pro = postList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
			
			pro.setSale_price(decFormat.format(sale_price));
		}
		
		model.addAttribute("filterCount", filterCount);
		model.addAttribute("productList", postList);
		
		return "cates";
	}
	
}
