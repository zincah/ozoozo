package ozo.spring.house.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	// paging �� �� �ִ� vo
	// �˻��� ����
	
	private int pageNum;
	private int amount;
	
	public Criteria() {
		// �⺻ �����ڸ� ���ؼ� �⺻�� 1������, 10�������� �����ؼ� ó��
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	

}
