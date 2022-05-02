package ozo.spring.house.seller.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	
	// product table
	private int product_id;
	private int seller_id;
	private int pro_catecode;
	private String product_title;
	private String product_uniqueimg;
	private int product_price;
	private Timestamp product_created;
	private Timestamp product_updated;
	private int pro_subcatecode;
	private int product_seller_code;
	private int product_quantity;
	private int product_postid; //postid¿Í ¿¬°á
	
	// product_status table
	private int status_id;
	private int st_product_id;
	private String status;
	private boolean product_del;
	
	// product_posting table
	private int post_id;
	private boolean today_deal;
	private boolean best_product;
	private float star_ratio;
	private String post_name;
	private int sale_ratio;
	private int whole_price;
	private String post_content;
	private String shipping_info1;
	private String shipping_info2;
	private String refund_content;
	private int post_sellerid;
	
	// option table
	private int option_id;
	private int op_productid;
	private String option1_name;
	private String option1;
	private String option2_name;
	private String option2;
	
	// product_detail
	private int detail_id;
	private String detail_content;
	private String detail_table;
	private int prodetail_postid;
	
	// product_photo
	private int photo_id;
	private String photo_url;
	private Timestamp photo_uploaddate;
	private int photo_seq;
	private boolean photo_separate;
	private int photo_postid;
	
	

}
