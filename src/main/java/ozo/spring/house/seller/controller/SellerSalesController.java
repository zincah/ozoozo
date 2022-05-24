package ozo.spring.house.seller.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
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

import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.SellerSalesService;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class SellerSalesController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	SellerSalesService sellerSalesService;
	
	// �Ǹű� �˻� ��Ʈ�ѷ�
	@RequestMapping(value = "/getSearchSalesList.seller", method=RequestMethod.POST)
	public String getSearchProductList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody Map<String, String> datas) throws ParseException {	
		HttpSession session = request.getSession();
		
		// ��¥ ������ ó��
		// ������ ��¥ Calendar ���� ����
		Calendar calMin = Calendar.getInstance();
		Calendar calMax = Calendar.getInstance();
		// ������ ���� ����
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// ��¥�� Calendar ������ ����
		calMin.setTime(formatter.parse(datas.get("startDate")));
		calMax.setTime(formatter.parse(datas.get("endDate")));
		// ��¥�� String ������ ����
		String calMinText = formatter.format(calMin.getTime());
		String calMaxText = formatter.format(calMax.getTime());
		// �𵨿� ��¥ �ؽ�Ʈ �� ����
		model.addAttribute("calMinText", calMinText);
		model.addAttribute("calMaxText", calMaxText);

		// ��Ʈ�� ����� ������ ������ ����
		List<String> dateList = new ArrayList<String>();
		List<Integer> countList = new ArrayList<Integer>();
		
		// ���� ����Ʈ ������ ����
		List<ProductVO> salesList = new ArrayList<ProductVO>();
		// ������ ���� �ӽ� ����
		ProductVO tempData = new ProductVO();
		
		// ����~������ ��¥ ���� �ݺ�
		while(true) { 
			
			// Calendar�� Timestamp�� ��ȯ
			Timestamp date = new Timestamp(calMax.getTimeInMillis());
			
			// vo ����
			vo.setSales_date(date);
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			
			// �ӽú����� ������ ����
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
		
		// �������� ��迭
		Collections.reverse(countList);
		Collections.reverse(dateList);
		
		// model�� �� ����
		model.addAttribute("salesListView", salesList);
		model.addAttribute("dateList", dateList);
		model.addAttribute("countList", countList);
		
		// ����Ʈ ������ �ִ밪 ����
		int maxCount = Collections.max(countList);
		model.addAttribute("maxCount", maxCount);
		
		// ajax�� �κи� ����� jsp �ּ� ����
		return "seller-salesManagement-List";
	}
}
