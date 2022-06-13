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
public class PostingInfoVO { // posting ���� vo
	
	private List<Map<String, String>> productlist; // ��ϵ� ��ǰ lists
	private List<Integer> optionnums; // ���õ� option list
	private ProductDetailVO detail; // ��ǰ �� ���� (table)
	private List<Map<String, String>> photolist; // ��ǰ ���� list

}
