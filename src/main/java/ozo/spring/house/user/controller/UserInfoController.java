package ozo.spring.house.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import ozo.spring.house.admin.vo.MemberVO;
import ozo.spring.house.user.service.NaverLoginService;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class UserInfoController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserMainService userMainService;
	
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
		UserVO user = userMainService.checkUserByNaver(vo);
		
		if(user!=null) {
			session.setAttribute("UserMail", email);
			session.setAttribute("User_Num", user.getUser_num());
			vo.setUser_num(user.getUser_num());
			userMainService.lastLoginCheck(vo);
			return "redirect:login.com";
		}else {
			// ���̹� ȸ�� ����
			vo.setUser_email(email);
			vo.setNickname(nickname);
			vo.setUser_pw("naver");
			userService.insertUser(vo);
			System.out.println("���̹� ȸ������ ����");
			
			UserVO nuser = userMainService.checkUserByNaver(vo);
			vo.setUser_num(nuser.getUser_num());
			userMainService.lastLoginCheck(vo);
			
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
				UserVO user = userMainService.checkUserByNaver(vo);
				
				if(user!=null) { // ȸ�������� �ִ� ���
					session.setAttribute("UserMail", kaemail);
					session.setAttribute("User_Num", user.getUser_num());
					//session.setAttribute("User_img", user.getUser_img());
					vo.setUser_num(user.getUser_num());
					userMainService.lastLoginCheck(vo);
					return "redirect:login.com";
					
				}else { // ȸ�������� ���°�� ȸ������
					System.out.println("īī�� ȸ������ ����");
					vo.setUser_email(kaemail);
					vo.setNickname(kanickname);
					vo.setUser_pw("kakao");
					userService.insertUser(vo);
					System.out.println("īī�� ȸ������ ����");
					
					UserVO nuser = userMainService.checkUserByNaver(vo);
					vo.setUser_num(nuser.getUser_num());
					userMainService.lastLoginCheck(vo);
					
					session.setAttribute("UserMail", kaemail);
					session.setAttribute("User_Num", nuser.getUser_num());
					
					return "redirect:main.com";
				}
			}

			UserVO user = userService.checkUser(vo);
			System.out.println(user.getUser_num());
			
				
			if(user != null) {
				System.out.println("�Ϲ� �α��� ����");
				session.setAttribute("UserMail", user.getUser_email());
				session.setAttribute("User_Num", user.getUser_num());
				session.setAttribute("User_img", user.getUser_img());
				//model.addAttribute("Usercode", vo.getUser_email());
				model.addAttribute("member", vo); // member ����
				vo.setUser_num(user.getUser_num());
				userMainService.lastLoginCheck(vo); // �����α��� ��¥ ������Ʈ
				
				String url = "";
				// ���ǿ� ����Ǿ��ִ� lasturl�� ���ͼ� �� �������� �����̷�Ʈ ��Ų��.
				if(session.getAttribute("login_id") == null) {
					
				}else {
					url = (String) session.getAttribute("lasturl");
					System.out.println(url);
					if(url.equals("signUp.com")) {
						return "redirect:main.com";
					}
				}
				// (��ٱ��Ͽ� �ִ� ������ ���� ��� �������� ó�� ����)
				return "redirect:"+url;
			
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

}
