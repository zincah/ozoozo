package ozo.spring.house.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.admin.service.AdminProductManageService;
import ozo.spring.house.admin.vo.PostingInfoVO;
import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.seller.vo.ProductDetailVO;

@Controller
public class A_PostingInfoController { // posting �� ���� (�Űܾ��ҵ�:))
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService sellerproductService;
	
	@Autowired
	AdminProductManageService productService;
	
	@RequestMapping(value = "/postingInfo.admin", method=RequestMethod.GET)
	public String postingInfoView(CategoryVO vo, Model model, HttpServletRequest request) {
		System.err.println("[Log] --- PostingInfo 	Controller >>>>> postingInfoView 	Method");
		HttpSession session = request.getSession();

		if(session.getAttribute("admincode")!=null) {
			
			int postcode = Integer.parseInt((String)request.getParameter("postcode")); // get ������� ��û�� post_id 

			/* ��ǰ ���� ���� */
			PostingInfoVO pvo = productService.postInfo(postcode);
			List<Map<String, String>> productlist = pvo.getProductlist();
			
			Map<String, String> product = productlist.get(0); // ����Ʈ �� ù��°�� �����ͼ� ����� ���� ����
			List<Integer> optionnums = pvo.getOptionnums(); // ���õ� �ɼ� �����ֱ�
			ProductDetailVO detail = pvo.getDetail(); // ������ ���̺� ���� �Ѹ���
			List<Map<String, String>> photolist = pvo.getPhotolist(); // ���ε�� ���� ����Ʈ
			
			/* ī�װ� ���� */
			List<CategoryVO> cateList = categoryService.getCategoryList(vo);
			
			int su = Integer.parseInt(String.valueOf(product.get("po_category")));
			vo.setCate_code(su);
			List<List<FilterVO>> wholeList = categoryService.getFilterOption(vo); // �� ī�װ��� filter
			
			model.addAttribute("cateList", cateList);	
			model.addAttribute("productlist", productlist);
			model.addAttribute("wholeList", wholeList);
			model.addAttribute("optionnums", optionnums); 
			model.addAttribute("detail", detail);
			model.addAttribute("photolist", photolist);

			return "postingInfo";
		}else {
			return "adminLogin_dj";
		}
	}

	
	

}
