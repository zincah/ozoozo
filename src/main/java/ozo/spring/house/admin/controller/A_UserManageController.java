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
public class A_UserManageController {
	
	@Autowired
	AdminUserManageService userManage;
	
	/* 업체 관리 */
	@ResponseBody
	@RequestMapping(value = "/getSellerInfo.admin", method=RequestMethod.POST) // 업체 정보 받아오는 controller
	public SellerVO getSellerInfo(@RequestBody Map<String, String> sellercode, SellerVO vo) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> getSellerInfo 	Method");
		vo.setSeller_id(Integer.parseInt(sellercode.get("seller_id")));
		SellerVO seller = userManage.getSellerInfo(vo); // 업체 정보

		return seller;
	}
	

	@RequestMapping(value = "/updateSellerStatus.admin", method=RequestMethod.POST) // 판매자 정보 변경
	public String updateSellerStatus(@RequestBody List<String> sellercode, SellerVO vo, Model model) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> updateSellerStatus 	Method");
		List<Integer> sellerList = new ArrayList<Integer>();
		vo.setSeller_status(sellercode.get(0)); // 변경할 상태
		
		for(int i=1; i<sellercode.size(); i++) {
			sellerList.add(Integer.parseInt(sellercode.get(i))); // 체크되어서 온 seller_id
		}
		vo.setSellerList(sellerList);
		
		if(sellerList.size() != 0) {
			userManage.sellerStatusUpdate(vo); // 입점상태변경
			List<SellerVO> list = userManage.selectSellerList(vo); // 변경된 업체리스트
			model.addAttribute("sellerList", list);
		}
		
		return "sellerList";
	}
	
	@RequestMapping(value = "/sellerSearchBox.admin", method=RequestMethod.POST) // 검색처리 method
	public String sellerSearchBox(@RequestBody Map<String, String> searchMap, SellerVO vo, Model model) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> sellerSearchBox 	Method");
		vo.setSeller_status(searchMap.get("status"));
		vo.setRanking(searchMap.get("ranking"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setKeyword(searchMap.get("keyword"));
		
		System.out.println(vo);

		List<SellerVO> sellerList = userManage.selectSellerList(vo); // 검색조건을 가지고 변경된 리스트
		model.addAttribute("sellerList", sellerList);
		
		// 업체관리 검색 조건 분류 쪽 구현 안함
		return "sellerList";
	}
	
	
	
	/* 회원관리 */
	@RequestMapping(value = "/getUserList.admin", method=RequestMethod.POST) // 검색어 제외 검색 정보
	public String getUserList(@RequestBody Map<String, String> searchMap, UserVO vo, Model model, Criteria cri) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> getUserList 	Method");
		List<UserVO> userList = new ArrayList<UserVO>();

		/*페이징*/
		int pageNum = Integer.parseInt(searchMap.get("pageNum"));
		cri = new Criteria(pageNum, 10); 
		vo.setCri(cri);
		
		/*검색조건처리*/
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));

		userList = userManage.getUserList(vo); // 조건에 맞는 데이터 select
		
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo)); // 검색조건만 처리한 총 user 수

		return "users";
	}
	
	@RequestMapping(value = "/updateUserStatus.admin", method=RequestMethod.POST) // 회원 상태 변경
	public String updateUserStatus(@RequestBody List<String> usernumlist, UserVO vo, Model model, Criteria cri) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> updateUserStatus 	Method");
		/*회원 상태 변경*/
		String user_status = usernumlist.get(usernumlist.size()-1);
		vo.setUser_status(user_status);
		
		for(int i=0; i<usernumlist.size()-2; i++) {
			vo.setUser_num(Integer.parseInt(usernumlist.get(i)));
			userManage.updateUserStatus(vo); // 회원 상태 변경
		}
		
		/*페이징*/
		cri = new Criteria(Integer.parseInt(usernumlist.get(usernumlist.size()-2)), 10);
		vo.setCri(cri);
		
		List<UserVO> userList = userManage.getUserList(vo); // 처리된 리스트
		
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo)); // 검색조건만 처리한 총 user 수

		return "users";
	}
	
	@RequestMapping(value = "/useSearchBox.admin", method=RequestMethod.POST) // 검색 박스 처리시
	public String useSearchBox(@RequestBody Map<String, String> searchMap, UserVO vo, Criteria cri, Model model) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> useSearchBox 	Method");
		/*페이징*/
		int pageNum = Integer.parseInt(searchMap.get("pageNum"));
		cri = new Criteria(pageNum, 10);
		vo.setCri(cri);
		
		/*검색조건처리*/
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));

		List<UserVO> userList = userManage.getUserList(vo); // 처리된 리스트
		
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo)); // 검색조건만 처리한 총 user 수

		return "users";
	}
	
	@RequestMapping(value = "/moveUserPaging.admin", method=RequestMethod.POST) // 페이지 이동시
	public String moveUserPaging(@RequestBody Map<String, String> searchMap, UserVO vo, Criteria cri, Model model) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> moveUserPaging 	Method");
		/*페이징*/
		int pageNum = Integer.parseInt(searchMap.get("pageNum"));
		cri = new Criteria(pageNum, 10);
		vo.setCri(cri);
		
		/*검색 조건 처리*/
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));
		
		List<UserVO> userList = userManage.getUserList(vo); // 처리된 리스트
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo)); // 검색조건만 처리한 총 user 수

		return "users";
	}
	


	


}
