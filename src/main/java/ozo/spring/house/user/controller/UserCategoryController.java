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

import ozo.spring.house.user.service.UserCategoryService;
import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
public class UserCategoryController {
	
	@Autowired
	UserCategoryService userCategoryService;
	
	@RequestMapping(value = "/m_category.com", method=RequestMethod.GET)
	public String category(UserCategoryVO vo, Model model, HttpServletRequest request) {

		int catecode = Integer.parseInt(request.getParameter("topcate_code"));
		
		System.out.println(catecode);
		vo.setTop_catecode(catecode); // url로 전달받은 코드
		
		List<UserCategoryVO> titleList = userCategoryService.printTitle();
		List<UserCategoryVO> others = new ArrayList<UserCategoryVO>();
		
		for(int i=0; i<titleList.size(); i++) {
			UserCategoryVO cate = titleList.get(i);
			
			if(cate.getCate_code() == catecode) {
				model.addAttribute("title", cate);
			}else {
				others.add(cate);
			}
		}
		model.addAttribute("others", others);
		
		List<List<UserCategoryVO>> wholeList = userCategoryService.selectCategoryList(vo);
		System.out.println(wholeList.size());

		model.addAttribute("wholeList", wholeList);
		
		List<UserProductVO> productList = userCategoryService.selectProductByCate(vo);
		
		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
			
			pro.setSale_price(decFormat.format(sale_price));
		}
		
		model.addAttribute("productList", productList);


		return "ozocategory_zinc";
	}
	@ResponseBody
	@RequestMapping(value = "/gocategory.com", method=RequestMethod.GET)
	public List<UserCategoryVO> catelist(String category,UserCategoryVO vo) {
		
		System.out.println(category);
		List<UserCategoryVO> s_list=null ;
		
			

		
		return s_list;
	}
	
}
