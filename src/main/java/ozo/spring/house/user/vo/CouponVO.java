package ozo.spring.house.user.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponVO {
	private int coupon_id;
	private String coupon_title;
	private String coupon_subtitle;
	private Timestamp coupon_startdate;
	private Timestamp coupon_enddate;
	private int coupon_discount;
	private int coupon_more;
	
	//insert 에 쓰일것
	private int user_usernum;
	private int user_couponid;
	private boolean user_couponstatus;
	private int user_copostid;
	
	
}
