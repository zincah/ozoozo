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
	private String post_content;
	private String shipping_info1;
	private String shipping_info2;
	private String refund_content;
	
	private int post_sellerid;
	private int po_category;
	private int po_subcate;

	private int product_EA;
	private int cart_quantity;
	private int post_shipfee;
	private int product_shipfee;
	
	private int post_couponid;
	// 할인율
	private String sale_price;
	
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
	private String shop_tell;
	
	private String option;
	
	
	 // option table
	private int option_id;
	private int op_productid;
	private String option1_name;
	private String option1;
	private String option2_name;
	private String option2;
	
	private int product_id;
	
	// 오늘의 딜 table
	private int deal_id;
	private int deal_postid;
	private String deal_status;
	private int deal_originprice;
	private int deal_saleratio;
	private int deal_saleprice;

	//필요하면 쓰는 임의 값
	private String exStr;
	private int Int;
	
	private boolean checkit; // scrap
	
	// paging 과 ranking
	private int thispage;
	private String orderKind;
}
