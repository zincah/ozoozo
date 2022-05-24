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
	
	// 판매글 검색 컨트롤러
	@RequestMapping(value = "/getSearchSalesList.seller", method=RequestMethod.POST)
	public String getSearchProductList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody Map<String, String> datas) throws ParseException {	
		HttpSession session = request.getSession();
		
		// 날짜 데이터 처리
		// 마지막 날짜 Calendar 변수 생성
		Calendar calMin = Calendar.getInstance();
		Calendar calMax = Calendar.getInstance();
		// 데이터 포맷 생성
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 날짜를 Calendar 변수에 저장
		calMin.setTime(formatter.parse(datas.get("startDate")));
		calMax.setTime(formatter.parse(datas.get("endDate")));
		// 날짜를 String 값으로 저장
		String calMinText = formatter.format(calMin.getTime());
		String calMaxText = formatter.format(calMax.getTime());
		// 모델에 날짜 텍스트 값 저장
		model.addAttribute("calMinText", calMinText);
		model.addAttribute("calMaxText", calMaxText);

		// 차트에 출력할 데이터 저장할 변수
		List<String> dateList = new ArrayList<String>();
		List<Integer> countList = new ArrayList<Integer>();
		
		// 매출 리스트 저장할 변수
		List<ProductVO> salesList = new ArrayList<ProductVO>();
		// 검증을 위한 임시 변수
		ProductVO tempData = new ProductVO();
		
		// 시작~마지막 날짜 까지 반복
		while(true) { 
			
			// Calendar를 Timestamp로 변환
			Timestamp date = new Timestamp(calMax.getTimeInMillis());
			
			// vo 셋팅
			vo.setSales_date(date);
			vo.setSeller_id((int) session.getAttribute("seller_id"));
			
			// 임시변수에 데이터 저장
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
		
		// 역순으로 재배열
		Collections.reverse(countList);
		Collections.reverse(dateList);
		
		// model에 값 저장
		model.addAttribute("salesListView", salesList);
		model.addAttribute("dateList", dateList);
		model.addAttribute("countList", countList);
		
		// 리스트 매출의 최대값 저장
		int maxCount = Collections.max(countList);
		model.addAttribute("maxCount", maxCount);
		
		// ajax로 부분만 띄워줄 jsp 주소 리턴
		return "seller-salesManagement-List";
	}
}
