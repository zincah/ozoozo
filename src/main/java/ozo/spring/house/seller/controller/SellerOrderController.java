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
	
	// �Ǹű� �˻� ��Ʈ�ѷ�
	@RequestMapping(value = "/getSearchOrderList.seller", method=RequestMethod.POST)
	public String getSearchProductList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody Map<String, Object> datas) {	
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		Map<String,String> searchMap = (Map<String, String>) datas.get("searchMap");
		@SuppressWarnings("unchecked")
		ArrayList<String> searchStatus = (ArrayList<String>) datas.get("searchStatus");
		
		// productVO�� ������ �߰�
		vo.setSc_searchName(searchMap.get("searchName").trim());
		vo.setSc_searchNameStatus(searchMap.get("searchNameStatus"));
		vo.setSc_searchStatus(searchStatus);
		if(searchMap.get("category").equals("��з�")) {
			vo.setSc_category(0);
		} else {
			vo.setSc_category(Integer.parseInt(searchMap.get("category")));
		}
		if(searchMap.get("middleSelect").equals("�ߺз�")) {
			vo.setSc_middleSelect(0);
		} else {
			vo.setSc_middleSelect(Integer.parseInt(searchMap.get("middleSelect")));
		}
		if(searchMap.get("smallSelect").equals("�Һз�")) {
			vo.setSc_smallSelect(0);
		} else {
			vo.setSc_smallSelect(Integer.parseInt(searchMap.get("smallSelect")));
		}
		vo.setSc_startDate(Date.valueOf(searchMap.get("startDate")));
		vo.setSc_endDate(Date.valueOf(searchMap.get("endDate")));
		vo.setSeller_id((int) session.getAttribute("seller_id"));

		// DB�� ���� ����Ʈ ���� �� �迭�� ����
		List<ProductVO> searchOrderList = (sellerOrderService.selectSearchOrder(vo));
		// model�� �� ����
		model.addAttribute("searchOrderList", searchOrderList);
		
		// ajax�� �κи� ����� jsp �ּ� ����
		return "seller-order-List";
	}
	
	// �ֹ� ����ȸ ��� ��Ʈ�ѷ�
	@RequestMapping(value = "/getOrderDatailView.seller", method=RequestMethod.POST)
	public String getOrderDatailView(HttpServletRequest request, Model model, ProductVO vo, @RequestBody Map<String, String> datas) {	
		HttpSession session = request.getSession();
		
		String selectOrderGroupId = datas.get("orderNumData");
		String selectOrderId = datas.get("orderIdData");
				
		// productVO�� ������ �߰�
		vo.setOrder_num(Integer.parseInt(selectOrderGroupId.replaceAll("\"", "")));
		vo.setOrder_id(Integer.parseInt(selectOrderId.replaceAll("\"", "")));
		vo.setSeller_id((int) session.getAttribute("seller_id"));

		// DB�� ���� ����Ʈ ���� �� �迭�� ����
		List<ProductVO> orderDetailList = (sellerOrderService.selectOrderDetailData(vo)); // �ش� �׷��ֹ���ȣ�� �ֹ��� ����Ʈ
		ProductVO orderDetailPayment = (sellerOrderService.selectOrderDetailPayment(vo)); // �ش� �׷��ֹ���ȣ�� ��������
		
		// model�� �� ����
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderDetailPayment", orderDetailPayment);
		
		// ajax�� �κи� ����� jsp �ּ� ����
		return "seller-order-detail";
	}
	
	// ���õ� �ֹ��� ����Ʈ(�޴� ��޿�)
	@RequestMapping(value = "/selectOrderList.seller", method=RequestMethod.POST)
	public String selectOrderList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody ArrayList<String> datas) {	
		HttpSession session = request.getSession();
		
		// �ϳ��� ��µ� �ֹ��� ����Ʈ�� ������ ����
		List<ProductVO> selectOrderList = new ArrayList<ProductVO>();
		
		// �Ѱܹ��� order_id �迭�� �ϳ��� �̰� ������ ó��
		for(String selectOrderId : datas) {
			vo.setOrder_id(Integer.parseInt(selectOrderId));
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			selectOrderList.add(sellerOrderService.selectOrderListModal(vo));
		}

		// model�� �� ����
		model.addAttribute("selectOrderList", selectOrderList);
		
		// ajax�� �κи� ����� jsp �ּ� ����
		return "seller-order-selectList";
	}
	
	// ����ó��
	@ResponseBody
	@RequestMapping(value = "/orderCheckUpdate.seller", method=RequestMethod.POST)
	public String orderCheckUpdate(HttpServletRequest request, Model model, ProductVO vo, @RequestBody ArrayList<String> datas) {	
		HttpSession session = request.getSession();
		
		// �ֹ��� ���°� '�����Ϸ�'�� �ƴҰ�� ���� ó��
		for(String selectOrderId : datas) {
			vo.setOrder_id(Integer.parseInt(selectOrderId));
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			ProductVO orderStatus = sellerOrderService.selectOrderListModal(vo);
			if(!orderStatus.getOrder_status().equals("�����Ϸ�")) {
				return "fail";
			}
		}
		
		// �Ѱܹ��� order_id �迭�� �ϳ��� �̰� ������ ó��
		for(String selectOrderId : datas) {
			vo.setOrder_id(Integer.parseInt(selectOrderId));
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			sellerOrderService.updateOrderCheck(vo);
		}
		
		return "success";
	}
	
	// �߼�ó��
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
		try { // ���ڰ� �ƴ� ���� �� ��� ����ó��
			invoice = Integer.valueOf(((String) datas.get("invoice")).trim());
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return "fail4";
		}
		
		// �ֹ��� ���°� '����غ���'�� �ƴҰ�� ���� ó��
		for(String selectOrderId : selectOrderIdList) {
			vo.setOrder_id(Integer.parseInt(selectOrderId));
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			ProductVO orderStatus = sellerOrderService.selectOrderListModal(vo);
			if(!orderStatus.getOrder_status().equals("����غ���")) {
				return "fail1";
			}
		}

		// ���� �׷��ֹ���ȣ���� ����
		for(int i=1; i < selectOrderNumList.size(); i++) {
			if(!selectOrderNumList.get(0).equals(selectOrderNumList.get(i))) {
				return "fail2";
			}
		}
		
		// �Ѱܹ��� order_id �迭�� �ϳ��� �̰� ������ ó��
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
