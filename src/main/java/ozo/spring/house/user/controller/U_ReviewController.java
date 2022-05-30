package ozo.spring.house.user.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import ozo.spring.house.seller.service.AwsS3;
import ozo.spring.house.user.service.U_MyPageService;
import ozo.spring.house.user.vo.ReviewVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;

@Controller
public class U_ReviewController {

    @Autowired
    U_MyPageService mypageservice;

    @Autowired
    AwsS3 client;

    // �뵳�됰윮 筌ｏ옙 占쎈읂占쎌뵠筌욑옙 (占쎄땀揶쏉옙 占쎈쑅占쎈튊占쎈막 �뵳�됰윮 筌뤴뫖以됵옙�뵠 癰귣똻�뵠占쎈뮉 占쎌넅筌롳옙)
	@RequestMapping(value = "/review.com")
	public String writeReview(UserPaymentLogVO vo, Model model, HttpServletRequest request) {
		System.err.println("[Log] --- Review Controller >>>>> writeReview Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			
			int user_num = (Integer)session.getAttribute("User_Num");
			vo.setUser_num(user_num);
			List<Map<String, String>> prereviewlist = mypageservice.listofobject(vo);
			model.addAttribute("prereviewlist", prereviewlist);

			return "oZo_MyReview";
		}
		return "login.com";
	}
	
	// �뵳�됰윮 占쎈쿈 占쎌젟癰귨옙 占쎈섯占쎈선占쎌궎疫뀐옙
	@ResponseBody
	@RequestMapping(value = "/getReviewInfo.com", method=RequestMethod.POST)
	public String getReviewInfo(@RequestBody String code,UserPaymentLogVO vo, Model model, HttpServletRequest request) {
		System.err.println("[Log] --- Review Controller >>>>> getReviewInfo Method");
		HttpSession session = request.getSession();
		int user_num = (Integer)session.getAttribute("User_Num");
		vo.setUser_num(user_num);
		
		int order_id = Integer.parseInt(code.replace("\"", ""));
		vo.setOrder_id(order_id);
		
		Map<String, String> map = mypageservice.getReviewInfo(vo);
		String jsonmap;
		try {
			jsonmap = new ObjectMapper().writeValueAsString(map);
		}catch(JsonProcessingException e) {
			jsonmap = null;
			e.printStackTrace();
		}

		return jsonmap;
	}

	// �뵳�됰윮 占쎈쾺疫뀐옙 占쎄텢筌욑옙 占쎈씜嚥≪뮆諭�
    @ResponseBody
    @RequestMapping(value="/uploadReview.com", method= RequestMethod.POST)
    public String uploadPhotos(@RequestParam(value="reviewphoto", required = false) MultipartFile review){
    	System.err.println("[Log] --- Review Controller >>>>> uploadPhotos Method");
        if(review != null) {
        	
        	String dirName = "photoReview";
            String url = "";
        	
        	try {
                String key = review.getOriginalFilename();
                //System.out.println("filename --> " +key);
                InputStream is = review.getInputStream();
                String contentType = review.getContentType();
                long contentLength = review.getSize();

                url = client.upload(is, key, contentType, contentLength, dirName);
               // System.out.println(url);

            }catch(Exception e) {
                e.printStackTrace();
                
            }
        	
        	return url;
        	
        }
        
        return "nofile";

    }
    
    // �뵳�됰윮 占쎌삂占쎄쉐
    @RequestMapping(value="/reviewInsert.com", method= RequestMethod.POST)
    public String reviewInsert(ReviewVO vo, HttpServletRequest request){
    	System.err.println("[Log] --- Review Controller >>>>> reviewInsert Method");
    	//ORDER ID 占쎈퓠 �뵳�됰윮 占쎈쓠占쎈뼄�⑨옙 筌ｌ꼶�봺
    	//REVIEW insert
    	HttpSession session = request.getSession();
    	vo.setReuser_num((Integer)session.getAttribute("User_Num"));
    	
    	//System.out.println(vo);
    	mypageservice.insertReview(vo);

    	return "redirect:review.com";
    }
    
