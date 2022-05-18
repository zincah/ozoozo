package ozo.spring.house.admin.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import ozo.spring.house.common.Criteria;

@Getter
@Setter
@ToString
public class AdminProductVO {
	
	// posting 정리
	private int post_id;
	private String company_name;
	private String deal_status;
	private boolean best_product;
	private double star_ratio;
	private String post_name;
	private Timestamp product_created;
	private int product_count;
	private String cate_name;
	private String subcate_name;
	private String post_status;
	private int post_couponid;
	
	// posting
	private boolean today_deal;
	
	// coupon
	private int coupon_id;
	private String coupon_title;
	private String coupon_subtitle;
	
	// 날짜 검색
	private Date startdate;
	private Date enddate;
	private String pack; // 검색조건
	private String keyword; // 검색단어

	// paging 넣어주기
	private Criteria cri;
	
	// catecode 넣어주기 (오늘의딜때문에)
	private int po_category;
	private int po_subcate;
	
	// 매출 정리 payment
	private int payment;
	private int quantity;
	
	private Timestamp deal_time;
	private Timestamp deal_endtime;

	

}
