package ozo.spring.house.seller.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
	@RequestMapping(value = "/productPostingManagement.seller", method=RequestMethod.GET)
	public String sellerProductPostingManagement(HttpServletRequest request, CategoryVO cvo, Model model, ProductVO vo) {
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
			model.addAttribute("orderStatus7", orderListView.stream().filter(list -> list.getOrder_status().equals("ȯ��")).count());
			model.addAttribute("orderStatus8", orderListView.stream().filter(list -> list.getOrder_status().equals("�ֹ����")).count());
			
			return "seller-order";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/salesManagement.seller", method=RequestMethod.GET)
	public String sellerSalesManagement(HttpServletRequest request, Model model, ProductVO vo) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			
			// ���� ���� ��¥ ���ϱ�
			Calendar calMax = Calendar.getInstance();
			calMax.set(Calendar.DAY_OF_MONTH, calMax.getActualMaximum(Calendar.DAY_OF_MONTH));
			Calendar calMin = Calendar.getInstance();
			calMin.set(Calendar.DAY_OF_MONTH, calMin.getActualMinimum(Calendar.DAY_OF_MONTH));
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String calMaxText = formatter.format(calMax.getTime());
			String calMinText = formatter.format(calMin.getTime());
			model.addAttribute("calMinText", calMinText);
			model.addAttribute("calMaxText", calMaxText);
			
			// ��Ʈ�� ����� ������ ������ ����
			List<String> dateList = new ArrayList<String>();
			List<Integer> countList = new ArrayList<Integer>();
			
			// ���� ����Ʈ ������ ����
			List<ProductVO> salesList = new ArrayList<ProductVO>();
			// ������ ���� �ӽ� ������ ����
			ProductVO tempData = new ProductVO();
			
			// ��� 1�Ϻ��� ������ ��¥���� �ݺ�
			while(!calMaxText.equals(calMinText)) { // �ش� �� ù��° ��¥�� ���� ��ġ�ϸ� ���� (�ֽż� ����)
				
				// ������ ó��
				Timestamp date = new Timestamp(calMax.getTimeInMillis());
				vo.setSales_date(date);
				tempData = sellerSalesService.selectSalesList(vo);
				
				// ��Ʈ�� ������ ����
				//salesList.add();
				
				// �Ǹ������� 0�� �ƴ� ��쿡�� ����
				if (tempData.getSales_final()!=0) {
					salesList.add(tempData);
				}
				
				// 1�� ���ϰ� �� ������Ʈ
				calMax.add(Calendar.DATE, -1);
				calMaxText = formatter.format(calMax.getTime());
			}
			
			// model�� �� ����
			model.addAttribute("salesListView", salesList);
			
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
