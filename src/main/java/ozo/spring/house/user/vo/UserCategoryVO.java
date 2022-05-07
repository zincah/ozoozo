package ozo.spring.house.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserCategoryVO {
	
	private int cate_code;
	private String cate_name;
	private int subcate_code;
	private int sub_depth;
	private String subcate_name;
	private int top_catecode;
	
	
	
	
}
