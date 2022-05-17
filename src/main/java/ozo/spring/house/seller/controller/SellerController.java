package ozo.spring.house.seller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.service.SellerOrderService;
import ozo.spring.house.seller.service.SellerPostingService;
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
	
	@RequestMapping(value = "/index.seller")
	public String sellerIndex(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
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
			model.addAttribute("orderStatus4", orderListView.stream().filter(list -> list.getOrder_status().equals("교환")).count());
			model.addAttribute("orderStatus5", orderListView.stream().filter(list -> list.getOrder_status().equals("반품")).count());
			model.addAttribute("orderStatus6", orderListView.stream().filter(list -> list.getOrder_status().equals("환불")).count());
			model.addAttribute("orderStatus7", orderListView.stream().filter(list -> list.getOrder_status().equals("주문취소")).count());
			
			return "seller-order";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/salesManagement.seller")
	public String sellerSalesManagement(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
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
