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
		//System.out.println("이메일 저장 정보" +vo.getUser_email());
		userService.insertUser(vo);
		return "redirect:login.com";
		
		// return "redirect:signUp.com";
		
	}
	
	
	// 네이버 로그인 callback 메소드
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
			// 네이버 회원 가입
			vo.setUser_email(email);
			vo.setNickname(nickname);
			vo.setUser_pw("naver");
			userService.insertUser(vo);
			System.out.println("네이버 회원가입 성공");
			
			UserVO nuser = userMainService.checkUserByNaver(vo);
			vo.setUser_num(nuser.getUser_num());
			userMainService.lastLoginCheck(vo);
			
			session.setAttribute("UserMail", email);
			session.setAttribute("User_Num", nuser.getUser_num());
			return "redirect:main.com";
		}

		
	}
	
	// 네이버 로그인 메소드
	@RequestMapping(value = "/login.com", method=RequestMethod.GET)
	public String loginView(HttpSession session, HttpServletRequest request, Model model) {

		String naverAuthUrl = naverLoginService.getAuthorizationUrl(session);
		//System.out.println("네이버:"+naverAuthUrl);
		model.addAttribute("naverurl", naverAuthUrl);
		
		
		// 이전 페이지 정보를 얻어와서 String url에 저장해준다.
		if(request.getHeader("Referer")!=null) {
			String referer = request.getHeader("Referer");
			String[] urls = referer.split("/");
			String url = urls[urls.length-1];
			// 세션에 lasturl이라는 이름으로 저장
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

			// log 처리
			System.out.println("login controller");
			
			// 카카오 로그인 구현
			if(request.getParameter("kanickname")!="") {
				System.out.println("카카오 로그인 시작");
				String kaemail = request.getParameter("kaemail"); // 이메일 동의 안할경우 생각
				String kanickname = request.getParameter("kanickname");
				
				vo.setUser_email(kaemail);
				UserVO user = userMainService.checkUserByNaver(vo);
				
				if(user!=null) { // 회원정보가 있는 경우
					session.setAttribute("UserMail", kaemail);
					session.setAttribute("User_Num", user.getUser_num());
					//session.setAttribute("User_img", user.getUser_img());
					vo.setUser_num(user.getUser_num());
					userMainService.lastLoginCheck(vo);
					return "redirect:login.com";
					
				}else { // 회원정보가 없는경우 회원가입
					System.out.println("카카오 회원가입 시작");
					vo.setUser_email(kaemail);
					vo.setNickname(kanickname);
					vo.setUser_pw("kakao");
					userService.insertUser(vo);
					System.out.println("카카오 회원가입 성공");
					
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
				System.out.println("일반 로그인 시작");
				session.setAttribute("UserMail", user.getUser_email());
				session.setAttribute("User_Num", user.getUser_num());
				session.setAttribute("User_img", user.getUser_img());
				//model.addAttribute("Usercode", vo.getUser_email());
				model.addAttribute("member", vo); // member 정보
				vo.setUser_num(user.getUser_num());
				userMainService.lastLoginCheck(vo); // 최종로그인 날짜 업데이트
				
				String url = "";
				// 세션에 저장되어있는 lasturl을 얻어와서 그 페이지로 리다이렉트 시킨다.
				if(session.getAttribute("login_id") == null) {
					
				}else {
					url = (String) session.getAttribute("lasturl");
					System.out.println(url);
					if(url.equals("signUp.com")) {
						return "redirect:main.com";
					}
				}
				// (장바구니에 있는 정보는 같이 어떻게 보낼지는 처리 안함)
				return "redirect:"+url;
			
			}
			
			String msg = "입력하신 정보가 잘못 되었습니다.";
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
				String msg = "로그인후 이용 가능합니다.";
				model.addAttribute("msg", msg);
				return "ozoLogin_zinc";
			}
		}
		
		@ResponseBody
		@RequestMapping(value = "/Duplicate_Check_Email.com", method=RequestMethod.POST)
		public Boolean checkEmail(@RequestBody String Email, UserVO vo) {
			String email = Email.replace("\"", "");
			System.out.println("사용자가 입력한 E-mail : "+ email);
			vo.setUser_email(email);
			return userService.Duplicate_Check_Email(vo);
		}
		
		@ResponseBody
		@RequestMapping(value = "/Duplicate_Check_Nickname.com", method=RequestMethod.POST)
		public Boolean checkNickname(@RequestBody String Nickname, UserVO vo) {
			String nickname = Nickname.replace("\"", "");
			System.out.println("사용자가 입력한 nickname : "+ nickname);
			vo.setNickname(nickname);
			return userService.Duplicate_Check_Nickname(vo);
		}
		
		@ResponseBody
		@RequestMapping(value = "/userPassword_change.com", method=RequestMethod.POST)
		public String changePassword(@RequestParam("change_pass") String change_pass, UserVO vo, HttpSession session) {
			String pass = change_pass.replace("\"", "");
			System.out.println("바꾸고자 하는 비밀번호 : "+ pass +"\n");
			String email = (String) session.getAttribute("UserMail");
			System.out.println(email);
			vo.setUser_pw(pass);
			vo.setUser_email(email);
			userService.change_pass(vo);
			return "redirect:mypage.com";
		}
		
		//회원가입 페이지
		@RequestMapping(value = "/signUp.com")
		public String user_signUp(UserVO vo, Model model, HttpSession session) {
			
			// 네이버 로그인 버튼 클릭시
			String naverAuthUrl = naverLoginService.getAuthorizationUrl(session);
			//System.out.println("네이버:"+naverAuthUrl);
			model.addAttribute("naverurl", naverAuthUrl);
			
			// 카카오
			
			// 구글
			
			
			return "SignUp";
		}

}
