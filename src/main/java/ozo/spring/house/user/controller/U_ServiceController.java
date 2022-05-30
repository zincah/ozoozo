package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.user.service.U_MyPageService;
import ozo.spring.house.user.service.U_MainService;
import ozo.spring.house.user.service.U_Service;
import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;
@Controller
public class U_ServiceController {
	
	@Autowired
	U_Service userservice;
	
	@Autowired
	U_MainService userMainService;
	
	@Autowired
	U_MyPageService mypageservice;
	
	@RequestMapping(value = "/main.com")
	public String user_main(UserProductVO vo, Model model, HttpSession session, UserScrapVO svo) {
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();
		
		// timer
		List<Map<String, String>> list = userMainService.getDealEndTime();
		List<Map<String, String>> dealtimelist = new ArrayList<Map<String, String>>();
		System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			Map<String, String> dealtime = list.get(i);
			String t = "\""+String.valueOf(dealtime.get("deal_endtime"))+"\"";
			String su = t.substring(0, 20) + "\"";
			dealtime.put("deal_endtime", su);
			dealtimelist.add(dealtime);
		}
		
		String jsonArray = JSONArray.toJSONString(dealtimelist);
		model.addAttribute("dealtimelist", jsonArray);
		

		vo.setCheckit(false);

		List<UserProductVO> productList = userMainService.mainProductList(vo);
		int total = userMainService.getProductCount();
		
		// 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲 list 占쎈쐻占쎈뼓繹먮씮�굲
		List<UserProductVO> todayDealList = userMainService.mainDealProductList(vo);
		System.out.println(todayDealList.size());
		
		// main banner list 占쎈쐻占쎈뼓繹먮씮�굲
		List<BannerVO> bannerList = userMainService.selectBannerList();
		
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = mypageservice.userScrapList(svo);
		}
		
		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			

			DecimalFormat decFormat = new DecimalFormat("###,###"); 
			
			pro.setSale_price(decFormat.format(sale_price));
			
			for(int j=0; j<scrap.size(); j++) {
				UserScrapVO sc = scrap.get(j);
				if(pro.getPost_id() == sc.getSc_postid()) {
					pro.setCheckit(true);
				}
			}
		}
		
		for(int i=0; i<todayDealList.size(); i++) {
			UserProductVO pro = todayDealList.get(i);
			int sale_price = pro.getDeal_saleprice()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); 
			pro.setSale_price(decFormat.format(sale_price));
			
			for(int j=0; j<scrap.size(); j++) {
				UserScrapVO sc = scrap.get(j);
				if(pro.getPost_id() == sc.getSc_postid()) {
					pro.setCheckit(true);
				}
			}
		}

		model.addAttribute("totalCount", total);
		model.addAttribute("productList", productList);
		model.addAttribute("todayDealList", todayDealList);
		model.addAttribute("bannerList", bannerList);
		
		return "oZo_MainPage";
	}
	
	// service_senter
	
	@RequestMapping(value = "/CScenter.com")
	public String user_CSceneter(Model model,CScenterVO vo) {
		List<CScenterVO> list;
		list = userservice.csall(vo);
		model.addAttribute("list",list);
		return "oZo_Service_Senter";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCS.com", method=RequestMethod.GET)
	public List<CScenterVO> getCSList(String key,CScenterVO vo) {
		vo.setCustomer_keyword(key);
		System.out.println(key);
		List<CScenterVO> list = userservice.cskeyword(vo);
		
		return list;
	}
}
