package ozo.spring.house.user.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import ozo.spring.house.user.dao.U_DAO.paymentLog_cls;
import ozo.spring.house.user.service.U_Service;
import ozo.spring.house.user.vo.UserPaymentLogVO;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
@PropertySource("classpath:config/imp.properties")
public class U_OrderLogController {
	
	@Value("${imp_secret}")
	private String secret;
	
	@Value("${imp_key}")
	private String key;
	
	@Autowired
	U_Service userservice;
	
	List<UserPaymentLogVO> pl_li = new ArrayList<UserPaymentLogVO>();
	List<UserPaymentLogVO> date_filter = new ArrayList<UserPaymentLogVO>();
	List<UserProductVO> wide_li = new ArrayList<UserProductVO>();
	
	paymentLog_cls log_cls;
	
	//결제 내역
	@RequestMapping(value = "/myshopping.com")
	public String user_myShopping(HttpSession session, Model model) {
		System.err.println("[Log] --- OrderLog Controller >>>>> user_myShopping Method");
		if(session.getAttribute("UserMail")!=null) {
			this.log_cls = userservice.get_Log_class();
			int userID = (Integer)session.getAttribute("User_Num");
			UserPaymentLogVO upvo = new UserPaymentLogVO();
			upvo.setUser_num(userID);
			log_cls.set_payment_li(upvo);
			
			this.pl_li = log_cls.get_payment_li();
			this.date_filter = log_cls.get_date_filter();
			log_cls.set_wide_li(pl_li);
			this.wide_li = log_cls.get_wide_li();
			model.addAttribute("pl_li", pl_li);
			for(int i = 0; i < pl_li.size(); i++) {
				if(pl_li.get(i).getShipfinish_date() != null) {
					String Str = String.valueOf(pl_li.get(i).getShipfinish_date());
					String[] ex = Str.substring(0,10).split("-");
					LocalDate date = LocalDate.of(Integer.parseInt(ex[0]), Integer.parseInt(ex[1]),Integer.parseInt(ex[2]));
					DayOfWeek dow = date.getDayOfWeek();
					pl_li.get(i).setDay(dow.getDisplayName(TextStyle.NARROW, Locale.KOREAN)); 
				}else {
					String Str = String.valueOf(pl_li.get(i).getOrder_date());
					String[] ex = Str.substring(0,10).split("-");
					LocalDate date = LocalDate.of(Integer.parseInt(ex[0]), Integer.parseInt(ex[1]),Integer.parseInt(ex[2]));
					DayOfWeek dow = date.getDayOfWeek();
					pl_li.get(i).setDay(dow.getDisplayName(TextStyle.NARROW, Locale.KOREAN)); 
				}
			}
			
			model.addAttribute("date_filter", date_filter);
			model.addAttribute("wide_li", wide_li);
			/*
			 * System.out.println(date_filter); System.out.println();
			 * System.out.println(pl_li); System.out.println(); System.out.println(wide_li);
			 */
			return "oZo_MyOrderLog";
		}else {
			return "oZo_LoginPage";	
		}
	}
	
	//결제 내역 js에 필요한 List
	@ResponseBody
	@RequestMapping(value = "/paymentLog_list.com", method=RequestMethod.POST)
	public List<UserPaymentLogVO> get_pl_li(){
		System.err.println("[Log] --- OrderLog Controller >>>>> get_pl_li Method");
		return pl_li;
	}
	@ResponseBody
	@RequestMapping(value = "/wide_list.com", method=RequestMethod.POST)
	public List<UserProductVO> get_wide_li(){
		System.err.println("[Log] --- OrderLog Controller >>>>> get_wide_li Method");
		return wide_li;
	}
	@ResponseBody
	@RequestMapping(value = "/date_filter.com", method=RequestMethod.POST)
	public List<UserPaymentLogVO> get_date_filter(){
		System.err.println("[Log] --- OrderLog Controller >>>>> get_date_filter Method");
		return date_filter;
	}
	
	//구매확정 DB update
	@ResponseBody
	@RequestMapping(value = "/buy_check.com", method=RequestMethod.POST)
	public String buy_check_update(@RequestBody String param) {
		System.err.println("[Log] --- OrderLog Controller >>>>> buy_check_update Method");
		log_cls.buy_check_update(param);
		return null;
	}
	
	//환불
	@ResponseBody
	@RequestMapping(value = "/refunt_request.com", method=RequestMethod.POST)
	public String refund_method(@RequestBody HashMap<String,Object> param)throws IOException {
		System.err.println("[Log] --- OrderLog Controller >>>>> refund_method Method");
		String merchant_uid = (String) param.get("merchant_uid");
		
		HttpsURLConnection conn = null;
		 
		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", key);
		json.addProperty("imp_secret", secret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();
		System.out.println(token);
		// ========================================================
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost("https://api.iamport.kr/payments/cancel");
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", merchant_uid);
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (asd.equals("null")) {
			System.err.println("환불실패");
			return "-1";
		} else {
			System.err.println("환불성공");
			return "1";
		}
	}

 // Map을 사용해서 Http요청 파라미터를 만들어 주는 함수
	private List<NameValuePair> convertParameter(Map<String, String> map){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		
		Set<Entry<String,String>> entries = map.entrySet();
		
		for(Entry<String,String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(),  entry.getValue()));
		}
		
		return paramList;
	}
	
	
	//환불 후 DB 처리
	@ResponseBody
	@RequestMapping(value = "/refunt_request_DB.com", method=RequestMethod.POST)	
	public String refund_DB_update(@RequestBody int merchant_UID) {
		System.err.println("[Log] --- OrderLog Controller >>>>> refund_DB_update Method");
		log_cls.refund_DB(merchant_UID);
		System.out.println("refund 객체 넣음");
		return null;
	}
	
	
	@RequestMapping(value = "/orders.com")
	public String user_orders(HttpSession session, Model model) {
		System.err.println("[Log] --- OrderLog Controller >>>>> user_orders Method");
		if(session.getAttribute("UserMail")!=null) {
			this.log_cls = userservice.get_Log_class();
			int userID = (Integer)session.getAttribute("User_Num");
			return "oZo_OrderLog";
		}else {
			return "oZo_LoginPage";	
		}
	}
}
