package ozo.spring.house.user.vo;

import java.util.List;

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
	
	// category 선별
	private int checksub;
	
	// 중분류
	private int midcate_code;
	
	// filtering
	private int filter_id;
	private int filter_depth;
	private String filter_name;
	private int ftop_catecode;
	
	// 상품 디테일 정보
	private int detail_id;
	private String detail_name;
	private int detail_value;
	private int dtop_catecode;
	private int dprodetails_postid;
	
	// 배열로 넘기기
	private List<String> filtering;
	private List<Integer> post_ids;
	
	// paging
	private int thispage;
	
	
	
}
