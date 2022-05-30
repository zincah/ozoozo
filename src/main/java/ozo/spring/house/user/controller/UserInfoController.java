package ozo.spring.house.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import ozo.spring.house.user.dao.UserDAO.cart_Allload;
import ozo.spring.house.user.service.NaverLoginService;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.service.UserScrapService;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.service.UserMyPageService;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class UserInfoController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserMainService userMainService;
	
	@Autowired
	UserMyPageService mypageService;
	
	@Autowired 
	UserScrapService userscrapservice;
	
	@Autowired NaverLoginService naverLoginService;
	
	
	
	@RequestMapping(value="/signUpProc.com", method=RequestMethod.POST)
	public String signUpProc(UserVO vo, HttpSession session, Model model,
			@RequestParam(value="user_email1")String email1, 
			@RequestParam(value="user_email2")String email2,
			@RequestParam(value="user_email3")String email3) {
	
		
		
		if(email2.equals("manual")) {
			vo.setUser_email(email1 + "@" + email3);
		}else {
			vo.setUser_email(email1 + "@" + email2);
		}
		//System.out.println("�̸��� ���� ����" +vo.getUser_email());
		userService.insertUser(vo);
		return "redirect:login.com";
		
		// return "redirect:signUp.com";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/header_load.com", method= {RequestMethod.GET, RequestMethod.POST})
	public int[] get_cart_ea(HttpSession session) {
		if(session.getAttribute("UserMail")!=null) {
			cart_Allload cart_cls;
			CartVO cvo =new CartVO();
			cvo.setCart_user((Integer)session.getAttribute("User_Num"));
			cart_cls = userService.get_cart_class(cvo);
			List<CartVO> cart_li = cart_cls.getCart_li();
			
			UserScrapVO vo = new UserScrapVO();
			vo.setSc_usernum((Integer)session.getAttribute("User_Num"));
			List<UserScrapVO> scrap_li = userscrapservice.us_list(vo);
			int[] arr = {cart_li.size(), scrap_li.size()};
			return arr;
		}else {
			return null;
		}
	}
	
	
	// ���̹� �α��� callback �޼ҵ�
	@RequestMapping(value="/nalogin.com", method={ RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, UserVO vo) 
			throws IOException, ParseException{
		
		System.out.println("naver callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginService.getAccessToken(session, code, state);
		
		String apiResult = naverLoginService.getUserProfile(oauthToken);
		System.out.println(apiResult);
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		String nickname = (String) response_obj.get("nickname");
		String email = (String) response_obj.get("email");
		
		System.out.println("nick" + nickname);
		System.out.println("email" + email);
		
		vo.setUser_email(email);
		UserVO user = userService.checkUserByNaver(vo);
		
		if(user!=null) {
			session.setAttribute("UserMail", email);
			session.setAttribute("User_Num", user.getUser_num());
			session.setAttribute("User_img", user.getUser_img());
			session.setAttribute("User_nickname", user.getNickname());
			vo.setUser_num(user.getUser_num());
			userService.lastLoginCheck(vo);
			return "redirect:login.com";
		}else {
			// ���̹� ȸ�� ����
			vo.setUser_email(email);
			vo.setNickname(nickname);
			vo.setUser_pw("naver");
			userService.insertUser(vo);
			System.out.println("���̹� ȸ������ ����");
			
			UserVO nuser = userService.checkUserByNaver(vo);
			vo.setUser_num(nuser.getUser_num());
			userService.lastLoginCheck(vo);
			
			session.setAttribute("UserMail", email);
			session.setAttribute("User_Num", nuser.getUser_num());
			return "redirect:main.com";
		}

		
	}
	
	// ���̹� �α��� �޼ҵ�
	@RequestMapping(value = "/login.com", method=RequestMethod.GET)
	public String loginView(HttpSession session, HttpServletRequest request, Model model) {

		String naverAuthUrl = naverLoginService.getAuthorizationUrl(session);
		//System.out.println("���̹�:"+naverAuthUrl);
		model.addAttribute("naverurl", naverAuthUrl);
		
		
		// ���� ������ ������ ���ͼ� String url�� �������ش�.
		if(request.getHeader("Referer")!=null) {
			System.out.println("���� url");
			String referer = request.getHeader("Referer");
			String[] urls = referer.split("/");
			String url = urls[urls.length-1];
			// ���ǿ� lasturl�̶�� �̸����� ����
			session.setAttribute("lasturl", url);
		}

		if(session.getAttribute("UserMail")!=null) {
			return "forward:main.com";
		}else {
			return "ozoLogin_zinc";
		}
	}
	
		@RequestMapping(value="/login.com", method=RequestMethod.POST)
		public String login(UserVO vo, Model model, HttpSession session, HttpServletRequest request) {

			// log ó��
			System.out.println("login controller");
			
			// īī�� �α��� ����
			if(request.getParameter("kanickname")!="") {
				System.out.println("īī�� �α��� ����");
				String kaemail = request.getParameter("kaemail"); // �̸��� ���� ���Ұ�� ����
				String kanickname = request.getParameter("kanickname");
				
				vo.setUser_email(kaemail);
				UserVO user = userService.checkUserByNaver(vo);
				
				if(user!=null) { // ȸ�������� �ִ� ���
					session.setAttribute("UserMail", kaemail);
					session.setAttribute("User_Num", user.getUser_num());
					session.setAttribute("User_img", user.getUser_img());
					session.setAttribute("User_nickname", user.getNickname());
					vo.setUser_num(user.getUser_num());
					userService.lastLoginCheck(vo);
					return "redirect:login.com";
					
				}else { // ȸ�������� ���°�� ȸ������
					System.out.println("īī�� ȸ������ ����");
					vo.setUser_email(kaemail);
					vo.setNickname(kanickname);
					vo.setUser_pw("kakao");
					userService.insertUser(vo);
					System.out.println("īī�� ȸ������ ����");
					
					UserVO nuser = userService.checkUserByNaver(vo);
					vo.setUser_num(nuser.getUser_num());
					userService.lastLoginCheck(vo);
					
					session.setAttribute("UserMail", kaemail);
					session.setAttribute("User_Num", nuser.getUser_num());
					
					return "redirect:main.com";
				}
			}

			UserVO user = userService.checkUser(vo);
			//System.out.println(user.getUser_num());
			
				
			if(user != null) {
				System.out.println("�Ϲ� �α��� ����");
				session.setAttribute("UserMail", user.getUser_email());
				session.setAttribute("User_Num", user.getUser_num());
				session.setAttribute("User_img", user.getUser_img());
				session.setAttribute("User_nickname", user.getNickname());
				model.addAttribute("member", vo); // member ����
				vo.setUser_num(user.getUser_num());
				userService.lastLoginCheck(vo); // �����α��� ��¥ ������Ʈ
				
				String url = "";
				// ���ǿ� ����Ǿ��ִ� lasturl�� ���ͼ� �� �������� �����̷�Ʈ ��Ų��.
				if(session.getAttribute("lasturl") == null) {
					
				}else {
					url = (String) session.getAttribute("lasturl");
					System.out.println(url);
					if(!url.equals("signUp.com")) {
						return "redirect:"+url;
					}
				}
				// (��ٱ��Ͽ� �ִ� ������ ���� ��� �������� ó�� ����)
				return "redirect:main.com";
			
			}
			
			String msg = "�Է��Ͻ� ������ �߸� �Ǿ����ϴ�.";
			model.addAttribute("msg", msg);
			return "ozoLogin_zinc";

		}
		
		// logout
		@RequestMapping(value = "/logout.com", method=RequestMethod.GET)
		public String logout(HttpSession session) {

			//(http://nid.naver.com/nidlogin.logout)
			session.invalidate();
			return "redirect:login.com";
		}
		
		@RequestMapping(value = "/myPage.com")
		public String mypageView(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession();
			
			if(session.getAttribute("UserMail")!=null) {
				return "myPage";
			}else {
				String msg = "�α����� �̿� �����մϴ�.";
				model.addAttribute("msg", msg);
				return "ozoLogin_zinc";
			}
		}
		
		@ResponseBody
		@RequestMapping(value = "/Duplicate_Check_Email.com", method=RequestMethod.POST)
		public Boolean checkEmail(@RequestBody String Email, UserVO vo) {
			String email = Email.replace("\"", "");
			System.out.println("����ڰ� �Է��� E-mail : "+ email);
			vo.setUser_email(email);
			return userService.Duplicate_Check_Email(vo);
		}
		
		@ResponseBody
		@RequestMapping(value = "/Duplicate_Check_Nickname.com", method=RequestMethod.POST)
		public Boolean checkNickname(@RequestBody String Nickname, UserVO vo) {
			String nickname = Nickname.replace("\"", "");
			System.out.println("����ڰ� �Է��� nickname : "+ nickname);
			vo.setNickname(nickname);
			return userService.Duplicate_Check_Nickname(vo);
		}
		
		@ResponseBody
		@RequestMapping(value = "/userPassword_change.com", method=RequestMethod.POST)
		public String changePassword(@RequestParam("change_pass") String change_pass, UserVO vo, HttpSession session) {
			String pass = change_pass.replace("\"", "");
			System.out.println("�ٲٰ��� �ϴ� ��й�ȣ : "+ pass +"\n");
			String email = (String) session.getAttribute("UserMail");
			System.out.println(email);
			vo.setUser_pw(pass);
			vo.setUser_email(email);
			userService.change_pass(vo);
			return "redirect:mypage.com";
		}
		
		//ȸ������ ������
		@RequestMapping(value = "/signUp.com")
		public String user_signUp(UserVO vo, Model model, HttpSession session) {
			
			// ���̹� �α��� ��ư Ŭ����
			String naverAuthUrl = naverLoginService.getAuthorizationUrl(session);
			//System.out.println("���̹�:"+naverAuthUrl);
			model.addAttribute("naverurl", naverAuthUrl);
			
			// īī��
			
			// ����
			
			
			return "SignUp";
		}
		@RequestMapping(value = "/memberSessionCheck.com",method = RequestMethod.POST)
		@ResponseBody
		public int memberSessionCheck (HttpSession session) {
			if(session.getAttribute("User_Num")!=null) {
			int User_Num =(int) session.getAttribute("User_Num");
			System.out.println((int) session.getAttribute("User_Num"));
		
				
				
				return User_Num;
				
			}else {
				return 0;
			}
		}
		
		// �� ��ٱ��� �޼ҵ�
		public int checkCartSu(UserVO vo) {
			int cartSize = mypageService.checkCartSu(vo);
			return cartSize;
		}
		

}
