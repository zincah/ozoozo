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
	
	/* ��ü ���� */
	@ResponseBody
	@RequestMapping(value = "/getSellerInfo.admin", method=RequestMethod.POST) // ��ü ���� �޾ƿ��� controller
	public SellerVO getSellerInfo(@RequestBody Map<String, String> sellercode, SellerVO vo) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> getSellerInfo 	Method");
		vo.setSeller_id(Integer.parseInt(sellercode.get("seller_id")));
		SellerVO seller = userManage.getSellerInfo(vo); // ��ü ����

		return seller;
	}
	

	@RequestMapping(value = "/updateSellerStatus.admin", method=RequestMethod.POST) // �Ǹ��� ���� ����
	public String updateSellerStatus(@RequestBody List<String> sellercode, SellerVO vo, Model model) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> updateSellerStatus 	Method");
		List<Integer> sellerList = new ArrayList<Integer>();
		vo.setSeller_status(sellercode.get(0)); // ������ ����
		
		for(int i=1; i<sellercode.size(); i++) {
			sellerList.add(Integer.parseInt(sellercode.get(i))); // üũ�Ǿ �� seller_id
		}
		vo.setSellerList(sellerList);
		
		if(sellerList.size() != 0) {
			userManage.sellerStatusUpdate(vo); // �������º���
			List<SellerVO> list = userManage.selectSellerList(vo); // ����� ��ü����Ʈ
			model.addAttribute("sellerList", list);
		}
		
		return "sellerList";
	}
	
	@RequestMapping(value = "/sellerSearchBox.admin", method=RequestMethod.POST) // �˻�ó�� method
	public String sellerSearchBox(@RequestBody Map<String, String> searchMap, SellerVO vo, Model model) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> sellerSearchBox 	Method");
		vo.setSeller_status(searchMap.get("status"));
		vo.setRanking(searchMap.get("ranking"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setKeyword(searchMap.get("keyword"));
		
		System.out.println(vo);

		List<SellerVO> sellerList = userManage.selectSellerList(vo); // �˻������� ������ ����� ����Ʈ
		model.addAttribute("sellerList", sellerList);
		
		// ��ü���� �˻� ���� �з� �� ���� ����
		return "sellerList";
	}
	
	
	
	/* ȸ������ */
	@RequestMapping(value = "/getUserList.admin", method=RequestMethod.POST) // �˻��� ���� �˻� ����
	public String getUserList(@RequestBody Map<String, String> searchMap, UserVO vo, Model model, Criteria cri) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> getUserList 	Method");
		List<UserVO> userList = new ArrayList<UserVO>();

		/*����¡*/
		int pageNum = Integer.parseInt(searchMap.get("pageNum"));
		cri = new Criteria(pageNum, 10); 
		vo.setCri(cri);
		
		/*�˻�����ó��*/
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));

		userList = userManage.getUserList(vo); // ���ǿ� �´� ������ select
		
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo)); // �˻����Ǹ� ó���� �� user ��

		return "users";
	}
	
	@RequestMapping(value = "/updateUserStatus.admin", method=RequestMethod.POST) // ȸ�� ���� ����
	public String updateUserStatus(@RequestBody List<String> usernumlist, UserVO vo, Model model, Criteria cri) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> updateUserStatus 	Method");
		/*ȸ�� ���� ����*/
		String user_status = usernumlist.get(usernumlist.size()-1);
		vo.setUser_status(user_status);
		
		for(int i=0; i<usernumlist.size()-2; i++) {
			vo.setUser_num(Integer.parseInt(usernumlist.get(i)));
			userManage.updateUserStatus(vo); // ȸ�� ���� ����
		}
		
		/*����¡*/
		cri = new Criteria(Integer.parseInt(usernumlist.get(usernumlist.size()-2)), 10);
		vo.setCri(cri);
		
		List<UserVO> userList = userManage.getUserList(vo); // ó���� ����Ʈ
		
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo)); // �˻����Ǹ� ó���� �� user ��

		return "users";
	}
	
	@RequestMapping(value = "/useSearchBox.admin", method=RequestMethod.POST) // �˻� �ڽ� ó����
	public String useSearchBox(@RequestBody Map<String, String> searchMap, UserVO vo, Criteria cri, Model model) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> useSearchBox 	Method");
		/*����¡*/
		int pageNum = Integer.parseInt(searchMap.get("pageNum"));
		cri = new Criteria(pageNum, 10);
		vo.setCri(cri);
		
		/*�˻�����ó��*/
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));

		List<UserVO> userList = userManage.getUserList(vo); // ó���� ����Ʈ
		
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo)); // �˻����Ǹ� ó���� �� user ��

		return "users";
	}
	
	@RequestMapping(value = "/moveUserPaging.admin", method=RequestMethod.POST) // ������ �̵���
	public String moveUserPaging(@RequestBody Map<String, String> searchMap, UserVO vo, Criteria cri, Model model) {
		System.err.println("[Log] --- UserManage 	Controller >>>>> moveUserPaging 	Method");
		/*����¡*/
		int pageNum = Integer.parseInt(searchMap.get("pageNum"));
		cri = new Criteria(pageNum, 10);
		vo.setCri(cri);
		
		/*�˻� ���� ó��*/
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));
		
		List<UserVO> userList = userManage.getUserList(vo); // ó���� ����Ʈ
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", cri);
		model.addAttribute("totalcount", userManage.getUserListCount(vo)); // �˻����Ǹ� ó���� �� user ��

		return "users";
	}
	


	


}
