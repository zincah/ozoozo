package ozo.spring.house.seller.controller;

import java.util.ArrayList;
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

import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class SellerProductController {
	
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
	
	@ResponseBody
	@RequestMapping(value = "/getSearchProductList.seller", method=RequestMethod.POST)
	public String getSearchProductList(HttpServletRequest request, Model model, ProductVO vo, @RequestParam(value="searchMap") Map<String, Object> searchMap,  @RequestParam(value="searchStatus") ArrayList<String> searchStatus) {	
		HttpSession session = request.getSession();
		
		// productVO에 데이터 추가
		vo.setSc_searchName(String.valueOf(searchMap.get("searchName")).trim());
		vo.setSc_searchNameStatus(String.valueOf(searchMap.get("searchNameStatus")));
		vo.setSc_searchStatus(searchStatus);
		vo.setSc_category(String.valueOf(searchMap.get("category")));
		vo.setSc_middleSelect(String.valueOf(searchMap.get("middleSelect")));
		vo.setSc_smallSelect(String.valueOf(searchMap.get("smallSelect")));
		vo.setSc_selectDate(String.valueOf(searchMap.get("selectDate")));
		vo.setSc_startDate(String.valueOf(searchMap.get("startDate")));
		vo.setSc_endDate(String.valueOf(searchMap.get("endDate")));
		vo.setSeller_id((int) session.getAttribute("seller_id"));
		
		// DB를 통해 리스트 추출 후 배열에 저장
		List<ProductVO> searchProductList = (productService.selectSearchProduct(vo));
		// model에 값 저장
		model.addAttribute("searchProductList", searchProductList);
		
		// ajax로 부분만 띄워줄 jsp 주소 리턴
		return "seller-productManagement-List";
	}
}
