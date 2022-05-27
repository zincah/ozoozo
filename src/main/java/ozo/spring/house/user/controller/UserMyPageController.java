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
		System.out.println("여기 넘어왔어~");
		vo.setUser_num((int)session.getAttribute("User_Num"));
		vo.setUser_status("비활동중");
		
		userMyPageService.user_stop(vo);

		
		return "success";
	}
	@RequestMapping(value="/m_myPage.com")
	public String  mypage(UserVO vo, Model model, HttpServletRequest request, ScrapVO svo, UserScrapVO usvo) {
		HttpSession session = request.getSession();
		
		
		
		if(session.getAttribute("User_Num")!=null) {
			vo.setUser_num((int)session.getAttribute("User_Num"));
			System.out.println((int)session.getAttribute("User_Num"));
			
			svo.setSc_usernum((int)session.getAttribute("User_Num"));
			List<ScrapVO> list ;
			
			list = userscrapservice.s_scrap(svo);
			for(int i=0; i<list.size(); i++) {
				ScrapVO pro = list.get(i);
				int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
				
				DecimalFormat decFormat = new DecimalFormat("###,###"); 
				
				pro.setSale_price(decFormat.format(sale_price));
			}
			
			
	
			//회원정보
			UserVO info = userMyPageService.mypageinfo(vo);

			
			model.addAttribute("info",info); //회원정보
			model.addAttribute("list", list); //북마크


			
			return "myPage";
		}else {
			return "ozoLogin_zinc";
		}
		
	}
	

	
	/* 스크랩 */
	@ResponseBody
	@RequestMapping(value="/userscrap.com", method=RequestMethod.POST)
	public String Scrappick(@RequestBody int param, UserScrapVO vo, Model model, HttpServletRequest request,UserProductVO pvo) {
		HttpSession session = request.getSession();
		
			
			System.out.println("scrap ing");
			//session.getAttribute("UserMail");
			System.out.println(session.getAttribute("User_Num"));
			System.out.println(param);
			vo.setSc_usernum((int)session.getAttribute("User_Num"));
			vo.setSc_postid(param);
			
				if(userscrapservice.duplicate(vo) == null && session.getAttribute("User_Num")!=null) {
					System.out.println("여기까지왔어 ");
					vo.setSc_usernum((int)session.getAttribute("User_Num"));
					vo.setSc_postid(param);
					userscrapservice.s_insert(vo);
					System.out.println("리턴간다 ");
					return "1";
				}else {
					System.out.println("0간다 ");
				return "0";
				}
				/*
				 * List<UserScrapVO> goo =userscrapservice.us_list(vo);
				 * 
				 * for(int i =0; i<goo.size(); i++) { int[] fofo =new int[100]; fofo[i] =
				 * goo.get(i).getSc_postid(); }
				 */
		
			
		
	}
	
	
	/* detail 스크랩 */
	@ResponseBody
	@RequestMapping(value="/userscrapdetail.com", method=RequestMethod.POST)
	public String detailScrappick(@RequestBody int param, UserScrapVO vo, Model model, HttpServletRequest request,UserProductVO pvo) {
		HttpSession session = request.getSession();
		
		
		System.out.println("scrap ing");
		//session.getAttribute("UserMail");
		System.out.println(session.getAttribute("User_Num"));
		System.out.println(param);
		
		vo.setSc_usernum((int)session.getAttribute("User_Num"));
		vo.setSc_postid(param);
		
			if(userscrapservice.duplicate(vo) == null && session.getAttribute("User_Num")!=null) {
				System.out.println("여기까지왔어 ");
				vo.setSc_usernum((int)session.getAttribute("User_Num"));
				vo.setSc_postid(param);
				userscrapservice.s_insert(vo);
				System.out.println("리턴간다 ");
				return "1";
			}else {
				System.out.println("0간다 ");
			return "0";
			}
			/*
			 * List<UserScrapVO> goo =userscrapservice.us_list(vo);
			 * 
			 * for(int i =0; i<goo.size(); i++) { int[] fofo =new int[100]; fofo[i] =
			 * goo.get(i).getSc_postid(); }
			 */
	
		
	
	}

	/* 스크랩 지우기 */
	@ResponseBody
	@RequestMapping(value="/scrapdelete.com", method=RequestMethod.POST)
	public String Scrapdelete(@RequestBody int param, UserScrapVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("delete ing");
		System.out.println(session.getAttribute("User_Num"));
		System.out.println(param);
		
		vo.setSc_usernum((int)session.getAttribute("User_Num"));
		vo.setSc_postid(param);
		
			if(userscrapservice.duplicate(vo) != null && session.getAttribute("User_Num")!=null) {
				System.out.println("여기까지왔어 ");
				vo.setSc_usernum((int)session.getAttribute("User_Num"));
				vo.setSc_postid(param);
				userscrapservice.s_cancle(vo);
				System.out.println("리턴간다 ");
				return "1";
			}else {
				System.out.println("0간다 ");
			return "0";
			}
		
		
		
		
		
	}
	
	
}
