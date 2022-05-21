package ozo.spring.house.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.dao.UserMainDAO;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserProductVO;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserDealBestController {

	@Autowired
	UserMainService userMainService;


	@RequestMapping(value = "/todaydeal.com")
	public String main_todayDeal(Model model){

		List<UserProductVO> todayDealList = userMainService.todayDealList();
		model.addAttribute("todayDealList", todayDealList);
		System.out.println("todaydealListsize"+ todayDealList.size());
		return "ozotodaydeal_zinc";
	}

	// ºê·£µå
	@RequestMapping(value = "/brandshop.com", method=RequestMethod.GET)
	public String main_shop(Model model, UserProductVO vo, HttpServletRequest request){
		
		String brandcode = request.getParameter("brandcode");
		vo.setPost_sellerid(Integer.parseInt(brandcode));
		
		if(request.getParameter("catecode") != null) {
			String[] codes = request.getParameter("catecode").split("_");
			vo.setPo_category(Integer.parseInt(codes[0]));
			
			if(codes.length == 2) {
				System.out.println("subcategory click");
				int subcate_code = Integer.parseInt(codes[1]);
				vo.setInt(subcate_code/100*100); // mid
				
				if(subcate_code%100 != 0) {
					vo.setPo_subcate(subcate_code); 
				}
			}
			
			List<List<UserCategoryVO>> sublist = userMainService.printCateList(vo);
			model.addAttribute("sublist", sublist);
			System.out.println("subli size" + sublist.size());
		}

		
		List<UserProductVO> shopItemList = userMainService.shopItemList(vo);

		for(int i=0; i<shopItemList.size(); i++){
			UserProductVO sho = shopItemList.get(i);
			int sale_price = sho.getWhole_price()*(100-sho.getSale_ratio())/100;

			DecimalFormat decFormat = new DecimalFormat("###,###");

			sho.setSale_price(decFormat.format(sale_price));
		}
		
		List<UserCategoryVO> toplist = userMainService.printTop(vo);
		SellerVO seller = userMainService.sellerInfo(vo);
		
		
		List<UserCategoryVO> others = new ArrayList<UserCategoryVO>();
		for(int i=0; i<toplist.size(); i++) {
			UserCategoryVO cate = toplist.get(i);
			
			if(cate.getCate_code() == vo.getPo_category()) {
				model.addAttribute("title", cate);
			}else {
				others.add(cate);
			}
		}
		model.addAttribute("others", others);
		
		//List<List<UserCategoryVO>> otherlist = userMainService.printCateList(vo);

		//model.addAttribute("otherlist", otherlist);
		model.addAttribute("seller", seller);
		model.addAttribute("shopItemList", shopItemList);
		model.addAttribute("toplist", toplist);
		
		return "ozoshop_main";
	}
}
