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
public class A_PostingInfoController { // posting 상세 보기 (옮겨야할듯:))
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService sellerproductService;
	
	@Autowired
	AdminProductManageService productService;
	
	@RequestMapping(value = "/postingInfo.admin", method=RequestMethod.GET)
	public String postingInfoView(CategoryVO vo, Model model, HttpServletRequest request) {
		System.err.println("[Log] --- PostingInfo 	Controller >>>>> postingInfoView 	Method");
		HttpSession session = request.getSession();

		if(session.getAttribute("admincode")!=null) {
			
			int postcode = Integer.parseInt((String)request.getParameter("postcode")); // get 방식으로 요청된 post_id 

			/* 상품 정보 세팅 */
			PostingInfoVO pvo = productService.postInfo(postcode);
			List<Map<String, String>> productlist = pvo.getProductlist();
			
			Map<String, String> product = productlist.get(0); // 리스트 중 첫번째를 가져와서 공통된 정보 세팅
			List<Integer> optionnums = pvo.getOptionnums(); // 선택된 옵션 보여주기
			ProductDetailVO detail = pvo.getDetail(); // 디테일 테이블 정보 뿌리기
			List<Map<String, String>> photolist = pvo.getPhotolist(); // 업로드된 사진 리스트
			
			/* 카테고리 세팅 */
			List<CategoryVO> cateList = categoryService.getCategoryList(vo);
			
			int su = Integer.parseInt(String.valueOf(product.get("po_category")));
			vo.setCate_code(su);
			List<List<FilterVO>> wholeList = categoryService.getFilterOption(vo); // 각 카테고리의 filter
			
			model.addAttribute("cateList", cateList);	
			model.addAttribute("productlist", productlist);
			model.addAttribute("wholeList", wholeList);
			model.addAttribute("optionnums", optionnums); 
			model.addAttribute("detail", detail);
			model.addAttribute("photolist", photolist);

			return "postingInfo";
		}else {
			return "adminLogin_dj";
		}
	}

	
	

}
