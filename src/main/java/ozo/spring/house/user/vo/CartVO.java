package ozo.spring.house.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {
	private int cart_product;
	private int cart_post;
	private int cart_payment;
	private int cart_quantity;
	
	private int cart_user;
	private int cart_seller;
	
	// 검사문에 쓰일 변수
	private int product_id;
	private int seller_id;
	private int product_price;
	private int EA;
	private int product_shipfee;
	
}
