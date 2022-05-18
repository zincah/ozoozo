package ozo.spring.house.admin.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.admin.service.AdminUserManageService;
import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class AdminUserManageController {
	
	@Autowired
	AdminUserManageService userManage;
	
	// 회원관리 로딩시 처음으로 정보를 가지고 오는 mapping
	@RequestMapping(value = "/memberManagement.admin")
	public String memberManagementView(HttpServletRequest request, UserVO vo, Model model, Criteria cri) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {

			vo.setCri(cri); // 페이징 설정
			List<UserVO> userList = userManage.getUserList(vo);
			int total = userManage.getUserListCount(vo);
			System.out.println("total : " + total);
			
			model.addAttribute("userList", userList);
			model.addAttribute("totalcount", total); // 총 개시물 수 전달
			model.addAttribute("pageMaker", cri); // 페이징 정보 전달
			
			return "memberManagement_dh";
		}else {
			return "adminLogin_dj";
		}
	}
	
	// 회원 타입 선택시 정보를 가지고 오는 mapping
	@RequestMapping(value = "/getUserList.admin", method=RequestMethod.POST)
	public String getUserList(@RequestBody Map<String, String> searchMap, UserVO vo, Model model, Criteria cri) {
		
		List<UserVO> userList = new ArrayList<UserVO>();
		
		System.out.println(searchMap);
		int pageNum = Integer.parseInt(searchMap.get("pageNum"));
		
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));
		
		cri = new Criteria(pageNum, 10);
		vo.setCri(cri);
		
		userList = userManage.getUserList(vo);
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo));

		return "users";
	}
	

	@RequestMapping(value = "/updateUserStatus.admin", method=RequestMethod.POST)
	public String updateUserStatus(@RequestBody List<String> usernumlist, UserVO vo, Model model, Criteria cri) {

		List<UserVO> userList = new ArrayList<UserVO>(); // 받아오는 정보 저장하는 list

		String user_status = usernumlist.get(usernumlist.size()-1);
		vo.setUser_status(user_status);
		
		for(int i=0; i<usernumlist.size()-2; i++) {
			vo.setUser_num(Integer.parseInt(usernumlist.get(i)));
			userManage.updateUserStatus(vo);
		}
		
		cri = new Criteria(Integer.parseInt(usernumlist.get(usernumlist.size()-2)), 10);
		vo.setCri(cri);
		
		userList = userManage.getUserList(vo);
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo));

		return "users";
	}
	
	@RequestMapping(value = "/useSearchBox.admin", method=RequestMethod.POST)
	public String useSearchBox(@RequestBody Map<String, String> searchMap, UserVO vo, Criteria cri, Model model) {

		List<UserVO> userList = new ArrayList<UserVO>(); // 받아오는 정보 저장하는 list

		System.out.println(searchMap);
		int pageNum = Integer.parseInt(searchMap.get("pageNum"));
		
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));
		
		cri = new Criteria(pageNum, 10);
		vo.setCri(cri);
		
		userList = userManage.getUserList(vo);
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo));

		return "users";
	}
	
	@RequestMapping(value = "/moveUserPaging.admin", method=RequestMethod.POST)
	public String moveUserPaging(@RequestBody Map<String, String> searchMap, UserVO vo, Criteria cri, Model model) {

		List<UserVO> userList = new ArrayList<UserVO>(); // 받아오는 정보 저장하는 list

		System.out.println(searchMap);
		int pageNum = Integer.parseInt(searchMap.get("pageNum"));
		
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));
		
		cri = new Criteria(pageNum, 10);
		vo.setCri(cri);
		
		userList = userManage.getUserList(vo);
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo));

		return "users";
	}
	
	/* 입점 매장 관리 */
	@ResponseBody
	@RequestMapping(value = "/getSellerInfo.admin", method=RequestMethod.POST)
	public SellerVO getSellerInfo(@RequestBody Map<String, String> sellercode, SellerVO vo) {
		
		vo.setSeller_id(Integer.parseInt(sellercode.get("seller_id")));
		SellerVO seller = userManage.getSellerInfo(vo);

		return seller;
	}
	

	@RequestMapping(value = "/updateSellerStatus.admin", method=RequestMethod.POST)
	public String updateSellerStatus(@RequestBody List<String> sellercode, SellerVO vo, Model model) {
		
		List<Integer> sellerList = new ArrayList<Integer>();
		vo.setSeller_status(sellercode.get(0));
		
		for(int i=1; i<sellercode.size(); i++) {
			sellerList.add(Integer.parseInt(sellercode.get(i)));
		}
		vo.setSellerList(sellerList);
		
		if(sellerList.size() != 0) {
			userManage.sellerStatusUpdate(vo);
			List<SellerVO> list = userManage.selectSellerList(vo);
			model.addAttribute("sellerList", list);
		}
		
		return "sellerList";
	}
	
	@RequestMapping(value = "/sellerSearchBox.admin", method=RequestMethod.POST)
	public String sellerSearchBox(@RequestBody Map<String, String> searchMap, SellerVO vo, Model model) {
		
		System.out.println(searchMap);
		
		vo.setSeller_status(searchMap.get("status"));
		vo.setRanking(searchMap.get("ranking"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setKeyword(searchMap.get("keyword"));

		System.out.println(searchMap.get("keyword"));
		List<SellerVO> sellerList = userManage.selectSellerList(vo);
		
		model.addAttribute("sellerList", sellerList);
		
		return "sellerList";
	}
	
	
	


}
