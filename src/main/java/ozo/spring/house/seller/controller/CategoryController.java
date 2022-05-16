package ozo.spring.house.seller.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/insertProductCate.seller", method=RequestMethod.GET)
	public String test(CategoryVO vo, Model model, HttpServletRequest request) {

		List<CategoryVO> cateList = categoryService.getCategoryList(vo);
		model.addAttribute("cateList", cateList);	
		
		vo.setCate_code(1); // 처음은 가구로 세팅
		List<List<FilterVO>> wholeList = categoryService.getFilterOption(vo);
		model.addAttribute("wholeList", wholeList);
		
		for(int i=0; i<wholeList.size(); i++) {
			List<FilterVO> list = wholeList.get(i);
			//System.out.println(list);
		}
		
		
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
	public String insertPost(ProductVO vo) {
		System.out.println("update 전");
		System.out.println(vo.getPo_category());
		System.out.println(vo.getPo_subcate());
		productService.updatePost(vo);
		
		System.out.println("update 후");
		return "index";
	}

	// filter를 가져오는 부분
	@RequestMapping(value="/getFilterOption.seller", method=RequestMethod.POST)
	public String getFilterOption(@RequestBody CategoryVO vo, Model model) {
		
		System.out.println(vo.getCate_code());
		
		List<List<FilterVO>> wholeList = categoryService.getFilterOption(vo);
		model.addAttribute("wholeList", wholeList);


		return "filtering";
		
	}
}
