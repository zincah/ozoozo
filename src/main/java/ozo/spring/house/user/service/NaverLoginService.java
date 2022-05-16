package ozo.spring.house.user.service;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;



@Service
public class NaverLoginService {
	
	private final static String CLIENT_ID = "vwDrylFpGE2QwqTy6okk";
	private final static String CLIENT_SECRET = "K7GFtiaxUC";
	private final static String REDIRECT_URI = "http://localhost:8080/house/nalogin.com";
	private final static String SESSION_STATE = "oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	/* 네이버 아이디로 인증 url 생성 method */
	public String getAuthorizationUrl(HttpSession session) {
		
		String state = generateRandomString();
		setSession(session, state);
		
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI).state(state)
				.build(NaverLoginApi.instance());
		
		return oauthService.getAuthorizationUrl();
	}
	
	/* 네이버 아이디로 callback 처리 및 accesstoken 획득 method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state)throws IOException{
		
		String sessionState = getSession(session);
		
		// StringUtils 이거 아마존도 물어보던데 바꿔야하나 생각해보기
		if(StringUtils.pathEquals(sessionState, state)) {
			
			OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI).state(state).build(NaverLoginApi.instance());
			
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		
		return null;
	}
	
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{
	OAuth20Service oauthService =new ServiceBuilder()
			.apiKey(CLIENT_ID)
			.apiSecret(CLIENT_SECRET)
			.callback(REDIRECT_URI).build(NaverLoginApi.instance());
	OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
	oauthService.signRequest(oauthToken, request);
	Response response = request.send();
	return response.getBody();
	}
	
	

	

}
