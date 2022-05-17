package ozo.spring.house.seller.controller;

import java.sql.Date;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.SellerPostingService;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class SellerPostingController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	SellerPostingService sellerPostingService;
	
	// 판매글 검색 컨트롤러
	@RequestMapping(value = "/getSearchPostingList.seller", method=RequestMethod.POST)
	public String getSearchProductList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody Map<String, Object> datas) {	
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		Map<String,String> searchMap = (Map<String, String>) datas.get("searchMap");
		@SuppressWarnings("unchecked")
		ArrayList<String> searchStatus = (ArrayList<String>) datas.get("searchStatus");
		
		// productVO에 데이터 추가
		vo.setSc_searchName(searchMap.get("searchName").trim());
		vo.setSc_searchNameStatus(searchMap.get("searchNameStatus"));
		vo.setSc_searchStatus(searchStatus);
		if(searchMap.get("category").equals("대분류")) {
			vo.setSc_category(0);
		} else {
			vo.setSc_category(Integer.parseInt(searchMap.get("category")));
		}
		if(searchMap.get("middleSelect").equals("중분류")) {
			vo.setSc_middleSelect(0);
		} else {
			vo.setSc_middleSelect(Integer.parseInt(searchMap.get("middleSelect")));
		}
		if(searchMap.get("smallSelect").equals("소분류")) {
			vo.setSc_smallSelect(0);
		} else {
			vo.setSc_smallSelect(Integer.parseInt(searchMap.get("smallSelect")));
		}
		vo.setSc_selectDate(searchMap.get("selectDate"));
		vo.setSc_startDate(Date.valueOf(searchMap.get("startDate")));
		vo.setSc_endDate(Date.valueOf(searchMap.get("endDate")));
		vo.setSeller_id((int) session.getAttribute("seller_id"));

		// DB를 통해 리스트 추출 후 배열에 저장
		List<ProductVO> searchPostingList = (sellerPostingService.selectSearchPosting(vo));
		// model에 값 저장
		model.addAttribute("searchPostingList", searchPostingList);
		
		// ajax로 부분만 띄워줄 jsp 주소 리턴
		return "seller-productPostingManagement-List";
	}
	
	// 판매글 상태 변경 컨트롤러
	@ResponseBody
	@RequestMapping(value = "/postingStatusUpdate.seller", method=RequestMethod.POST)
	public String postingStatusUpdate(HttpServletRequest request, ProductVO vo, @RequestParam(value="pscList[]") ArrayList<String> listPostingId, @RequestParam(value="statusOption") String status) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			for(String postingId : listPostingId) {
				vo.setPost_id(Integer.parseInt(postingId));
				vo.setPost_status(status);
				sellerPostingService.updatePostingStatus(vo);
			}
			return "seller-productPostingManagement-List";
		}else {
			return "seller-login";
		}
	}
	
	// 선택된 판매글 리스트 (오늘의딜 신청 버튼 모달에 있는 테이블)
	@RequestMapping(value = "/selectPostingList.seller", method=RequestMethod.POST)
	public String selectProductList(HttpServletRequest request, Model model, ProductVO vo, @RequestBody ArrayList<String> listPostingId) {
		HttpSession session = request.getSession();
		List<ProductVO> selectPostingListView = new ArrayList<ProductVO>();
		if(session.getAttribute("seller")!=null) {
			for(String postingId : listPostingId) {
				vo.setPost_id(Integer.parseInt(postingId));
				selectPostingListView.add(sellerPostingService.selectSelectPosting(vo));
			}
			model.addAttribute("selectPostingListView", selectPostingListView);
			return "seller-productPostingManagement-selectList";
		}else {
			return "seller-login";
		}
	}
	
	// 오늘의딜 신청 컨트롤러
	@ResponseBody
	@RequestMapping(value = "/PostingDealAppUpdate.seller", method=RequestMethod.POST)
	public String PostingDealAppUpdate(HttpServletRequest request, ProductVO vo, @RequestBody ArrayList<String> listPostingId) {
		HttpSession session = request.getSession();
		if(session.getAttribute("seller")!=null) {
			for(String postingId : listPostingId) {
				vo.setPost_id(Integer.parseInt(postingId));
				vo.setSeller_id((int) session.getAttribute("seller_id"));
				sellerPostingService.insertPostingDealApp(vo);
			}
			return "seller-productPostingManagement-selectList";
		}else {
			return "seller-login";
		}
	}
}
