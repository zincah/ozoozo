package ozo.spring.house.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserProductVO {
	
	// product_post
	private int post_id;
	private boolean today_deal;
	private boolean best_product;
	private float star_ratio;
	private String post_name;
	private int sale_ratio;
	private int whole_price;
	private int product_id;
	private int po_category;
	private int po_subcate;
	
	private boolean photo_separate;
	private String photo_url;
	private String cate_name;
	private String subcate_name;
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
	
	
	 // option table
	private int option_id;
	private int op_productid;
	private String option1_name;
	private String option1;
	private String option2_name;
	private String option2;

}