	@RequestMapping(value = "/reviewLog.com")
	public String reviewView(HttpServletRequest request, ReviewVO vo, Model model) {
		System.err.println("[Log] --- Review Controller >>>>> reviewView Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			
			int user_num = (Integer)session.getAttribute("User_Num");
			vo.setReuser_num(user_num);
			List<Map<String, String>> myreviewlist = mypageservice.selectMyReview(vo);
			model.addAttribute("myreviewlist", myreviewlist);

			//System.out.println(myreviewlist);
			
			return "oZo_MyReviewLog";
			
		}
		return "login.com";
	}
	
	// 占쎄땀 �뵳�됰윮 占쎈땾占쎌젟 占쎌읈 �겫�뜄�쑎占쎌궎疫뀐옙
    @ResponseBody
    @RequestMapping(value="/getMyReview.com", method= RequestMethod.POST)
    public String getMyReview(@RequestBody String code, ReviewVO vo){
    	System.err.println("[Log] --- Review Controller >>>>> getMyReview Method");

		int review_id = Integer.parseInt(code.replace("\"", ""));
		vo.setReview_id(review_id);
    	
		Map<String, String> map = mypageservice.selectMyReviewOne(vo);
		String jsonmap;
		try {
			jsonmap = new ObjectMapper().writeValueAsString(map);
		}catch(JsonProcessingException e) {
			jsonmap = null;
			e.printStackTrace();
		}
		
		//System.out.println(jsonmap);

		return jsonmap;

    }

    // �뵳�됰윮 占쎈땾占쎌젟
    @RequestMapping(value="/reviewModify.com", method= RequestMethod.POST)
    public String reviewModify(ReviewVO vo, HttpServletRequest request){
    	System.err.println("[Log] --- Review Controller >>>>> reviewModify Method");
    	HttpSession session = request.getSession();
    	if(session.getAttribute("User_Num")!=null) {
    		
    		//System.out.println(vo);
    		mypageservice.updateReview(vo); // 占쎈땾占쎌젟筌ｌ꼶�봺
        	
    		try {
            	// 占쎌굙占쎌읈 占쎄텢筌욑옙 筌욑옙占쎌뒭占쎈뮉 筌ｌ꼶�봺
    			if(!vo.getLast_review_image().equals("")) {
            		String[] delurl = vo.getLast_review_image().split("/");
            		String makeDelUrl = delurl[delurl.length-2] + "/" + delurl[delurl.length-1];
        			client.delete(makeDelUrl);
    			}
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    		
    	}

    	return "redirect:reviewLog.com";
    }

    // 占쎄맒占쎄쉭占쎈읂占쎌뵠筌욑옙 �뵳�됰윮 �꽴占썹뵳占� 占쎈즲占쏙옙占쎌뵠 占쎈쨲占쎌뒄
    @ResponseBody
    @RequestMapping(value="/likedReview.com", method= RequestMethod.POST)
    public String likedReview(@RequestBody String reviewid, ReviewVO vo, HttpServletRequest request){
    	System.err.println("[Log] --- Review Controller >>>>> likedReview Method");
    	HttpSession session = request.getSession();
    	
    	if(session.getAttribute("User_Num")!=null) {
    		
    		vo.setReview_id(Integer.parseInt(reviewid.replace("\"", "")));
    		//System.out.println(vo.getReview_id());
    		
    		int liked = mypageservice.updateLiked(vo);
    		
    		Map<String, Integer> changeLike = new HashMap<String, Integer>();
    		changeLike.put("review_id", vo.getReview_id());
    		changeLike.put("liked", liked);

    		String jsonmap = JSONObject.toJSONString(changeLike);
    		return jsonmap;
    	}else {
    		Map<String, String> remap = new HashMap<String, String>();
    		remap.put("fail", "fail");
    		
    		String jsonremap = JSONObject.toJSONString(remap);
    		return jsonremap;
    	}

    }


}
