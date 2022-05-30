package ozo.spring.house.admin.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.admin.service.AdminProductManageService;
import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.common.MakeDate;
import ozo.spring.house.common.PageDTO;

@Controller
public class AdminProductManageController {
	
	@Autowired
	AdminProductManageService productService;

	@Autowired
	MakeDate md; // 날짜 하루 더 하는 포맷팅
	
	/* 판매 게시글 관리 : productManagement */ 
	@RequestMapping(value="/movePaging.admin", method=RequestMethod.POST) // page 이동 (비동기)
	public String movePaging(@RequestBody Map<String, String> searchMap, Criteria cri, Model model, AdminProductVO pvo) {

		int pageNum = Integer.parseInt(searchMap.get("pageNum")); // 페이지 정보
		cri = new Criteria(pageNum, 10); // 페이징 처리
		pvo.setCri(cri);
		
		pvo.setPost_status(searchMap.get("posttype")); 
		pvo.setDeal_status(searchMap.get("dealtype"));
		pvo.setCate_name(searchMap.get("category"));
		pvo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		String enddate = searchMap.get("enddate"); // enddate에서 하루 더한 날짜를 넣어주기
		pvo.setEnddate(Date.valueOf(md.makedate(enddate))); 
		pvo.setPack(searchMap.get("pack"));
		pvo.setKeyword(searchMap.get("keyword"));
		
		List<AdminProductVO> postList = productService.getProductList(pvo); // 상품 리스트

		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.searchListCount(pvo));

