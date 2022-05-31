package ozo.spring.house.seller.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.common.Criteria;
import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.service.SellerIndexService;
import ozo.spring.house.seller.service.SellerOrderService;
import ozo.spring.house.seller.service.SellerPostingService;
import ozo.spring.house.seller.service.SellerSalesService;
import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class S_Controller {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;
	@Autowired
	SellerPostingService sellerPostingService;
	@Autowired
	SellerOrderService sellerOrderService;
	@Autowired
	SellerSalesService sellerSalesService;
	@Autowired
	SellerIndexService sellerIndexService;
	
	@RequestMapping(value = "/index.seller", method=RequestMethod.GET)
	public String sellerIndex(HttpServletRequest request, ProductVO vo, Model model) {
		System.err.println("[Log] --- Seller 	Controller >>>>> sellerIndex 	Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			
			// vo�� seller_id ����
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			// ȭ�鿡 �Ѹ� ������ �޾ƿ���
			ProductVO data = sellerIndexService.selectViewData(vo);
			// model�� ������ �߰�
			model.addAttribute("data", data);
			System.out.println(data);
			
			// ��Ʈ����
			// ��¥ ������ ó��
			// ������ ��¥ Calendar ���� ����
			Calendar calMin = Calendar.getInstance();
			Calendar calMax = Calendar.getInstance();
			
			// ������ ���� ����
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			// ��¥�� Calendar ������ ����
			calMin.set(Calendar.DAY_OF_MONTH, calMin.getActualMinimum(Calendar.DAY_OF_MONTH));
			calMax.set(Calendar.DAY_OF_MONTH, calMax.getActualMaximum(Calendar.DAY_OF_MONTH));
			
			// ��¥�� String ������ ����
			String calMinText = formatter.format(calMin.getTime());
			String calMaxText = formatter.format(calMax.getTime());
			
			// �𵨿� ��¥ �ؽ�Ʈ �� ����
			model.addAttribute("calMinText", calMinText);
			model.addAttribute("calMaxText", calMaxText);
			
			// ��Ʈ�� ����� ������ ������ ����
			List<String> dateList = new ArrayList<String>(); // areaChart
			List<Integer> countList = new ArrayList<Integer>(); // areaChart
			List<String> barDateList = new ArrayList<String>(); // barChart
			List<Integer> barCountList = new ArrayList<Integer>(); // barChart
			
			// VO�� barChart�� ��¥ ����
			Timestamp barMinDate = new Timestamp(calMin.getTimeInMillis());
			Timestamp barMaxDate = new Timestamp(calMax.getTimeInMillis());
			vo.setSales_startDate(barMinDate);
			vo.setSales_endDate(barMaxDate);
			
			// ���� ����Ʈ ������ ����
			List<ProductVO> salesList = new ArrayList<ProductVO>();
			
			// ������ ���� �ӽ� ������ ����
			ProductVO tempData = new ProductVO();
			
			// areaChart - ��� 1�Ϻ��� ������ ��¥���� �ݺ�
			while(true) { 
				
				// ������ ó��
				Timestamp date = new Timestamp(calMax.getTimeInMillis());
				vo.setSales_date(date);
				
				tempData = sellerSalesService.selectSalesList(vo);
				
				// ��Ʈ�� ������ ����
				dateList.add("\"" + calMaxText.substring(5,10) + "\"");
				countList.add(tempData.getSales_final());
				
				// �Ǹ������� 0�� �ƴ� ��쿡�� ����
				if (tempData.getSales_final()!=0) {
					salesList.add(tempData);
				}
				
				// 1�� ���ϰ� �� ������Ʈ
				calMax.add(Calendar.DATE, -1);
				calMaxText = formatter.format(calMax.getTime());
				
				// �ش� �� ù��° ��¥�� ���� ��ġ�ϸ� ���� (�ֽż� ����)
				if(calMaxText.equals(calMinText)) {
					break;
				}
			}
			
			// barChart
			// �Ǹŷ� ����Ʈ ������ ���� ����
			List<ProductVO> barChartTotalList = sellerSalesService.selectBarChartTotalList(vo);
			// �ݺ������� �ʿ��� ������ �̾Ƽ� �� ������ ����
			for(int index = 0; index < barChartTotalList.size(); index++) {
				barDateList.add(index, barChartTotalList.get(index).getProduct_title());
				barCountList.add(index, barChartTotalList.get(index).getSales_count());
			}
			
			// �������� ��迭
			Collections.reverse(dateList); 
			Collections.reverse(countList);
			Collections.reverse(barDateList);
			Collections.reverse(barCountList);
			
			// model�� �� ����
			model.addAttribute("salesListView", salesList);
			model.addAttribute("dateList", dateList);
			model.addAttribute("countList", countList);
			String jsonArray = JSONArray.toJSONString(barDateList);
			model.addAttribute("barDateList", jsonArray);
			model.addAttribute("barCountList", barCountList);
			
			// ����Ʈ ������ �ִ밪 ����
			int maxCount = Collections.max(countList);
			model.addAttribute("maxCount", maxCount);
			int barMaxCount = Collections.max(barCountList);
			model.addAttribute("barMaxCount", barMaxCount);
			
			return "index";
		}else {
			return "seller-login";
		}
	}
	
	/* ��ǰ ��� ������ */
	@RequestMapping(value = "/insertProduct.seller", method=RequestMethod.GET) 
	public String test(CategoryVO vo, Model model, HttpServletRequest request) {
		System.err.println("[Log] --- Seller 	Controller >>>>> test 			Method");
		HttpSession session = request.getSession(); // session ����
		
		if(session.getAttribute("seller")!=null) {
			
			List<CategoryVO> cateList = categoryService.getCategoryList(vo); // ��з� ī�װ� ����
			model.addAttribute("cateList", cateList);	
			
			vo.setCate_code(1); // ó���� ������ ����
			List<List<FilterVO>> wholeList = categoryService.getFilterOption(vo); // �ɼ� ��������
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
	
	/* ��ǰ���� ������ */
	@RequestMapping(value = "/productManagement.seller", method=RequestMethod.GET)
	public String sellerProductManagement(HttpServletRequest request, CategoryVO vo, Criteria cri, ProductVO pvo, Model model) {
		System.err.println("[Log] --- Seller 	Controller >>>>> sellerProductManagement Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			
			// ����¡(new Criteria())
			pvo.setCri(cri); 
			pvo.setSeller_id((int) session.getAttribute("seller_id"));
			
			// ī�װ� ��� �ҷ�����
			List<CategoryVO> cateList = categoryService.getCategoryList(vo);
			model.addAttribute("cateList", cateList);
			
			// ��ǰ ��� �ҷ�����
			List<ProductVO> productListView = productService.selectProductView(pvo);
			
			// �� ��ǰ����Ʈ count
			int total = productService.selectListCount(pvo);
			
			model.addAttribute("productStatus0", productListView.stream().filter(list -> list.getStatus().equals("�ǸŴ��")).count());
			model.addAttribute("productStatus1", productListView.stream().filter(list -> list.getStatus().equals("�Ǹ���")).count());
			model.addAttribute("productStatus2", productListView.stream().filter(list -> list.getStatus().equals("ǰ��")).count());
			model.addAttribute("productStatus3", productListView.stream().filter(list -> list.getStatus().equals("���δ��")).count());
			model.addAttribute("productStatus4", productListView.stream().filter(list -> list.getStatus().equals("�Ǹ�����")).count());
			model.addAttribute("productStatus5", productListView.stream().filter(list -> list.getStatus().equals("�Ǹ�����")).count());
			model.addAttribute("productStatus6", productListView.stream().filter(list -> list.getStatus().equals("�Ǹű���")).count());
			model.addAttribute("productListView", productListView);
			model.addAttribute("pageMaker", cri);
			model.addAttribute("totalcount", total);
			
			return "seller-productManagement";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/productPostingManagement.seller", method=RequestMethod.GET)
	public String sellerProductPostingManagement(HttpServletRequest request, CategoryVO cvo, Model model, ProductVO vo) {
		System.err.println("[Log] --- Seller 	Controller >>>>> sellerProductPostingManagement 	Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			// ī�װ� ��� �ҷ�����
			List<CategoryVO> cateList = categoryService.getCategoryList(cvo);
			model.addAttribute("cateList", cateList);
			
			// �Խñ� ��� �ҷ�����
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			List<ProductVO> postingListView = sellerPostingService.selectPostingList(vo);

			model.addAttribute("postingListView", postingListView);
			model.addAttribute("postingStatus0", postingListView.stream().filter(list -> list.getPost_status().equals("�Ǹ���")).count());
			model.addAttribute("postingStatus1", postingListView.stream().filter(list -> list.getPost_status().equals("�Ǹ�����")).count());
			model.addAttribute("postingStatus2", postingListView.stream().filter(list -> list.getPost_status().equals("���δ��")).count());
			model.addAttribute("postingStatus3", postingListView.stream().filter(list -> list.getPost_status().equals("����")).count());
			
			return "seller-productPostingManagement";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/order.seller", method=RequestMethod.GET)
	public String sellerOrder(HttpServletRequest request, CategoryVO cvo, Model model, ProductVO vo) {
		System.err.println("[Log] --- Seller 	Controller >>>>> sellerProductPostingManagement 	Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			// ī�װ� ��� �ҷ�����
			List<CategoryVO> cateList = categoryService.getCategoryList(cvo);
			model.addAttribute("cateList", cateList);
			
			// �ֹ� ��� �ҷ�����
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			List<ProductVO> orderListView = sellerOrderService.selectOrderList(vo);

			model.addAttribute("orderListView", orderListView);
			model.addAttribute("orderStatus0", orderListView.stream().filter(list -> list.getOrder_status().equals("�����Ϸ�")).count());
			model.addAttribute("orderStatus1", orderListView.stream().filter(list -> list.getOrder_status().equals("����غ���")).count());
			model.addAttribute("orderStatus2", orderListView.stream().filter(list -> list.getOrder_status().equals("�����")).count());
			model.addAttribute("orderStatus3", orderListView.stream().filter(list -> list.getOrder_status().equals("��ۿϷ�")).count());
			model.addAttribute("orderStatus4", orderListView.stream().filter(list -> list.getOrder_status().equals("����Ȯ��")).count());
			model.addAttribute("orderStatus5", orderListView.stream().filter(list -> list.getOrder_status().equals("��ȯ")).count());
			model.addAttribute("orderStatus6", orderListView.stream().filter(list -> list.getOrder_status().equals("��ǰ")).count());
			model.addAttribute("orderStatus7", orderListView.stream().filter(list -> list.getOrder_status().equals("ȯ��ó��")).count());
			model.addAttribute("orderStatus8", orderListView.stream().filter(list -> list.getOrder_status().equals("�ֹ����")).count());
			
			return "seller-order";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/salesManagement.seller", method=RequestMethod.GET)
	public String sellerSalesManagement(HttpServletRequest request, Model model, ProductVO vo) {
		System.err.println("[Log] --- Seller 	Controller >>>>> sellerSalesManagement 		Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			
			// ��¥ ������ ó��
			// ������ ��¥ Calendar ���� ����
			Calendar calMin = Calendar.getInstance();
			Calendar calMax = Calendar.getInstance();
			// ������ ���� ����
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			// ��¥�� Calendar ������ ����
			calMin.set(Calendar.DAY_OF_MONTH, calMin.getActualMinimum(Calendar.DAY_OF_MONTH));
			calMax.set(Calendar.DAY_OF_MONTH, calMax.getActualMaximum(Calendar.DAY_OF_MONTH));
			// ��¥�� String ������ ����
			String calMinText = formatter.format(calMin.getTime());
			String calMaxText = formatter.format(calMax.getTime());
			// �𵨿� ��¥ �ؽ�Ʈ �� ����
			model.addAttribute("calMinText", calMinText);
			model.addAttribute("calMaxText", calMaxText);
			
			// ��Ʈ�� ����� ������ ������ ����
			List<String> dateList = new ArrayList<String>(); // areaChart
			List<Integer> countList = new ArrayList<Integer>(); // areaChart
			List<String> barDateList = new ArrayList<String>(); // barChart
			List<Integer> barCountList = new ArrayList<Integer>(); // barChart
			
			// ���� ����Ʈ ������ ����
			List<ProductVO> salesList = new ArrayList<ProductVO>();
			// ������ ���� �ӽ� ������ ����
			ProductVO tempData = new ProductVO();
			
			// VO�� seller id ����
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			
			// VO�� barChart�� ��¥ ����
			Timestamp barMinDate = new Timestamp(calMin.getTimeInMillis());
			Timestamp barMaxDate = new Timestamp(calMax.getTimeInMillis());
			vo.setSales_startDate(barMinDate);
			vo.setSales_endDate(barMaxDate);
			
			// areaChart - ��� 1�Ϻ��� ������ ��¥���� �ݺ�
			while(true) { 
				
				// ������ ó��
				Timestamp date = new Timestamp(calMax.getTimeInMillis());
				vo.setSales_date(date);
				
				tempData = sellerSalesService.selectSalesList(vo);
				
				// ��Ʈ�� ������ ����
				dateList.add("\"" + calMaxText.substring(5,10) + "\"");
				countList.add(tempData.getSales_final());
				
				// �Ǹ������� 0�� �ƴ� ��쿡�� ����
				if (tempData.getSales_final()!=0) {
					salesList.add(tempData);
				}
				
				// 1�� ���ϰ� �� ������Ʈ
				calMax.add(Calendar.DATE, -1);
				calMaxText = formatter.format(calMax.getTime());
				
				// �ش� �� ù��° ��¥�� ���� ��ġ�ϸ� ���� (�ֽż� ����)
				if(calMaxText.equals(calMinText)) {
					break;
				}
			}
			
			// barChart
			// �Ǹŷ� ����Ʈ ������ ���� ����
			List<ProductVO> barChartTotalList = sellerSalesService.selectBarChartTotalList(vo);
			// �ݺ������� �ʿ��� ������ �̾Ƽ� �� ������ ����
			for(int index = 0; index < barChartTotalList.size(); index++) {
				barDateList.add(index, barChartTotalList.get(index).getProduct_title());
				barCountList.add(index, barChartTotalList.get(index).getSales_count());
			}
			
			// �������� ��迭
			Collections.reverse(dateList); 
			Collections.reverse(countList);
			Collections.reverse(barDateList);
			Collections.reverse(barCountList);
			
			// model�� �� ����
			model.addAttribute("salesListView", salesList);
			model.addAttribute("dateList", dateList);
			model.addAttribute("countList", countList);
			String jsonArray = JSONArray.toJSONString(barDateList);
			model.addAttribute("barDateList", jsonArray);
			model.addAttribute("barCountList", barCountList);
			
			// ����Ʈ ������ �ִ밪 ����
			int maxCount = Collections.max(countList);
			model.addAttribute("maxCount", maxCount);
			int barMaxCount = Collections.max(barCountList);
			model.addAttribute("barMaxCount", barMaxCount);
			
			return "seller-salesManagement";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/review.seller")
	public String sellerReview(HttpServletRequest request) {
		System.err.println("[Log] --- Seller 	Controller >>>>> sellerReview 		Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			return "seller-review";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/notice.seller")
	public String sellerNotice(HttpServletRequest request) {
		System.err.println("[Log] --- Seller 	Controller >>>>> sellerNotice 		Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			return "seller-notice";
		}else {
			return "seller-login";
		}
	}
}
