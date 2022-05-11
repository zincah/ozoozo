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
}
