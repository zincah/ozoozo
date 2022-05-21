package ozo.spring.house.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class ReviewVO {

    private int review_id;
    private int reuser_num;
    private int reproduct_id;
    private int reseller_id;
    private int rating;
    private String review_image;
    private String recontent;
    private int liked;
    private boolean status;
    private Timestamp created_at;
    private String repost_id;
    
    // order table Ã³¸®
    private int order_id;
    private boolean review_status; // ÀÌ°Å ¸ô¶û·î


}
