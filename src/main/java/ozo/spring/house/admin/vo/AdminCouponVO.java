package ozo.spring.house.admin.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminCouponVO {
	
	private int coupon_id;
	private String coupon_title;
	private String coupon_subtitle;
	private String coupont_type;
	private Timestamp coupon_create;
	private Timestamp coupon_update;
	private Timestamp coupon_startdate;
	private Timestamp coupon_enddate;
	private String coupon_status;

}