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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 선택된 주문건 리스트(메뉴 모달용)
	@RequestMapping(value = "/selectOrderList.seller", method=RequestMethod.POST)
	public String selectOrderList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody ArrayList<String> datas) {	
		HttpSession session = request.getSession();
		
		// 하나씩 출력될 주문건 리스트를 저장할 변수
		List<ProductVO> selectOrderList = new ArrayList<ProductVO>();
		
		// 넘겨받은 order_id 배열값 하나씩 뽑고 쿼리문 처리
		for(String selectOrderId : datas) {
			vo.setOrder_id(Integer.parseInt(selectOrderId));
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			selectOrderList.add(sellerOrderService.selectOrderListModal(vo));
		}

		// model에 값 저장
		model.addAttribute("selectOrderList", selectOrderList);
		
		// ajax로 부분만 띄워줄 jsp 주소 리턴
		return "seller-order-selectList";
	}
	
	// 발주처리
	@ResponseBody
	@RequestMapping(value = "/orderCheckUpdate.seller", method=RequestMethod.POST)
	public String orderCheckUpdate(HttpServletRequest request, Model model, ProductVO vo, @RequestBody ArrayList<String> datas) {	
		HttpSession session = request.getSession();
		
		// 주문건 상태가 '결제완료'가 아닐경우 실패 처리
		for(String selectOrderId : datas) {
			vo.setOrder_id(Integer.parseInt(selectOrderId));
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			ProductVO orderStatus = sellerOrderService.selectOrderListModal(vo);
			if(!orderStatus.getOrder_status().equals("결제완료")) {
				return "fail";
			}
		}
		
		// 넘겨받은 order_id 배열값 하나씩 뽑고 쿼리문 처리
		for(String selectOrderId : datas) {
			vo.setOrder_id(Integer.parseInt(selectOrderId));
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			sellerOrderService.updateOrderCheck(vo);
		}
		
		return "success";
	}
	
	// 발송처리
	@ResponseBody
	@RequestMapping(value = "/orderSendUpdate.seller", method=RequestMethod.POST)
	public String orderSendUpdate(HttpServletRequest request, Model model, ProductVO vo, @RequestBody Map<String, Object> datas) {	
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		ArrayList<String> selectOrderIdList = (ArrayList<String>) datas.get("selectList");
		@SuppressWarnings("unchecked")
		ArrayList<String> selectOrderNumList = (ArrayList<String>) datas.get("selectListON");
		String delivery = (String) datas.get("delivery");
		if((String) datas.get("invoice") == null || ((String) datas.get("invoice")).equals("")) {
			return "fail3";
		}
		int invoice;
		try { // 숫자가 아닌 값이 들어갈 경우 예외처리
			invoice = Integer.valueOf(((String) datas.get("invoice")).trim());
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return "fail4";
		}
		
		// 주문건 상태가 '배송준비중'이 아닐경우 실패 처리
		for(String selectOrderId : selectOrderIdList) {
			vo.setOrder_id(Integer.parseInt(selectOrderId));
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			ProductVO orderStatus = sellerOrderService.selectOrderListModal(vo);
			if(!orderStatus.getOrder_status().equals("배송준비중")) {
				return "fail1";
			}
		}

		// 같은 그룹주문번호인지 검증
		for(int i=1; i < selectOrderNumList.size(); i++) {
			if(!selectOrderNumList.get(0).equals(selectOrderNumList.get(i))) {
				return "fail2";
			}
		}
		
		// 넘겨받은 order_id 배열값 하나씩 뽑고 쿼리문 처리
		for(String selectOrderId : selectOrderIdList) {
			vo.setOrder_id(Integer.parseInt(selectOrderId));
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			vo.setDelivery(delivery);
			vo.setInvoice_number(invoice);
			sellerOrderService.updateOrderSend(vo);
		}
		
		return "success";
	}
}
