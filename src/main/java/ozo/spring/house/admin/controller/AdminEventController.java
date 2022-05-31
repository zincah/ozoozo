package ozo.spring.house.admin.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import ozo.spring.house.admin.service.AdminBannerService;
import ozo.spring.house.admin.service.AdminCouponService;
import ozo.spring.house.admin.vo.AdminCouponVO;
import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.user.vo.CouponVO;

@Controller
public class AdminEventController {

	@Autowired
	AdminBannerService AdminBannerService;

	@Autowired
	AdminCouponService AdminCouponService;


	@RequestMapping(value = "/m_eventManagement.admin")
	public String eventManagementView(HttpServletRequest request, Model model, BannerVO vo) {

		HttpSession session = request.getSession();

		List<BannerVO> list;
		list = AdminBannerService.b_select(vo);
		model.addAttribute("list", list);

		if (session.getAttribute("admincode") != null) {
			return "eventManagement_dj";
		} else {
			return "adminLogin_dj";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/statuschange.admin", method = {RequestMethod.POST})
	public Map<String, String> eventbtn(@RequestBody Map<String, String> param, BannerVO vo) {


		if (param.get("bool").equals("�簳��")) {
			vo.setBanner_status(true);
			System.out.println(param.get("Ʈ�� �־���"));
		} else if (param.get("bool").equals("����")) {
			vo.setBanner_status(false);
			System.out.println(param.get("false �־���"));
		}

		vo.setBanner_id(Integer.parseInt(param.get("item")));

		System.out.println(param.get("item"));
		System.out.println(param.get("bool"));

		AdminBannerService.b_boolean(vo);

		// �����Ҷ� ������ �����Ͽ� ajax ������ �Բ� �׽�Ʈ�Ͽ� �޴� �� ���޴� �� üũ �Ұ�!!
		//sysout���� ���� �׽�Ʈ �غ��� 
		//json�� @requestbody
		Map<String, String> map = new HashMap<String, String>();
		map.put("item", param.get("item"));
		map.put("bool", param.get("bool"));
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/view.admin", method = {RequestMethod.POST})
	public List<BannerVO> bannerview(@RequestBody Map<String, String> param, BannerVO vo) {

		vo.setBanner_id(Integer.parseInt(param.get("id")));
		System.out.println(param.get("id"));
		List<BannerVO> list = AdminBannerService.b_selectone(vo);

		return list;

	}


	/* counpon searching + coupon List View */

	@RequestMapping(value = "/couponManagement.admin")
	public String couponSearching(AdminCouponVO cvo, Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();


		if (session.getAttribute("admincode") != null) {

			/*System.out.println(searchMap);

			cvo.setCoupon_title(searchMap.get("title"));
			cvo.setCoupon_subtitle(searchMap.get("content"));
			cvo.setCoupon_startdate(Timestamp.valueOf(searchMap.get("startdate")));
			cvo.setCoupon_enddate(Timestamp.valueOf(searchMap.get("enddate")));
			cvo.setCoupon_create(Timestamp.valueOf(searchMap.get("create")));
			//cvo.setCoupon_update(Timestamp.valueOf(searchMap.get("update")));
			//cvo.setCoupon_id(int.AdminCouponVO("code"));
			cvo.setCoupon_status(searchMap.get("status"));*/

			List<AdminCouponVO> couponList = AdminCouponService.couponListView(cvo);
			System.out.println(couponList);
			model.addAttribute("couponList", couponList);
			model.addAttribute("couponStatus0", couponList.stream().filter(list -> list.getCoupon_status().equals("대기")).count());
			model.addAttribute("couponStatus1", couponList.stream().filter(list -> list.getCoupon_status().equals("사용중")).count());
			model.addAttribute("couponStatus2", couponList.stream().filter(list -> list.getCoupon_status().equals("종료")).count());

			model.addAttribute("total count", AdminCouponService.couponListView(cvo));
			return "couponManagement_zinc";
		} else {
			return "adminLogin_dj";
		}


	}

	// 쿠폰 상세 정보보기

	@RequestMapping(value = "/couponView.admin")
	public String couponViewData(@RequestBody String coupon, AdminCouponVO cvo, Model model) {

		System.out.println(coupon);

		cvo.setCoupon_id(Integer.parseInt(coupon.replace("\"", "" )));

		AdminCouponVO vo = AdminCouponService.couponViewData(cvo);
		System.out.println(vo);

		model.addAttribute("couponViewData", vo);

		return "couponInfo";
	}


	//쿠폰 생성

	@RequestMapping(value = "/couponInsert.admin", method = RequestMethod.POST)
	public String couponInsert(@RequestBody AdminCouponVO cvo, Model model, HttpServletRequest request){

		System.out.println(cvo);
		AdminCouponService.couponInserting(cvo);

		List<AdminCouponVO> couponList = AdminCouponService.couponListView(cvo);
		model.addAttribute("couponList", couponList);

		return "couponList";

	}

	// 쿠폰 수정
	@RequestMapping(value = "/couponUpdate.admin", method = RequestMethod.POST)
	public String couponUpdate(@RequestBody AdminCouponVO vo, Model model, HttpServletRequest request){

		System.out.println(vo);
		AdminCouponService.couponUpdate(vo);

		List<AdminCouponVO> updateList = AdminCouponService.couponListView(vo);
		model.addAttribute("couponList", updateList);
		System.out.println(updateList);

		return "couponList";
	}

	// 쿠폰 상태 변경
	@RequestMapping(value = "/updateCouponStatus.admin", method = RequestMethod.POST)
	public String updateCouponStatus(@RequestBody List<String> modifyInfo, AdminCouponVO svo, Model model, Criteria cri) {

		svo.setCoupon_status(modifyInfo.get(modifyInfo.size() - 1));

		for (int i = 0; i < modifyInfo.size() - 2; i++) {
			svo.setCoupon_id(Integer.parseInt(modifyInfo.get(i)));
			AdminCouponService.updateCouponStatus(svo);
		}

		cri = new Criteria(Integer.parseInt(modifyInfo.get(modifyInfo.size() - 2)), 10);
		AdminCouponVO vo = new AdminCouponVO();
		vo.setCri(cri);

		List<AdminCouponVO> couponList = AdminCouponService.couponListView(vo);

		model.addAttribute("couponList", couponList);
		model.addAttribute("pageMaker", cri);
		//model.addAttribute("totalcount", AdminCouponService.)

		return "couponList";
	}


}
