package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.service.UserScrapService;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;

@Controller
public class RankingController {
	
	@Autowired
	UserService userservice;
	
	@Autowired
	UserMainService userMainService;
	
	@Autowired
	UserScrapService userScrapService;
	
	@RequestMapping(value = "/mainRanking.com")
	public String user_main(@RequestBody Map<String, String> rank, UserProductVO vo, UserScrapVO svo, Model model, HttpSession session) {
		
		List<UserScrapVO> scrap = new ArrayList<UserScrapVO>();

		vo.setCheckit(false);
		
		if(session.getAttribute("User_Num") != null) {
			svo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			scrap = userScrapService.userScrapList(svo);
		}
		
		vo.setOrderKind(rank.get("ranking"));
		List<UserProductVO> productList = userMainService.mainProductList(vo);

		
		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //�냼�닔�젏 �븿�닔
			
			pro.setSale_price(decFormat.format(sale_price));
			System.out.println(pro.getPost_id());
			
			for(int j=0; j<scrap.size(); j++) {
				UserScrapVO sc = scrap.get(j);
				if(pro.getPost_id() == sc.getSc_postid()) {
					pro.setCheckit(true);
				}
			}
		}
		
		
		model.addAttribute("productList", productList); 
		//model.addAttribute("pagecount", pagecount);

		return "oZo_Main_Assist";
	}

}
