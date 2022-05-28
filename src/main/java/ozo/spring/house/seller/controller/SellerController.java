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

import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.service.SellerIndexService;
import ozo.spring.house.seller.service.SellerOrderService;
import ozo.spring.house.seller.service.SellerPostingService;
import ozo.spring.house.seller.service.SellerSalesService;
import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class SellerController {
	
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
	
	@RequestMapping(value = "/index.seller")
	public String sellerIndex(HttpServletRequest request, ProductVO vo, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			
			// vo에 seller_id 세팅
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			// 화면에 뿌릴 데이터 받아오기
			ProductVO data = sellerIndexService.selectViewData(vo);
			// model에 데이터 추가
			model.addAttribute("data", data);
			
			// 차트관련도 해야함 ㅋㅋㅋㅌㅋㅋㅋㄴ모ㅓㅗㅇ터코처
			
			return "index";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/insertProduct.seller")
	public String sellerInsertProduct(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			return "seller-insertProduct";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/productManagement.seller", method=RequestMethod.GET)
	public String sellerProductManagement(HttpServletRequest request, CategoryVO vo, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			// 카테고리 목록 불러오기
			List<CategoryVO> cateList = categoryService.getCategoryList(vo);
			model.addAttribute("cateList", cateList);
			
			// 상품 목록 불러오기
			List<ProductVO> productList = productService.selectProduct((int) session.getAttribute("seller_id"));
			// 상품 목록(테이블 출력용) 불러오기
			List<ProductVO> productListView = productService.selectProductView((int) session.getAttribute("seller_id"));
			
			System.out.println("============## productList ##============");
			for(ProductVO list : productList) {
				System.out.println(list);
			}
			System.out.println("============## productListView ##============");
			for(ProductVO list : productListView) {
				System.out.println(list);
			}
			
			model.addAttribute("productList", productList);
			model.addAttribute("productStatus0", productList.stream().filter(list -> list.getStatus().equals("판매대기")).count());
			model.addAttribute("productStatus1", productList.stream().filter(list -> list.getStatus().equals("판매중")).count());
			model.addAttribute("productStatus2", productList.stream().filter(list -> list.getStatus().equals("품절")).count());
			model.addAttribute("productStatus3", productList.stream().filter(list -> list.getStatus().equals("승인대기")).count());
			model.addAttribute("productStatus4", productList.stream().filter(list -> list.getStatus().equals("판매중지")).count());
			model.addAttribute("productStatus5", productList.stream().filter(list -> list.getStatus().equals("판매종료")).count());
			model.addAttribute("productStatus6", productList.stream().filter(list -> list.getStatus().equals("판매금지")).count());
			model.addAttribute("productListView", productListView);
			return "seller-productManagement";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/productPostingManagement.seller", method=RequestMethod.GET)
	public String sellerProductPostingManagement(HttpServletRequest request, CategoryVO cvo, Model model, ProductVO vo) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			// 카테고리 목록 불러오기
			List<CategoryVO> cateList = categoryService.getCategoryList(cvo);
			model.addAttribute("cateList", cateList);
			
			// 게시글 목록 불러오기
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			List<ProductVO> postingListView = sellerPostingService.selectPostingList(vo);

			model.addAttribute("postingListView", postingListView);
			model.addAttribute("postingStatus0", postingListView.stream().filter(list -> list.getPost_status().equals("판매중")).count());
			model.addAttribute("postingStatus1", postingListView.stream().filter(list -> list.getPost_status().equals("판매종료")).count());
			model.addAttribute("postingStatus2", postingListView.stream().filter(list -> list.getPost_status().equals("승인대기")).count());
			model.addAttribute("postingStatus3", postingListView.stream().filter(list -> list.getPost_status().equals("보류")).count());
			
			return "seller-productPostingManagement";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/order.seller", method=RequestMethod.GET)
	public String sellerOrder(HttpServletRequest request, CategoryVO cvo, Model model, ProductVO vo) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			// 카테고리 목록 불러오기
			List<CategoryVO> cateList = categoryService.getCategoryList(cvo);
			model.addAttribute("cateList", cateList);
			
			// 주문 목록 불러오기
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			List<ProductVO> orderListView = sellerOrderService.selectOrderList(vo);

			model.addAttribute("orderListView", orderListView);
			model.addAttribute("orderStatus0", orderListView.stream().filter(list -> list.getOrder_status().equals("결제완료")).count());
			model.addAttribute("orderStatus1", orderListView.stream().filter(list -> list.getOrder_status().equals("배송준비중")).count());
			model.addAttribute("orderStatus2", orderListView.stream().filter(list -> list.getOrder_status().equals("배송중")).count());
			model.addAttribute("orderStatus3", orderListView.stream().filter(list -> list.getOrder_status().equals("배송완료")).count());
			model.addAttribute("orderStatus4", orderListView.stream().filter(list -> list.getOrder_status().equals("구매확정")).count());
			model.addAttribute("orderStatus5", orderListView.stream().filter(list -> list.getOrder_status().equals("교환")).count());
			model.addAttribute("orderStatus6", orderListView.stream().filter(list -> list.getOrder_status().equals("반품")).count());
			model.addAttribute("orderStatus7", orderListView.stream().filter(list -> list.getOrder_status().equals("환불처리")).count());
			model.addAttribute("orderStatus8", orderListView.stream().filter(list -> list.getOrder_status().equals("주문취소")).count());
			
			return "seller-order";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/salesManagement.seller", method=RequestMethod.GET)
	public String sellerSalesManagement(HttpServletRequest request, Model model, ProductVO vo) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			
			// 날짜 데이터 처리
			// 마지막 날짜 Calendar 변수 생성
			Calendar calMin = Calendar.getInstance();
			Calendar calMax = Calendar.getInstance();
			// 데이터 포맷 생성
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			// 날짜를 Calendar 변수에 저장
			calMin.set(Calendar.DAY_OF_MONTH, calMin.getActualMinimum(Calendar.DAY_OF_MONTH));
			calMax.set(Calendar.DAY_OF_MONTH, calMax.getActualMaximum(Calendar.DAY_OF_MONTH));
			// 날짜를 String 값으로 저장
			String calMinText = formatter.format(calMin.getTime());
			String calMaxText = formatter.format(calMax.getTime());
			// 모델에 날짜 텍스트 값 저장
			model.addAttribute("calMinText", calMinText);
			model.addAttribute("calMaxText", calMaxText);
			
			// 차트에 출력할 데이터 저장할 변수
			List<String> dateList = new ArrayList<String>(); // areaChart
			List<Integer> countList = new ArrayList<Integer>(); // areaChart
			List<String> barDateList = new ArrayList<String>(); // barChart
			List<Integer> barCountList = new ArrayList<Integer>(); // barChart
			
			// 매출 리스트 저장할 변수
			List<ProductVO> salesList = new ArrayList<ProductVO>();
			// 검증을 위해 임시 저장할 변수
			ProductVO tempData = new ProductVO();
			
			// VO에 seller id 세팅
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			
			// VO에 barChart용 날짜 세팅
			Timestamp barMinDate = new Timestamp(calMin.getTimeInMillis());
			Timestamp barMaxDate = new Timestamp(calMax.getTimeInMillis());
			vo.setSales_startDate(barMinDate);
			vo.setSales_endDate(barMaxDate);
			
			// areaChart - 당월 1일부터 마지막 날짜까지 반복
			while(true) { 
				
				// 데이터 처리
				Timestamp date = new Timestamp(calMax.getTimeInMillis());
				vo.setSales_date(date);
				
				tempData = sellerSalesService.selectSalesList(vo);
				
				// 차트용 데이터 저장
				dateList.add("\"" + calMaxText.substring(5,10) + "\"");
				countList.add(tempData.getSales_final());
				
				// 판매이익이 0이 아닐 경우에만 저장
				if (tempData.getSales_final()!=0) {
					salesList.add(tempData);
				}
				
				// 1일 더하고 값 업데이트
				calMax.add(Calendar.DATE, -1);
				calMaxText = formatter.format(calMax.getTime());
				
				// 해당 월 첫번째 날짜와 값이 일치하면 종료 (최신순 정렬)
				if(calMaxText.equals(calMinText)) {
					break;
				}
			}
			
			// barChart
			// 판매량 리스트 저장할 변수 생성
			List<ProductVO> barChartTotalList = sellerSalesService.selectBarChartTotalList(vo);
			// 반복문으로 필요한 데이터 뽑아서 각 변수에 저장
			for(int index = 0; index < barChartTotalList.size(); index++) {
				barDateList.add(index, barChartTotalList.get(index).getProduct_title());
				barCountList.add(index, barChartTotalList.get(index).getSales_count());
			}
			
			// 역순으로 재배열
			Collections.reverse(dateList); 
			Collections.reverse(countList);
			Collections.reverse(barDateList);
			Collections.reverse(barCountList);
			
			// model에 값 저장
			model.addAttribute("salesListView", salesList);
			model.addAttribute("dateList", dateList);
			model.addAttribute("countList", countList);
			String jsonArray = JSONArray.toJSONString(barDateList);
			model.addAttribute("barDateList", jsonArray);
			model.addAttribute("barCountList", barCountList);
			
			// 리스트 매출의 최대값 저장
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
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			return "seller-review";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/notice.seller")
	public String sellerNotice(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			return "seller-notice";
		}else {
			return "seller-login";
		}
	}
}
