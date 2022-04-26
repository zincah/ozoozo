package ozo.spring.house.seller.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.vo.CategoryVO;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(value = "/insertProductCate.seller", method=RequestMethod.GET)
	public String test(CategoryVO vo, Model model) {
		List<CategoryVO> cateList = categoryService.getCategoryList(vo);
		model.addAttribute("cateList", cateList);		
		return "seller-insertProduct";
	}

}
