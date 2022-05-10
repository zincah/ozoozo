package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
public class UserPagingController {
	
	@Autowired
	UserMainService userMainService;

	@RequestMapping(value = "/getProductList.com")
	public String user_main(@RequestBody String su, UserProductVO vo, UserPagingVO pvo, Model model) {
		
		// product list 뽑기
		int pagecount = Integer.parseInt(su);
		pvo.setThispage(pagecount); // 잘감
		
		List<UserProductVO> productList = userMainService.plusProductList(pvo);

		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
			
			pro.setSale_price(decFormat.format(sale_price));
			System.out.println(pro.getPost_id());
		}
		
		model.addAttribute("productList", productList);
		model.addAttribute("pagecount", pagecount);

		return "ozomain_plus";
	}

}
