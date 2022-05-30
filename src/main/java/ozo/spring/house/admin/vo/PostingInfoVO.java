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
public class PostingInfoVO { // posting 관련 vo
	
	private List<Map<String, String>> productlist; // 등록된 상품 lists
	private List<Integer> optionnums; // 관련된 option list
	private ProductDetailVO detail; // 상품 상세 정보 (table)
	private List<Map<String, String>> photolist; // 상품 사진 list

}
