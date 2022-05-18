package ozo.spring.house.admin.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.admin.service.AdminProductManageService;
import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.common.PageDTO;

@Controller
public class AdminProductManageController {
	
	@Autowired
	AdminProductManageService productService;
	
	@RequestMapping(value="/movePaging.admin", method=RequestMethod.POST)
	public String movePaging(@RequestBody Map<String, String> searchMap, Criteria cri, Model model, AdminProductVO pvo) {

		System.out.println(searchMap);
		int pageNum = Integer.parseInt(searchMap.get("pageNum"));
		
		pvo.setPost_status(searchMap.get("posttype"));
		pvo.setCate_name(searchMap.get("category"));
		pvo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		pvo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		pvo.setPack(searchMap.get("pack"));
		pvo.setKeyword(searchMap.get("keyword"));
		
		cri = new Criteria(pageNum, 10);
		pvo.setCri(cri);
		
		List<AdminProductVO> postList = productService.getProductList(pvo);
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.searchListCount(pvo));

		return "postList";
	}

	
	@RequestMapping(value="/updateProductStatus.admin", method=RequestMethod.POST)
	public String updateProductStatus(@RequestBody List<String> modifyInfo, AdminProductVO pvo, Model model, Criteria cri) {

		System.out.println(modifyInfo);
		
		pvo.setPost_status(modifyInfo.get(modifyInfo.size()-1));
		
		for(int i=0; i<modifyInfo.size()-2; i++) {
			pvo.setPost_id(Integer.parseInt(modifyInfo.get(i)));
			productService.updateProductStatus(pvo);
		}
		
		cri = new Criteria(Integer.parseInt(modifyInfo.get(modifyInfo.size()-2)), 10);
		AdminProductVO vo = new AdminProductVO();
		vo.setCri(cri);

		List<AdminProductVO> postList = productService.getProductList(vo);
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);
		System.out.println(productService.searchListCount(vo));
		model.addAttribute("totalcount", productService.searchListCount(vo));
		
		return "postList";
	}
	
	@RequestMapping(value="/updateCouponStatus.admin", method=RequestMethod.POST)
	public String updateCouponStatus(@RequestBody List<String> couponInfo, AdminProductVO pvo, Model model, Criteria cri) {

		System.out.println(couponInfo);
		
		pvo.setPost_couponid(Integer.parseInt(couponInfo.get(couponInfo.size()-1)));
		
		for(int i=0; i<couponInfo.size()-2; i++) {
			pvo.setPost_id(Integer.parseInt(couponInfo.get(i)));
			productService.updateCouponStatus(pvo);
		}
		
		cri = new Criteria(Integer.parseInt(couponInfo.get(couponInfo.size()-2)), 10);
		AdminProductVO vo = new AdminProductVO();
		vo.setCri(cri);
		
		List<AdminProductVO> postList = productService.getProductList(vo);
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.searchListCount(vo));
		
		return "postList";
	}

	
	@RequestMapping(value="/updateDealStatus.admin", method=RequestMethod.POST)
	public String updateDealStatus(@RequestBody List<String> dealInfo, AdminProductVO pvo, Model model, Criteria cri) {

		System.out.println(dealInfo);

		String deal_status = dealInfo.get(dealInfo.size()-1);
		if(deal_status.equals("게시")) {
			pvo.setDeal_status(deal_status);
			pvo.setToday_deal(true);
			
			for(int i=0; i<dealInfo.size()-2; i++) {
				pvo.setPost_id(Integer.parseInt(dealInfo.get(i)));
				productService.updateDealStatus(pvo);
			}
		}else if(deal_status.equals("중지")){
			// deal_info에서는 삭제
			pvo.setToday_deal(false);
			
			for(int i=0; i<dealInfo.size()-2; i++) {
				pvo.setPost_id(Integer.parseInt(dealInfo.get(i)));
				productService.deleteDeal(pvo);
			}
		}
		
		cri = new Criteria(Integer.parseInt(dealInfo.get(dealInfo.size()-2)), 10);
		AdminProductVO vo = new AdminProductVO();
		vo.setCri(cri);
		
		List<AdminProductVO> postList = productService.getProductList(vo);
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", productService.searchListCount(vo));
		
		return "postList";
	}
	
	
	@RequestMapping(value="/productSearchBox.admin", method=RequestMethod.POST)
	public String productSearchBox(@RequestBody Map<String, String> searchMap, AdminProductVO pvo, Model model, Criteria cri) {

		System.out.println(searchMap);
		
		pvo.setPost_status(searchMap.get("posttype"));
		pvo.setCate_name(searchMap.get("category"));
		pvo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		pvo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		pvo.setPack(searchMap.get("pack"));
		pvo.setKeyword(searchMap.get("keyword"));
		pvo.setCri(new Criteria());
		
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
		pvo.setCate_name(searchMap.get("category"));
		pvo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		pvo.setEnddate(Date.valueOf(searchMap.get("enddate")));
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
	public String getTodayDealList(Criteria cri, AdminProductVO vo, Model model) {

		List<AdminProductVO> dealList = productService.todayDealSale(vo);
		model.addAttribute("dealList", dealList);

		return "dealsales";
	}

}
