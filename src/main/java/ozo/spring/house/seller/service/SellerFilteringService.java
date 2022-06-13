package ozo.spring.house.seller.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.vo.ProductDetailVO;

@Service
public class SellerFilteringService {
	
	@Autowired
	SellerProductDetailService detailService;
	
	private String[] filter_name = {"색상", "우드톤", "소재", "사용공간", "상품유형", "리퍼상품유무"};
	
	public void setFilter(Map<String, Object> getMap, int topCate, int postCode) {
		
		// postingcode와 topcategory 를 전달받아서 세팅
		
		List<String> keyList = new ArrayList<String>();
		ProductDetailVO vo = new ProductDetailVO();
		
		for(String key : getMap.keySet()) {
			keyList.add(key);
		}
		
		for(int i=0; i<keyList.size(); i++) {
			String key = keyList.get(i);
			List<Object> value = (List<Object>) getMap.get(key);
			
			
			
			if(value.size()==0) {
				System.out.println(key + "의 값은 아무것도 없음");
			}else {
				for(int j=0; j<value.size(); j++) {
					vo.setDetail_name(key);
					vo.setDetail_value(Integer.valueOf((String)value.get(j)));
					vo.setDprodetails_postid(postCode);
					vo.setDtop_catecode(topCate);
					detailService.insertDetails(vo);
				}
			}
		}
		
		
		
	}
	

	
}
