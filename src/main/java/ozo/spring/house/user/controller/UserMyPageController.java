package ozo.spring.house.user.controller;

import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.service.UserScrapService;
import ozo.spring.house.user.service.userMyPageService;
import ozo.spring.house.user.vo.ScrapVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class UserMyPageController {
	
	@Autowired
	userMyPageService userMyPageService;
	
	@Autowired 
	UserScrapService userscrapservice;
	
	@RequestMapping(value="/m_edit.com")
	public String User_Info(UserVO vo,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("User_Num")!=null) {
			vo.setUser_num((int)session.getAttribute("User_Num"));
			UserVO info;
			info = userMyPageService.mypageinfo(vo);
			
			
			
			UserVO mandu = userMyPageService.mypageinfo(vo) ;
			mandu.setUser_email(info.getUser_email().split("@")[1]);
			
			info.setUser_email(info.getUser_email().split("@")[0]);
			
			 model.addAttribute("info", info);
			 model.addAttribute("mandu", mandu);
			 
			return "ozoedit_zinc";
		}else {
			return "ozoLogin_zinc";
		}
		
	}
	
	@RequestMapping(value="/out.com")
	public String memberout() {
		return "memberout";
	}
	
	@ResponseBody
	@RequestMapping(value="/stopit.com" , method=RequestMethod.POST)
	public String user_stop(UserVO vo, HttpServletRequest request ) {
		HttpSession session = request.getSession();
		System.out.println("���� �Ѿ�Ծ�~");
		vo.setUser_num((int)session.getAttribute("User_Num"));
		vo.setUser_status("Ȱ����");
		
		userMyPageService.user_stop(vo);

		
		return "success";
	}
	@RequestMapping(value="/m_myPage.com")
	public String  mypage(UserVO vo, Model model, HttpServletRequest request, ScrapVO svo, UserScrapVO usvo) {
		HttpSession session = request.getSession();
		
		
		
		if(session.getAttribute("User_Num")!=null) {
			vo.setUser_num((int)session.getAttribute("User_Num"));
			System.out.println((int)session.getAttribute("User_Num"));
			
			
			List<ScrapVO> list ;
			list = userscrapservice.s_scrap(svo);
			for(int i=0; i<list.size(); i++) {
				ScrapVO pro = list.get(i);
				int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
				
				DecimalFormat decFormat = new DecimalFormat("###,###"); 
				
				pro.setSale_price(decFormat.format(sale_price));
			}
			
			usvo.setSc_usernum((int)session.getAttribute("User_Num"));
			List<UserScrapVO> post = userscrapservice.us_list(usvo);
			
			UserVO info = userMyPageService.mypageinfo(vo);
			info.setScrap_count(list.size());
			model.addAttribute("info",info); //ȸ������
			model.addAttribute("list", list); //�ϸ�ũ
			model.addAttribute("post", post); //ȸ���� �����ִ� �ϸ�ũ Ȩȭ��ǥ�� 
			
			return "myPage";
		}else {
			return "ozoLogin_zinc";
		}
		
	}
	

	
	/* ��ũ�� */
	@ResponseBody
	@RequestMapping(value="/userscrap.com", method=RequestMethod.POST)
	public String Scrappick(@RequestBody int param, UserScrapVO vo, Model model, HttpServletRequest request,UserProductVO pvo) {
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
		
		System.out.println("scrap ing");
		//session.getAttribute("UserMail");
		System.out.println(session.getAttribute("User_Num"));
		System.out.println(param);

			vo.setSc_usernum((int)session.getAttribute("User_Num"));
			vo.setSc_postid(param);
			userscrapservice.s_insert(vo);
		

			/*
			 * List<UserScrapVO> goo =userscrapservice.us_list(vo);
			 * 
			 * for(int i =0; i<goo.size(); i++) { int[] fofo =new int[100]; fofo[i] =
			 * goo.get(i).getSc_postid(); }
			 */
		
		
		
		
		
		
		
		return "���´�" ;
	}else {
		return "�Ⱥ��´�" ;
		}
	}
		

	/* ��ũ�� ����� */
	@ResponseBody
	@RequestMapping(value="/scrapdelete.com", method=RequestMethod.POST)
	public String Scrapdelete(@RequestBody int param, UserScrapVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("delete ing");
		System.out.println(session.getAttribute("User_Num"));
		System.out.println(param);
		if(session.getAttribute("User_Num")!=null) {
			vo.setSc_postid(param);
			userscrapservice.s_cancle(vo);
		return "������" ;
		}else {
		return "�α����� �ʿ��մϴ�" ;
		}
		
		
		
	}
	
	
}
