package ozo.spring.house.seller.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CategoryVO {
	
	// ���߿� user������ ����ϴµ�...
	
	// big
	private int cate_code;
	private String cate_name;
	
	// small
	private int subcate_code;
	private int depth;
	private String subcate_name;
	private int top_catecode;

}
