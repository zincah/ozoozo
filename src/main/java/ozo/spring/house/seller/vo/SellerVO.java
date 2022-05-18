package ozo.spring.house.seller.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SellerVO {
	
	private int seller_id;
	private int user_id;
	private String company_name;
	private String representative;
	private String address;
	private String shop_tell;
	private String email;
	private int registration_num; // 사업자등록번호
	private Timestamp entry_date; // 입점일
	private String seller_representpic; // 브랜드 대표 사진
	private String seller_status; // 사업자 상태
	
	private float brandstar; // 브랜드 별점 
	
	List<Integer> sellerList; // sellerid 정보 저장
}
