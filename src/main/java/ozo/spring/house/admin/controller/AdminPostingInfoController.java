package ozo.spring.house.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.admin.service.AdminProductManageService;
import ozo.spring.house.admin.vo.PostingInfoVO;
import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.seller.vo.ProductDetailVO;

@Controller
public class AdminPostingInfoController {
	
	// seller part : posting info
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService sellerproductService;
	
	@Autowired
	AdminProductManageService productService;
	
	@RequestMapping(value = "/postingInfo.admin", method=RequestMethod.GET)
	public String postingInfoView(CategoryVO vo, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();

		if(session.getAttribute("admincode")!=null) {
			
			int postcode = Integer.parseInt((String)request.getParameter("postcode"));
			
			// 대분류 가져오기
			List<CategoryVO> cateList = categoryService.getCategoryList(vo);
			model.addAttribute("cateList", cateList);	
			
			PostingInfoVO pvo = productService.postInfo(postcode);
			List<Map<String, String>> productlist = pvo.getProductlist();
			model.addAttribute("productlist", productlist);
			
			//System.out.println(productlist);
			
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
			
			//System.out.println(photolist);

			return "postingInfo";
		}else {
			return "adminLogin_dj";
		}
	}

	
	

}
