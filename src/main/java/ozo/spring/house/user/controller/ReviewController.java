package ozo.spring.house.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import ozo.spring.house.seller.service.AwsS3;
import ozo.spring.house.user.service.ReviewService;
import ozo.spring.house.user.vo.ReviewVO;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @Autowired
    AwsS3 client;

    @RequestMapping(value = "/userreview.com")
    public String user_Review(Model model, ReviewVO vo){
        List<ReviewVO> list;
        vo.setUser_num(100004);
        list = reviewService.myReviewList(vo);

        for(int i=0; i<list.size(); i++){
            ReviewVO review = list.get(i);
            System.out.println(review.getContent());
            System.out.println(review.getUser_num());
            System.out.println(review.getCreated_at());
        }
        model.addAttribute("list", list);

        return "myReview-view";
    }

    /*
    사진업로드
     */

    @ResponseBody
    @RequestMapping(value="/uploadReview.com", method= RequestMethod.POST)
    public String uploadPhotos(@RequestParam(value="reviewphoto") MultipartFile review){

        Map<String, Object> result = new HashMap<String, Object>();

        // 넘어온 file list 가 없을 때 인식해주기

        System.out.println("file upload ready");
        String dirName = "photoReview";

        try {
            String key = review.getOriginalFilename();
            System.out.println("filename --> " +key);
            InputStream is = review.getInputStream();
            String contentType = review.getContentType();
            long contentLength = review.getSize();

            String url = client.upload(is, key, contentType, contentLength, dirName);
            System.out.println(url);
            System.out.println("aws main file upload complete");

        }catch(Exception e) {
            e.printStackTrace();
        }


        return "success";

    }



    /*
    리뷰내용 업로드
     */


}
