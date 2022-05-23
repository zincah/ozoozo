package ozo.spring.house.admin.vo;

import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import ozo.spring.house.seller.vo.ProductDetailVO;

@Getter
@Setter
@ToString
public class PostingInfoVO {
	
	private List<Map<String, String>> productlist;
	private List<Integer> optionnums;
	private ProductDetailVO detail;
	private List<Map<String, String>> photolist;

}
