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

import org.json.simple.JSONArray;
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
public class S_SalesController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	SellerSalesService sellerSalesService;
	
	// ���� �˻�
	@RequestMapping(value = "/getSearchSalesList.seller", method=RequestMethod.POST)
	public String getSearchSalesList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody Map<String, String> datas) throws ParseException {	
		System.err.println("[Log] --- S_Sales 	Controller >>>>> getSearchSalesList 	Method");
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
		List<String> dateList = new ArrayList<String>(); // areaChart
		List<Integer> countList = new ArrayList<Integer>(); // areaChart
		List<String> barDateList = new ArrayList<String>(); // barChart
		List<Integer> barCountList = new ArrayList<Integer>(); // barChart
		
		// ���� ����Ʈ ������ ����
		List<ProductVO> salesList = new ArrayList<ProductVO>();
		// ������ ���� �ӽ� ����
		ProductVO tempData = new ProductVO();
		
		// VO�� seller id ����
		vo.setSeller_id((int) session.getAttribute("seller_id"));
		
		// VO�� barChart�� ��¥ ����
		Timestamp barMinDate = new Timestamp(calMin.getTimeInMillis());
		Timestamp barMaxDate = new Timestamp(calMax.getTimeInMillis());
		vo.setSales_startDate(barMinDate);
		vo.setSales_endDate(barMaxDate);
		
		// ����~������ ��¥ ���� �ݺ�
		while(true) { 
			
			// Calendar�� Timestamp�� ��ȯ
			Timestamp date = new Timestamp(calMax.getTimeInMillis());
			
			// vo ����
			vo.setSales_date(date);
			
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
		
		// barChart
		// �Ǹŷ� ����Ʈ ������ ���� ����
		List<ProductVO> barChartTotalList = sellerSalesService.selectBarChartTotalList(vo);
		// �ݺ������� �ʿ��� ������ �̾Ƽ� �� ������ ����
		for(int index = 0; index < barChartTotalList.size(); index++) {
			barDateList.add(index, barChartTotalList.get(index).getProduct_title());
			barCountList.add(index, barChartTotalList.get(index).getSales_count());
		}
		
		// �������� ��迭
		Collections.reverse(countList);
		Collections.reverse(dateList);
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
		
		// ajax�� �κи� ����� jsp �ּ� ����
		return "seller-salesManagement-List";
	}
	
	// ���� �� ��ȸ
	@RequestMapping(value = "/getSalesDatailView.seller", method=RequestMethod.POST)
	public String getSalesDatailView(HttpServletRequest request, Model model, ProductVO vo, @RequestBody String datas) throws ParseException {	
		System.err.println("[Log] --- S_Sales 	Controller >>>>> getSalesDatailView 	Method");
		HttpSession session = request.getSession();
		
		// VO ����
		vo.setSeller_id((int) session.getAttribute("seller_id"));
		vo.setSales_dateString(Date.valueOf(datas.replaceAll("\"", "")));
		
		// ���� ����Ʈ ������ ����
		List<ProductVO> salesList = sellerSalesService.selectSalesDetailList(vo);
		
		// model�� �� ����
		model.addAttribute("salesDetailListView", salesList);

		// ajax�� �κи� ����� jsp �ּ� ����
		return "seller-salesManagement-detail";
	}
}
