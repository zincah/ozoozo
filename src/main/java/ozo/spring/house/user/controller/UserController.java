package ozo.spring.house.user.controller;


import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.server.service.TodayDealTimer;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.service.UserScrapService;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.ScrapVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;
@Controller
public class UserController {

	@Autowired
	UserService userservice;
	
	@Autowired
	UserMainService userMainService;
	
	@Autowired
	UserScrapService userScrapService;
	

	
	
	

	

	@RequestMapping(value = "/shopApply.com")
	public String user_shopApply(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			return "ShopApply";
		}else {
			return "redirect:login.com";
		}
	}
	
	/*
	 * @RequestMapping(value = "/edit.com") public String user_edit() { return
	 * "ozoedit_zinc"; }
	 */
	
	/*
	 * @RequestMapping(value = "/password_m.com") public String user_P_M(HttpSession
	 * session) { if(session.getAttribute("Usercode")!=null) { return
	 * "oZo_Password_Forgot"; }else { return "oZo_LoginPage"; } }
	 */
	
	/*
	 * @RequestMapping(value = "/best.com") public String user_best() { return
	 * "oZo_BestShop"; }
	 * 
	 * @RequestMapping(value = "/shop.com") public String user_shop() { return
	 * "oZo_BestShop"; }
	 */
	
	/*
	 * @RequestMapping(value = "/customercenter.com") public String
	 * user_customercenter() { return "customercenter"; }
	 */
	
	@RequestMapping(value = "/passwordReset.com")
	public String user_passwordReset() {
		return "passwordReset";
	}
	
	@RequestMapping(value = "/error404.com")
	public String error404() {
		return "error/404Error";
	}
	
	@RequestMapping(value = "/error500.com")
	public String error500() {
		return "error/500Error";
	}
	@RequestMapping(value = "/shoptest.com")
	public String shop() {
		return "shop";
	}


}
