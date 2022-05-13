package ozo.spring.house.admin.vo;

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
	private Timestamp startdate;
	private Timestamp enddate;
	private String pack; // 검색조건

	// paging 넣어주기
	private Criteria cri;

}
