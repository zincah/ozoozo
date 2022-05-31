package ozo.spring.house.seller.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class S_ProductController {
	
	@Autowired
	ProductService productService;
	
	@ResponseBody
	@RequestMapping(value = "/productStatusUpdate.seller", method=RequestMethod.POST)
	public String productStatusUpdate(HttpServletRequest request, ProductVO vo, @RequestParam(value="pscList[]") ArrayList<String> listProductId, @RequestParam(value="statusOption") String status) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			for(String productId : listProductId) {
				vo.setProduct_id(Integer.parseInt(productId));
				vo.setStatus(status);
				productService.updateProductStatus(vo);
				productService.updateProductUpdated(vo);
			}
			return "seller-productManagement";
		}else {
			return "seller-login";
		}
	}
	
	@RequestMapping(value="/movePaging.seller", method=RequestMethod.POST) // page 이동 (비동기)
	public String movePaging(HttpServletRequest request, Model model, ProductVO vo, Criteria cri, @RequestBody Map<String, Object> datas) {

		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		Map<String,String> searchMap = (Map<String, String>) datas.get("searchMap");
		@SuppressWarnings("unchecked")
		ArrayList<String> searchStatus = (ArrayList<String>) datas.get("searchStatus");
		
		int pageNum = Integer.parseInt(searchMap.get("pageNum")); // 페이지 정보
		cri = new Criteria(pageNum, 10); // 페이징 처리
		vo.setCri(cri);
		
		// productVO에 데이터 추가
		vo.setSc_searchName(searchMap.get("searchName").trim());
		vo.setSc_searchNameStatus(searchMap.get("searchNameStatus"));
		vo.setSc_searchStatus(searchStatus);
		if(searchMap.get("category").equals("대분류")) {
			vo.setSc_category(0);
		} else {
			vo.setSc_category(Integer.parseInt(searchMap.get("category")));
		}
		if(searchMap.get("middleSelect").equals("중분류")) {
			vo.setSc_middleSelect(0);
		} else {
			vo.setSc_middleSelect(Integer.parseInt(searchMap.get("middleSelect")));
		}
		if(searchMap.get("smallSelect").equals("소분류")) {
			vo.setSc_smallSelect(0);
		} else {
			vo.setSc_smallSelect(Integer.parseInt(searchMap.get("smallSelect")));
		}
		vo.setSc_selectDate(searchMap.get("selectDate"));
		vo.setSc_startDate(Date.valueOf(searchMap.get("startDate")));
		vo.setSc_endDate(Date.valueOf(searchMap.get("endDate")));
		vo.setSeller_id((int) session.getAttribute("seller_id"));

		// DB를 통해 리스트 추출 후 배열에 저장
		List<ProductVO> searchProductList = (productService.selectSearchProduct(vo));
		// model에 값 저장
		model.addAttribute("searchProductList", searchProductList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.selectSearchProductCount(vo));

		return "seller-productManagement-List";
	}
	
	@RequestMapping(value = "/selectProductList.seller", method=RequestMethod.POST)
	public String selectProductList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody ArrayList<String> listProductId) {
		HttpSession session = request.getSession();
		List<ProductVO> selectProductListView = new ArrayList<ProductVO>();
		if(session.getAttribute("seller")!=null) {
			for(String productId : listProductId) {
				vo.setProduct_id(Integer.parseInt(productId));
				selectProductListView.add(productService.selectSelectProduct(vo));
			}
			model.addAttribute("selectProductListView", selectProductListView);
			return "seller-productManagement-selectList";
		}else {
			return "seller-login";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectProductDelete.seller", method=RequestMethod.POST)
	public String selectProductDelete(HttpServletRequest request, ProductVO vo, @RequestBody ArrayList<String> listProductId) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			for(String productId : listProductId) {
				vo.setProduct_id(Integer.parseInt(productId));;
				productService.deleteSelectProduct(vo);
			}
			return "seller-productManagement";
		}else {
			return "seller-login";
		}
	}
	

	@RequestMapping(value = "/getSearchProductList.seller", method=RequestMethod.POST) // @RequestParam(value="searchMap", required = false) Map<String, String> searchMap,  @RequestParam(value="searchStatus", required = false) ArrayList<String> searchStatus
	public String getSearchProductList(HttpServletRequest request, Model model, ProductVO vo, Criteria cri, @RequestBody Map<String, Object> datas) {	
		
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		Map<String,String> searchMap = (Map<String, String>) datas.get("searchMap");
		@SuppressWarnings("unchecked")
		ArrayList<String> searchStatus = (ArrayList<String>) datas.get("searchStatus");
		
		vo.setCri(new Criteria());
		
		// productVO에 데이터 추가
		vo.setSc_searchName(searchMap.get("searchName").trim());
		vo.setSc_searchNameStatus(searchMap.get("searchNameStatus"));
		vo.setSc_searchStatus(searchStatus);
		if(searchMap.get("category").equals("대분류")) {
			vo.setSc_category(0);
		} else {
			vo.setSc_category(Integer.parseInt(searchMap.get("category")));
		}
		if(searchMap.get("middleSelect").equals("중분류")) {
			vo.setSc_middleSelect(0);
		} else {
			vo.setSc_middleSelect(Integer.parseInt(searchMap.get("middleSelect")));
		}
		if(searchMap.get("smallSelect").equals("소분류")) {
			vo.setSc_smallSelect(0);
		} else {
			vo.setSc_smallSelect(Integer.parseInt(searchMap.get("smallSelect")));
		}
		vo.setSc_selectDate(searchMap.get("selectDate"));
		vo.setSc_startDate(Date.valueOf(searchMap.get("startDate")));
		vo.setSc_endDate(Date.valueOf(searchMap.get("endDate")));
		vo.setSeller_id((int) session.getAttribute("seller_id"));

		// DB를 통해 리스트 추출 후 배열에 저장
		List<ProductVO> searchProductList = (productService.selectSearchProduct(vo));
		// model에 값 저장
		model.addAttribute("searchProductList", searchProductList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.selectSearchProductCount(vo));	
		
		// ajax로 부분만 띄워줄 jsp 주소 리턴
		return "seller-productManagement-List";
	}
}
