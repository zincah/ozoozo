package ozo.spring.house.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	// paging 할 수 있는 vo
	// 검색의 기준
	
	private int pageNum; // 페이지 번호
	private int amount; // 페이지당 게시물 수
	
	public Criteria() {
		// 기본 생성자를 통해서 기본값 1페이지, 10개단위로 지정해서 처리
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	

}
