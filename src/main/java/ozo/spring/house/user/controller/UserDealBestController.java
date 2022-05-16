package ozo.spring.house.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ozo.spring.house.user.dao.UserMainDAO;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.vo.UserProductVO;

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
}
