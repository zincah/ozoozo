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

import ozo.spring.house.user.service.U_MyPageService;
import ozo.spring.house.user.vo.ScrapVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class U_MyPageController {
	
	@Autowired
	U_MyPageService mypageservice;
	
	
	@RequestMapping(value="/m_edit.com")
	public String User_Info(UserVO vo,Model model,HttpServletRequest request) {
		System.err.println("[Log] --- MyPage Controller >>>>> User_Info Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("User_Num")!=null) {
			vo.setUser_num((int)session.getAttribute("User_Num"));
			UserVO info;
			info = mypageservice.mypageinfo(vo);
			UserVO mandu = mypageservice.mypageinfo(vo) ;
			mandu.setUser_email(info.getUser_email().split("@")[1]);
			info.setUser_email(info.getUser_email().split("@")[0]);
			 model.addAttribute("info", info);
			 model.addAttribute("mandu", mandu);
			return "oZo_MyInformEdit";
		}else {
			return "oZo_LoginPage";
		}
		
	}
	
	@RequestMapping(value="/pwReset.com")
	public String pwreset(UserVO vo,Model model,HttpServletRequest request) {
		System.err.println("[Log] --- MyPage Controller >>>>> pwreset Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			return "oZo_PasswordChange";
		}else {
			return "oZo_LoginPage";
		}
		
	}
	
	@RequestMapping(value="/out.com")
	public String memberout() {
		System.err.println("[Log] --- MyPage Controller >>>>> memberout Method");
		return "memberout";
	}
	
	@ResponseBody
	@RequestMapping(value="/stopit.com" , method=RequestMethod.POST)
	public String user_stop(UserVO vo, HttpServletRequest request ) {
		System.err.println("[Log] --- MyPage Controller >>>>> user_stop Method");
		HttpSession session = request.getSession();
		vo.setUser_num((int)session.getAttribute("User_Num"));
		vo.setUser_status("��Ȱ����");
		mypageservice.user_stop(vo);
		return "success";
	}
	@RequestMapping(value="/m_myPage.com")
	public String  mypage(UserVO vo, Model model, HttpServletRequest request, ScrapVO svo, UserScrapVO usvo) {
		System.err.println("[Log] --- MyPage Controller >>>>> mypage Method");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("User_Num")!=null) {
			vo.setUser_num((int)session.getAttribute("User_Num"));
			svo.setSc_usernum((int)session.getAttribute("User_Num"));
			List<ScrapVO> list ;
			list = mypageservice.s_scrap(svo);
			for(int i=0; i<list.size(); i++) {
				ScrapVO pro = list.get(i);
				int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
				DecimalFormat decFormat = new DecimalFormat("###,###"); 
				pro.setSale_price(decFormat.format(sale_price));
			}
	
			//ȸ������
			UserVO info = mypageservice.mypageinfo(vo);
			model.addAttribute("info",info); //ȸ������
			model.addAttribute("list", list); //�ϸ�ũ
			return "oZo_MyPage";
		}else {
			return "oZo_LoginPage";
		}
		
	}
	
	/* ��ũ�� */
	@ResponseBody
	@RequestMapping(value="/userscrap.com", method=RequestMethod.POST)
	public String Scrappick(@RequestBody int param, UserScrapVO vo, Model model, HttpServletRequest request,UserProductVO pvo) {
		System.err.println("[Log] --- MyPage Controller >>>>> Scrappick Method");
		HttpSession session = request.getSession();
			//session.getAttribute("UserMail");
			vo.setSc_usernum((int)session.getAttribute("User_Num"));
			vo.setSc_postid(param);
			
				if(mypageservice.duplicate(vo) == null && session.getAttribute("User_Num")!=null) {
					vo.setSc_usernum((int)session.getAttribute("User_Num"));
					vo.setSc_postid(param);
					mypageservice.s_insert(vo);
					return "1";
				}else {
				return "0";
				}
	}
	
	/* detail ��ũ�� */
	@ResponseBody
	@RequestMapping(value="/userscrapdetail.com", method=RequestMethod.POST)
	public String detailScrappick(@RequestBody int param, UserScrapVO vo, Model model, HttpServletRequest request,UserProductVO pvo) {
		System.err.println("[Log] --- MyPage Controller >>>>> detailScrappick Method");
		HttpSession session = request.getSession();
		//session.getAttribute("UserMail");
		
		vo.setSc_usernum((int)session.getAttribute("User_Num"));
		vo.setSc_postid(param);
		
			if(mypageservice.duplicate(vo) == null && session.getAttribute("User_Num")!=null) {
				vo.setSc_usernum((int)session.getAttribute("User_Num"));
				vo.setSc_postid(param);
				mypageservice.s_insert(vo);
				return "1";
			}else {
			return "0";
			}
	}

	/* ��ũ�� ����� */
	@ResponseBody
	@RequestMapping(value="/scrapdelete.com", method=RequestMethod.POST)
	public String Scrapdelete(@RequestBody int param, UserScrapVO vo, Model model, HttpServletRequest request) {
		System.err.println("[Log] --- MyPage Controller >>>>> Scrapdelete Method");
		HttpSession session = request.getSession();
		vo.setSc_usernum((int)session.getAttribute("User_Num"));
		vo.setSc_postid(param);
			if(mypageservice.duplicate(vo) != null && session.getAttribute("User_Num")!=null) {
				vo.setSc_usernum((int)session.getAttribute("User_Num"));
				vo.setSc_postid(param);
				mypageservice.s_cancle(vo);
				return "1";
			}else {
			return "0";
			}
	}
}
