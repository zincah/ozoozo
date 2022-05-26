package ozo.spring.house.user.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserPaymentLogVO {
	private int quantity;
	private String order_status;
	private Timestamp order_date;
	private String memo;
	private int product_id;
	private int user_num;
	private int seller_id;
	private int order_num;
	private int shipping_fee;
	private int payment;
	private int address_id;
	private int od_postid;
	private int od_point;
	private int refund_id;
	private Timestamp shipfinish_date;
	private int post_id;
	// 
	private int order_id;
	
	private String day;

	private int empty_int;
	
	private int pay_ordernum;
	private String payment_way;
	private int py_sellerid;
	private int py_final;
	private int payment_total;
	private int py_discount;
	private int py_couponid;
	private int py_orderid;
}
