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

import ozo.spring.house.admin.service.AdminProductManageService;
import ozo.spring.house.admin.vo.PostingInfoVO;
import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.seller.vo.ProductDetailVO;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	AdminProductManageService adminProductService;
	
	@RequestMapping(value = "/insertProductCate.seller", method=RequestMethod.GET)
	public String test(CategoryVO vo, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("seller")!=null) {
			
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
			
		}else {
			return "redirect:login.seller";
		}


	}
	
	@RequestMapping(value = "/postingInfo.seller", method=RequestMethod.GET)
	public String postingInfo(CategoryVO vo, Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		if(session.getAttribute("seller")!=null) {
			
			int postcode = Integer.parseInt((String)request.getParameter("postcode"));
			System.out.println(postcode);
			// 대분류 가져오기
			List<CategoryVO> cateList = categoryService.getCategoryList(vo);
			model.addAttribute("cateList", cateList);	
			
			PostingInfoVO pvo = adminProductService.postInfo(postcode);
			List<Map<String, String>> productlist = pvo.getProductlist();
			model.addAttribute("productlist", productlist);
			
			System.out.println(productlist);
			
			Map<String, String> product = productlist.get(0);
			int su = Integer.parseInt(String.valueOf(product.get("po_category")));
			vo.setCate_code(su);
			List<List<FilterVO>> wholeList = categoryService.getFilterOption(vo); // filter 가져오는 거
			model.addAttribute("wholeList", wholeList);
			
			List<Integer> optionnums = pvo.getOptionnums(); // 선택된 옵션 보여주기
			model.addAttribute("optionnums", optionnums); 
			
			ProductDetailVO detail = pvo.getDetail(); // 테이블 정보 뿌리기
			model.addAttribute("detail", detail);
			
			List<Map<String, String>> photolist = pvo.getPhotolist();
			model.addAttribute("photolist", photolist);
			
			return "seller-postingInfo";

		}else {
			return "login";
		}

		
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
