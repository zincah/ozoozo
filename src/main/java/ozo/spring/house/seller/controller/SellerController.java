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
import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class SellerController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;
	
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
			// ī�װ� ��� �ҷ�����
			List<CategoryVO> cateList = categoryService.getCategoryList(vo);
			model.addAttribute("cateList", cateList);
			
			// ��ǰ ��� �ҷ�����
			List<ProductVO> productList = productService.selectProduct((int) session.getAttribute("seller_id"));
			// ��ǰ ���(���̺� ��¿�) �ҷ�����
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
			model.addAttribute("productStatus0", productList.stream().filter(list -> list.getStatus().equals("�ǸŴ��")).count());
			model.addAttribute("productStatus1", productList.stream().filter(list -> list.getStatus().equals("�Ǹ���")).count());
			model.addAttribute("productStatus2", productList.stream().filter(list -> list.getStatus().equals("ǰ��")).count());
			model.addAttribute("productStatus3", productList.stream().filter(list -> list.getStatus().equals("���δ��")).count());
			model.addAttribute("productStatus4", productList.stream().filter(list -> list.getStatus().equals("�Ǹ�����")).count());
			model.addAttribute("productStatus5", productList.stream().filter(list -> list.getStatus().equals("�Ǹ�����")).count());
			model.addAttribute("productStatus6", productList.stream().filter(list -> list.getStatus().equals("�Ǹű���")).count());
			model.addAttribute("productListView", productListView);
			return "seller-productManagement";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/order.seller", method=RequestMethod.GET)
	public String sellerOrder(HttpServletRequest request, CategoryVO vo, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			List<CategoryVO> cateList = categoryService.getCategoryList(vo);
			model.addAttribute("cateList", cateList);
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
