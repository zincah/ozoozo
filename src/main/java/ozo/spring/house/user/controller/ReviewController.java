package ozo.spring.house.user.controller;

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
import ozo.spring.house.user.service.ReviewService;
import ozo.spring.house.user.vo.ReviewVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;
import ozo.spring.house.user.vo.UserVO;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @Autowired
    AwsS3 client;

    // 리뷰 첫 페이지 (내가 써야할 리뷰 목록이 보이는 화면)
	@RequestMapping(value = "/review.com")
	public String writeReview(UserPaymentLogVO vo, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			
			int user_num = (Integer)session.getAttribute("User_Num");
			vo.setUser_num(user_num);
			List<Map<String, String>> prereviewlist = reviewService.listofobject(vo);
			model.addAttribute("prereviewlist", prereviewlist);

			return "myReview";
		}
		return "login.com";
	}
	
	// 리뷰 쓸 정보 얻어오기
	@ResponseBody
	@RequestMapping(value = "/getReviewInfo.com", method=RequestMethod.POST)
	public String getReviewInfo(@RequestBody String code,UserPaymentLogVO vo, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int user_num = (Integer)session.getAttribute("User_Num");
		vo.setUser_num(user_num);
		
		int order_id = Integer.parseInt(code.replace("\"", ""));
		vo.setOrder_id(order_id);
		
		Map<String, String> map = reviewService.getReviewInfo(vo);
		String jsonmap;
		try {
			jsonmap = new ObjectMapper().writeValueAsString(map);
		}catch(JsonProcessingException e) {
			jsonmap = null;
			e.printStackTrace();
		}

		return jsonmap;
	}

	// 리뷰 쓰기 사진 업로드
    @ResponseBody
    @RequestMapping(value="/uploadReview.com", method= RequestMethod.POST)
    public String uploadPhotos(@RequestParam(value="reviewphoto", required = false) MultipartFile review){

        System.out.println("file upload ready");
        String dirName = "photoReview";
        String url = "";

        if(review != null) {
        	
        	try {
                String key = review.getOriginalFilename();
                System.out.println("filename --> " +key);
                InputStream is = review.getInputStream();
                String contentType = review.getContentType();
                long contentLength = review.getSize();

                url = client.upload(is, key, contentType, contentLength, dirName);
                System.out.println(url);
                System.out.println("aws main file upload complete");

            }catch(Exception e) {
                e.printStackTrace();
                
            }
        	
        }
        
        return url;

    }
    
    // 리뷰 작성
    @RequestMapping(value="/reviewInsert.com", method= RequestMethod.POST)
    public String reviewInsert(ReviewVO vo, HttpServletRequest request){

    	//ORDER ID 에 리뷰 썼다고 처리
    	//REVIEW insert
    	HttpSession session = request.getSession();
    	vo.setReuser_num((Integer)session.getAttribute("User_Num"));
    	
    	System.out.println(vo);
    	reviewService.insertReview(vo);

    	return "redirect:review.com";
    }
    
	@RequestMapping(value = "/review_view.com")
	public String reviewView(HttpServletRequest request, ReviewVO vo, Model model) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			
			int user_num = (Integer)session.getAttribute("User_Num");
			vo.setReuser_num(user_num);
			List<Map<String, String>> myreviewlist = reviewService.selectMyReview(vo);
			model.addAttribute("myreviewlist", myreviewlist);

			//System.out.println(myreviewlist);
			
			return "myReview-view";
			
		}
		return "login.com";
	}
	
	// 내 리뷰 수정 전 불러오기
    @ResponseBody
    @RequestMapping(value="/getMyReview.com", method= RequestMethod.POST)
    public String getMyReview(@RequestBody String code, ReviewVO vo){


		int review_id = Integer.parseInt(code.replace("\"", ""));
		vo.setReview_id(review_id);
    	
		Map<String, String> map = reviewService.selectMyReviewOne(vo);
		String jsonmap;
		try {
			jsonmap = new ObjectMapper().writeValueAsString(map);
		}catch(JsonProcessingException e) {
			jsonmap = null;
			e.printStackTrace();
		}
		
		System.out.println(jsonmap);

		return jsonmap;

    }



}