		return "postList";
	}

	
	@RequestMapping(value="/updateProductStatus.admin", method=RequestMethod.POST) // 상품 상태 변경 (비동기)
	public String updateProductStatus(@RequestBody List<String> modifyInfo, AdminProductVO pvo, Model model, Criteria cri) {

		pvo.setPost_status(modifyInfo.get(modifyInfo.size()-1)); // 상품 상태 키워드
		
		for(int i=0; i<modifyInfo.size()-2; i++) { 
			pvo.setPost_id(Integer.parseInt(modifyInfo.get(i)));
			productService.updateProductStatus(pvo); // 상품 상태 변경
		}
		
		cri = new Criteria(Integer.parseInt(modifyInfo.get(modifyInfo.size()-2)), 10); // 페이징 처리
		AdminProductVO vo = new AdminProductVO();
		vo.setCri(cri);

		List<AdminProductVO> postList = productService.getProductList(vo);
		
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.searchListCount(vo));
		
		return "postList";
	}
	
	@RequestMapping(value="/updateCouponStatus.admin", method=RequestMethod.POST) // 쿠폰 적용 -> 상품(비동기)
	public String updateCouponStatus(@RequestBody List<String> couponInfo, AdminProductVO pvo, Model model, Criteria cri) {

		pvo.setPost_couponid(Integer.parseInt(couponInfo.get(couponInfo.size()-1))); // 쿠폰 아이디
		
		for(int i=0; i<couponInfo.size()-2; i++) {
			pvo.setPost_id(Integer.parseInt(couponInfo.get(i)));
			productService.updateCouponStatus(pvo); // 쿠폰 적용
		}
		
		cri = new Criteria(Integer.parseInt(couponInfo.get(couponInfo.size()-2)), 10); // 페이징 처리
		AdminProductVO vo = new AdminProductVO();
		vo.setCri(cri);
		
		List<AdminProductVO> postList = productService.getProductList(vo); 
		
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.searchListCount(vo));
		
		return "postList";
	}

	
	@RequestMapping(value="/updateDealStatus.admin", method=RequestMethod.POST) // 오늘의딜 상태 변경 (비동기)
	public String updateDealStatus(@RequestBody List<String> dealInfo, AdminProductVO pvo, Model model, Criteria cri) {

		String deal_status = dealInfo.get(dealInfo.size()-1);
		
		if(deal_status.equals("게시")) {
			pvo.setDeal_status(deal_status);
			pvo.setToday_deal(true);
			
			for(int i=0; i<dealInfo.size()-2; i++) {
				pvo.setPost_id(Integer.parseInt(dealInfo.get(i)));
				productService.updateDealStatus(pvo); // deal 상태 게시
			}
			
		}else if(deal_status.equals("중지")){
			pvo.setToday_deal(false);
			
			for(int i=0; i<dealInfo.size()-2; i++) {
				pvo.setPost_id(Integer.parseInt(dealInfo.get(i)));
				productService.deleteDeal(pvo); // deal 상태 중지
			}
			
		}
		
		cri = new Criteria(Integer.parseInt(dealInfo.get(dealInfo.size()-2)), 10); // 페이징 처리
		AdminProductVO vo = new AdminProductVO();
		vo.setCri(cri);
		
		List<AdminProductVO> postList = productService.getProductList(vo);
		
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.searchListCount(vo));
		
		return "postList";
	}
	
	
	@RequestMapping(value="/productSearchBox.admin", method=RequestMethod.POST) // 상품 검색 처리
	public String productSearchBox(@RequestBody Map<String, String> searchMap, AdminProductVO pvo, Model model, Criteria cri) {

		System.out.println(searchMap);
		
		pvo.setPost_status(searchMap.get("posttype"));
		pvo.setDeal_status(searchMap.get("dealtype"));
		pvo.setCate_name(searchMap.get("category"));
		pvo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		String enddate = searchMap.get("enddate");
		pvo.setEnddate(Date.valueOf(md.makedate(enddate))); 
		pvo.setPack(searchMap.get("pack"));
		pvo.setKeyword(searchMap.get("keyword"));
		
		pvo.setCri(new Criteria()); // 페이징 처리
		
		List<AdminProductVO> postList = productService.getProductList(pvo);
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.searchListCount(pvo));
		
		return "postList";
	}
	
	@RequestMapping(value="/productSearch.admin", method=RequestMethod.POST)
	public String productSearch(@RequestBody Map<String, String> searchMap, AdminProductVO pvo, Model model, Criteria cri) {

		System.out.println(searchMap);
		
		pvo.setPost_status(searchMap.get("posttype"));
		pvo.setDeal_status(searchMap.get("dealtype"));
		pvo.setCate_name(searchMap.get("category"));
		pvo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		String enddate = searchMap.get("enddate");
		pvo.setEnddate(Date.valueOf(md.makedate(enddate)));
		System.out.println(pvo.getEnddate());
		pvo.setPack(searchMap.get("pack"));
		pvo.setKeyword(searchMap.get("keyword"));
		pvo.setCri(new Criteria());
		
		List<AdminProductVO> postList = productService.getProductList(pvo);
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.searchListCount(pvo));

		return "postList";
	}
	
	/* 매출 관리 */
	@RequestMapping(value="/getTodayDealList.admin", method=RequestMethod.POST)
	public String getTodayDealList(@RequestBody(required=false) Map<String, String> searchMap, Criteria cri, AdminProductVO vo, Model model) {

		System.out.println("todayDeal" + searchMap);
		
		// 오늘의딜 날짜 세팅
		vo.setStartdate(java.sql.Date.valueOf("2018-01-01"));
		vo.setEnddate(Date.valueOf(md.makeToday()));
		
		if(searchMap != null) {
			vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
			String enddate = searchMap.get("enddate");
			vo.setEnddate(Date.valueOf(md.makedate(enddate))); 
			vo.setKeyword(searchMap.get("keyword"));
		}
		
		List<AdminProductVO> dealList = productService.todayDealSale(vo);
		model.addAttribute("dealList", dealList);

		return "dealsales";
	}
	
	// best30
	@RequestMapping(value="/getBest30List.admin", method=RequestMethod.POST)
	public String getBest30List(@RequestBody(required=false) Map<String, String> searchMap, Criteria cri, AdminProductVO vo, Model model) {

		System.out.println(searchMap);
		
		if(searchMap != null) {
			int pageNum = Integer.parseInt(searchMap.get("pageNum"));
			cri = new Criteria(pageNum, 10);
			vo.setCri(cri);
		}else {
			cri = new Criteria();
			vo.setCri(cri);
		}

		if(searchMap != null) {
			vo.setKeyword(searchMap.get("keyword"));
		}

		List<AdminProductVO> bestList = productService.bestSale(vo); // 페이징된 리스트
		int totalCount = productService.bestSaleCount(vo); // 전체 카운트
		System.out.println("검색 count" + totalCount);
		
		for(int i=0; i<bestList.size(); i++) {
			
			AdminProductVO pvo = bestList.get(i);
			long salePrice = (long)Math.round(pvo.getWhole_price()*(1-pvo.getSale_ratio()/100.0));
			pvo.setSale_price(salePrice);

		}

		model.addAttribute("pageMaker", cri);
		model.addAttribute("bestList", bestList);
		model.addAttribute("totalCount", totalCount); // paging

		return "best30sales";
	}
	
	@RequestMapping(value="/getStoreSaleList.admin", method=RequestMethod.POST)
	public String getStoreSaleList(@RequestBody(required=false) Map<String, String> searchMap, Criteria cri, AdminProductVO vo, Model model) {

		System.out.println("storesale : " + searchMap);

		// 매출 날짜 세팅
		vo.setStartdate(java.sql.Date.valueOf("2018-01-01"));
		vo.setEnddate(Date.valueOf(md.makeToday()));
		
		if(searchMap != null) {
			vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
			String enddate = searchMap.get("enddate");
			vo.setEnddate(Date.valueOf(md.makedate(enddate))); 
			vo.setKeyword(searchMap.get("keyword"));
		}

		List<AdminProductVO> sellerSaleList = productService.sellerSale(vo);
		
		for(int i=0; i<sellerSaleList.size(); i++) {
			AdminProductVO ch = sellerSaleList.get(i);
			int fee = 5;
			int realPayment = (int)Math.round(ch.getPayment()*(1-fee/100.0));
			ch.setFee(fee);
			ch.setRealPayment(realPayment);
		}
		
		model.addAttribute("sellerSaleList", sellerSaleList);

		return"storesales";
	}
}
