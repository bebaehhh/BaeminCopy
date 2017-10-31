package com.ktds.oauthmember.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.oauthmember.service.MypageService;
import com.ktds.oauthmember.service.OauthmemberService;
import com.ktds.oauthmember.vo.OauthmemberVO;
import com.ktds.order.vo.OrderListVO;

@Controller
public class MypageController {
	private MypageService mypageService;
	private OauthmemberService oauthmemberService;
	
	public void setOauthmemberService(OauthmemberService oauthmemberService) {
		this.oauthmemberService = oauthmemberService;
	}
	
	public void setMypageService(MypageService mypageService) {
		this.mypageService = mypageService;
	}
	
	@RequestMapping("/mypage/mypage_m")
	public ModelAndView viewMypageMain(HttpSession session, OauthmemberVO oauthmemberVO) {
		OauthmemberVO oauthmember = (OauthmemberVO) session.getAttribute("_USER_");
		String id = oauthmember.getMemberId();
		oauthmemberVO.setMemberId(id);
		
		ModelAndView view = new ModelAndView();
		
		List<OauthmemberVO> bookmarkList = mypageService.readAllMyBookmarkList(oauthmemberVO);
		List<OauthmemberVO> lastorderList = mypageService.readAllMyLastOrderList(oauthmemberVO);
		
		view.setViewName("mypage/mypage_m");
		view.addObject("bookmarkList", bookmarkList);
		view.addObject("lastorderList", lastorderList);
		
		return view;
	}
	
	@RequestMapping("/mypage/baro_list")
	public ModelAndView viewBarolistMain(HttpSession session, OauthmemberVO oauthmemberVO) {
		
		OauthmemberVO oauthmember = (OauthmemberVO) session.getAttribute("_USER_");
		String id = oauthmember.getMemberId();
		oauthmemberVO.setMemberId(id);
		
		ModelAndView view = new ModelAndView();
		
		List<OauthmemberVO> memberList = mypageService.readAllMyBaroList(oauthmemberVO);
		
		view.setViewName("mypage/baro_list");
		view.addObject("memberList", memberList);
		
		return view;
	}
	
	@RequestMapping("/mypage/doUpdate")
	public String doUpdate(HttpSession session, OauthmemberVO oauthmemberVO) {
		OauthmemberVO oldmember = (OauthmemberVO) session.getAttribute("_USER_");
		String id = oldmember.getMemberId();
		oauthmemberVO.setMemberId(id);
		
		boolean isSuccess = mypageService.updateOauthmember(oauthmemberVO);
		
		//oauthmemberVO = oauthmemberService.readOneOauthmenber(oauthmemberVO);
		session.setAttribute("_USER_", oauthmemberVO);
		
		return "redirect:/mypage/myinfo";
	}
	
	@RequestMapping("/mypage/doUpdateId")
	public String doUpdateId(HttpSession session, OauthmemberVO oauthmemberVO) {
		
		OauthmemberVO oldmember = (OauthmemberVO) session.getAttribute("_USER_");
		String oldId = oldmember.getMemberId(); 
		String id = oauthmemberVO.getMemberId();
		oauthmemberVO.setMemberId(id);
		oauthmemberVO.setOldMemberId(oldId);
		
		boolean isSuccess = mypageService.updateMemberId(oauthmemberVO);
		
		session.setAttribute("_USER_", oauthmemberVO);
		
		return "redirect:/mypage/myinfo";
	}
	
	@RequestMapping("/mypage/point")
	public ModelAndView viewPointMain(HttpSession session, OauthmemberVO oauthmemberVO ) {
		
		OauthmemberVO onemember = (OauthmemberVO) session.getAttribute("_USER_");
		String id = onemember.getMemberId();
		oauthmemberVO.setMemberId(id);
		ModelAndView view = new ModelAndView();
		int point = mypageService.readMemberPoint(id);
		
		List<OauthmemberVO> pointInfoList = mypageService.readPointInfo(oauthmemberVO);		
		
		
		view.setViewName("mypage/point");
		view.addObject("point", point);
		view.addObject("pointInfoList",pointInfoList);
		
		return view;
	}
	
	@RequestMapping("/mypage/myreview")
	public String viewMyreviewMain() {
		
		return "mypage/myreview";
	}
	
	@RequestMapping("/mypage/myreview_reg_possible")
	public String viewMyreviewregMain() {
		
		return "mypage/myreview_reg_possible";
	}
	
	@RequestMapping("/mypage/myinfo")
	public String viewMyInfoMain() {
		
		return "mypage/myinfo";
	}

}
