package ozo.spring.house.user.service;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;


@Service("naverLoginService")
@PropertySource("classpath:config/naverlogin.properties")
public class NaverLoginService {
	
	@Value("${CLIENT_ID}")
	private String CLIENT_ID;
	
	@Value("${CLIENT_SECRET}")
	private String CLIENT_SECRET;
	
	@Value("${REDIRECT_URI}")
	private String REDIRECT_URI;
	
	@Value("${SESSION_STATE}")
	private String SESSION_STATE;
	
	@Value("${PROFILE_API_URL}")
	private String PROFILE_API_URL;
	
	/* ���̹� ���̵�� ���� url ���� method */
	public String getAuthorizationUrl(HttpSession session) {
		
		String state = generateRandomString();
		setSession(session, state);
		
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI).state(state)
				.build(NaverLoginApi.instance());
		
		return oauthService.getAuthorizationUrl();
	}
	
	/* ���̹� ���̵�� callback ó�� �� accesstoken ȹ�� method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state)throws IOException{
		
		String sessionState = getSession(session);
		
		// StringUtils �̰� �Ƹ����� ������� �ٲ���ϳ� �����غ���
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
	
	/* Access Token�� �̿��Ͽ� ���̹� ����� ������ API�� ȣ�� */
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
