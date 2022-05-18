package ozo.spring.house.seller.controller;

import java.sql.Date;
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

import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.SellerOrderService;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class SellerOrderController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	SellerOrderService sellerOrderService;
	
	// 판매글 검색 컨트롤러
	@RequestMapping(value = "/getSearchOrderList.seller", method=RequestMethod.POST)
	public String getSearchProductList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody Map<String, Object> datas) {	
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		Map<String,String> searchMap = (Map<String, String>) datas.get("searchMap");
		@SuppressWarnings("unchecked")
		ArrayList<String> searchStatus = (ArrayList<String>) datas.get("searchStatus");
		
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
		vo.setSc_startDate(Date.valueOf(searchMap.get("startDate")));
		vo.setSc_endDate(Date.valueOf(searchMap.get("endDate")));
		vo.setSeller_id((int) session.getAttribute("seller_id"));

		// DB를 통해 리스트 추출 후 배열에 저장
		List<ProductVO> searchOrderList = (sellerOrderService.selectSearchOrder(vo));
		// model에 값 저장
		model.addAttribute("searchOrderList", searchOrderList);
		
		// ajax로 부분만 띄워줄 jsp 주소 리턴
		return "seller-order-List";
	}
	
	// 주문 상세조회 모달 컨트롤러
	@RequestMapping(value = "/getOrderDatailView.seller", method=RequestMethod.POST)
	public String getOrderDatailView(HttpServletRequest request, Model model, ProductVO vo, @RequestBody Map<String, String> datas) {	
		HttpSession session = request.getSession();
		
		String selectOrderGroupId = datas.get("orderNumData");
		String selectOrderId = datas.get("orderIdData");
				
		// productVO에 데이터 추가
		vo.setOrder_num(Integer.parseInt(selectOrderGroupId.replaceAll("\"", "")));
		vo.setOrder_id(Integer.parseInt(selectOrderId.replaceAll("\"", "")));
		vo.setSeller_id((int) session.getAttribute("seller_id"));

		// DB를 통해 리스트 추출 후 배열에 저장
		List<ProductVO> orderDetailList = (sellerOrderService.selectOrderDetailData(vo)); // 해당 그룹주문번호의 주문건 리스트
		ProductVO orderDetailPayment = (sellerOrderService.selectOrderDetailPayment(vo)); // 해당 그룹주문번호의 결제정보
		
		// model에 값 저장
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderDetailPayment", orderDetailPayment);
		
		// ajax로 부분만 띄워줄 jsp 주소 리턴
		return "seller-order-detail";
	}
}
