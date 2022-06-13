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

    // user can see product list that they can write
	@RequestMapping(value = "/review.com")
	public String writeReview(UserPaymentLogVO vo, Model model, HttpServletRequest request) {
		System.err.println("[Log] --- Review Controller >>>>> writeReview Method");
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			
			// user setting
			int user_num = (Integer)session.getAttribute("User_Num");
			vo.setUser_num(user_num);
			
			// after confirm their purchase -> get this list
			List<Map<String, String>> prereviewlist = mypageservice.listofobject(vo);
			model.addAttribute("prereviewlist", prereviewlist);

			return "oZo_MyReview";
		}
		return "login.com";
	}
	
	// review write dialog
	@ResponseBody
	@RequestMapping(value = "/getReviewInfo.com", method=RequestMethod.POST)
	public String getReviewInfo(@RequestBody String code,UserPaymentLogVO vo, Model model, HttpServletRequest request) {
		System.err.println("[Log] --- Review Controller >>>>> getReviewInfo Method");
		
		// user setting
		HttpSession session = request.getSession();
		int user_num = (Integer)session.getAttribute("User_Num");
		vo.setUser_num(user_num);
		
		// order_id setting
		int order_id = Integer.parseInt(code.replace("\"", ""));
		vo.setOrder_id(order_id);
		
		// get product information
		Map<String, String> map = mypageservice.getReviewInfo(vo);
		
		// information formatted json
		String jsonmap;
		try {
			jsonmap = new ObjectMapper().writeValueAsString(map);
		}catch(JsonProcessingException e) {
			jsonmap = null;
			e.printStackTrace();
		}

		return jsonmap;
	}

	// upload photo first
    @ResponseBody
    @RequestMapping(value="/uploadReview.com", method= RequestMethod.POST)
    public String uploadPhotos(@RequestParam(value="reviewphoto", required = false) MultipartFile review){
    	System.err.println("[Log] --- Review Controller >>>>> uploadPhotos Method");
        
    	if(review != null) {
    		System.out.println("review size : " + review);
        	//setting directory name
        	String dirName = "photoReview";
            String url = "";
        	
        	try {
                String key = review.getOriginalFilename();
                InputStream is = review.getInputStream();
                String contentType = review.getContentType();
                long contentLength = review.getSize();

                // aws upload and return file full name
                url = client.upload(is, key, contentType, contentLength, dirName);

            }catch(Exception e) {
                e.printStackTrace();
                
            }
        	
        	return url;
        	
        }
        
        return "nofile";

    }
    
    // insert review
    @RequestMapping(value="/reviewInsert.com", method= RequestMethod.POST)
    public String reviewInsert(ReviewVO vo, HttpServletRequest request){
    	System.err.println("[Log] --- Review Controller >>>>> reviewInsert Method");

    	// user setting
    	HttpSession session = request.getSession();
    	vo.setReuser_num((Integer)session.getAttribute("User_Num"));
    	
    	// insert review
    	mypageservice.insertReview(vo);

    	return "redirect:review.com";
    }
    
    // this page show user own review
	@RequestMapping(value = "/reviewLog.com")
	public String reviewView(HttpServletRequest request, ReviewVO vo, Model model) {
		System.err.println("[Log] --- Review Controller >>>>> reviewView Method");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			
			// user setting
			int user_num = (Integer)session.getAttribute("User_Num");
			vo.setReuser_num(user_num);
			
			// get review list
			List<Map<String, String>> myreviewlist = mypageservice.selectMyReview(vo);
			model.addAttribute("myreviewlist", myreviewlist);

			return "oZo_MyReviewLog";
			
		}
		return "login.com";
	}
	
	// review modify dialog
    @ResponseBody
    @RequestMapping(value="/getMyReview.com", method= RequestMethod.POST)
    public String getMyReview(@RequestBody String code, ReviewVO vo){
    	System.err.println("[Log] --- Review Controller >>>>> getMyReview Method");

    	// review_id setting
		int review_id = Integer.parseInt(code.replace("\"", ""));
		vo.setReview_id(review_id);
    	
		// get review information
		Map<String, String> map = mypageservice.selectMyReviewOne(vo);
		
		// change json type
		String jsonmap;
		try {
			jsonmap = new ObjectMapper().writeValueAsString(map);
		}catch(JsonProcessingException e) {
			jsonmap = null;
			e.printStackTrace();
		}

		return jsonmap;

    }

    // review modify process
    @RequestMapping(value="/reviewModify.com", method= RequestMethod.POST)
    public String reviewModify(ReviewVO vo, HttpServletRequest request){
    	System.err.println("[Log] --- Review Controller >>>>> reviewModify Method");
    	
    	HttpSession session = request.getSession();
    	if(session.getAttribute("User_Num")!=null) {

    		// review update
    		mypageservice.updateReview(vo);
        	
    		try {
            	// if change photo -> delete photo in aws
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

    // review liked process
    @ResponseBody
    @RequestMapping(value="/likedReview.com", method= RequestMethod.POST)
    public String likedReview(@RequestBody String reviewid, ReviewVO vo, HttpServletRequest request){
    	System.err.println("[Log] --- Review Controller >>>>> likedReview Method");
    	HttpSession session = request.getSession();
    	
    	if(session.getAttribute("User_Num")!=null) {
    		
    		// review_id setting
    		vo.setReview_id(Integer.parseInt(reviewid.replace("\"", "")));
    		
    		// return liked count
    		int liked = mypageservice.updateLiked(vo);
    		
    		// liked count change process
    		Map<String, Integer> changeLike = new HashMap<String, Integer>();
    		changeLike.put("review_id", vo.getReview_id());
    		changeLike.put("liked", liked);

    		// change json type
    		String jsonmap = JSONObject.toJSONString(changeLike);
    		return jsonmap;
    		
    	}else {
    		
    		// not login -> return fail
    		Map<String, String> remap = new HashMap<String, String>();
    		remap.put("fail", "fail");
    		
    		// change json type
    		String jsonremap = JSONObject.toJSONString(remap);
    		return jsonremap;
    	}

    }


}
