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
	private int registration_num; // ����ڵ�Ϲ�ȣ
	private Timestamp entry_date; // ������
	private String seller_representpic; // �귣�� ��ǥ ����
	private String seller_status; // ����� ����
	
	private float brandstar; // �귣�� ���� 
	
	List<Integer> sellerList; // sellerid ���� ����
}
