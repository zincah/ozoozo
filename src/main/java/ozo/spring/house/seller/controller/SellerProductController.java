package ozo.spring.house.seller.controller;

import java.util.ArrayList;
import java.util.List;

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
	
	@ResponseBody
	@RequestMapping(value = "/selectProductList.seller", method=RequestMethod.POST)
	public String selectProductList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody ArrayList<String> listProductId) {
		HttpSession session = request.getSession();
		List<ProductVO> productListView = new ArrayList<>();
		if(session.getAttribute("seller")!=null) {
			for(String productId : listProductId) {
				vo.setProduct_id(Integer.parseInt(productId));
				productListView.add((ProductVO) productService.selectSelectProductList(vo));
			}
			model.addAttribute("productListView", productListView);
			return "seller-productManagement";
		}else {
			return "seller-login";
		}
	}
}
