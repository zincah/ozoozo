package ozo.spring.house.user.vo;

import java.sql.Timestamp;

public class ScrapVO {

	private int sc_usernum;
	private int sc_postid;
	
	// product_photo
		private int photo_id;
		private String photo_url;
		private Timestamp photo_uploaddate;
		private int photo_seq;
		private boolean photo_separate;
		private int photo_postid;
		
	// product_posting table
		private int post_id;
		private boolean today_deal; //boolean은 getter가 get이 아닌 is, setter는 set
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
		private int po_category;
		private int po_subcate;
		private String post_status;
		private int post_couponid;
		private Timestamp post_created;
		private int post_shipfee;
		
		private String cate_name;
	
	 // seller
		private String company_name;
		private int seller_id;
		private int product_catecode;
		private int product_subcatecode;
		private String product_title; 
		private String product_img;
		private int product_price;
		private String seller;
		private String product_content;
		private String product_table;
		private String product_postid;
		
		private String option;
}
