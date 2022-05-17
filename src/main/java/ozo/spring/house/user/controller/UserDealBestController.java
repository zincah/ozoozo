package ozo.spring.house.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ozo.spring.house.user.dao.UserMainDAO;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.vo.UserProductVO;

import java.text.DecimalFormat;
import java.util.List;

@Controller
public class UserDealBestController {

	@Autowired
	UserMainService userMainService;


	@RequestMapping(value = "/todaydeal.com")
	public String main_todayDeal(Model model){

		List<UserProductVO> todayDealList = userMainService.todayDealList();
		model.addAttribute("todayDealList", todayDealList);
		System.out.println("todaydealListsize"+ todayDealList.size());
		return "ozotodaydeal_zinc";
	}


	@RequestMapping(value = "/brandshop.com")
	public String main_shop(Model model){

		List<UserProductVO> shopItemList = userMainService.shopItemList();
		System.out.println(shopItemList.size());


		for(int i=0; i<shopItemList.size(); i++){
			UserProductVO sho = shopItemList.get(i);
			int sale_price = sho.getWhole_price()*(100-sho.getSale_ratio())/100;

			DecimalFormat decFormat = new DecimalFormat("###,###");

			sho.setSale_price(decFormat.format(sale_price));
		}


		model.addAttribute("shopItemList", shopItemList);

		return "ozoshop_main";
	}
}
