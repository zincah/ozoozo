package ozo.spring.house.seller.controller;

import javax.servlet.http.HttpSession;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.vo.CategoryVO;

@Controller
public class SellerController {
	
	@Autowired
	CategoryService categoryService;
	
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
			List<CategoryVO> cateList = categoryService.getCategoryList(vo);
			model.addAttribute("cateList", cateList);	
			return "seller-productManagement";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/order.seller")
	public String sellerOrder(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
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
