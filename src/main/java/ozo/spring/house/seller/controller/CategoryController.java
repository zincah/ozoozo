package ozo.spring.house.seller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.ProductVO;

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
	
	@ResponseBody
	@RequestMapping(value = "/getMiddleCategory.seller", method=RequestMethod.POST)
	public List<CategoryVO> midcate(@RequestBody CategoryVO vo) {
		vo.setTop_catecode(vo.getCate_code());
		vo.setDepth(1);
		List<CategoryVO> midList = categoryService.getMidCategoryList(vo);
		return midList;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getBottomCategory.seller", method=RequestMethod.POST)
	public List<CategoryVO> botcate(@RequestBody CategoryVO vo) {
		vo.setDepth(2);
		List<CategoryVO> botList = categoryService.getBotCategoryList(vo);
		return botList;
	}

	// 상품등록시
	@RequestMapping(value = "/putProduct.seller", method=RequestMethod.POST)
	public String putProduct(ProductVO vo) {
		
		return "index";
	}

}
