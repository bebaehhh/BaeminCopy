package com.ktds.service.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.service.service.ServiceService;
import com.ktds.service.vo.ServiceFaqListVO;
import com.ktds.service.vo.ServiceFaqVO;
import com.ktds.service.vo.ServiceNoticeEventListVO;
import com.ktds.service.vo.ServiceNoticeEventVO;
import com.ktds.service.vo.ServiceSearchVO;

import io.github.seccoding.web.pager.PageExplorer;
import io.github.seccoding.web.pager.explorer.ClassicPageExplorer;

@Controller
public class ServiceController {
	
	private ServiceService serviceService;
	
	
	public ServiceService getServiceService() {
		return serviceService;
	}


	public void setServiceService(ServiceService serviceService) {
		this.serviceService = serviceService;
	}
	

	@RequestMapping("/service/service")
	public String viewService() {
		
		return "service/service";
	}
	
	@RequestMapping("/service/board")
	public ModelAndView viewBoardPage(ServiceSearchVO serviceSearchVO, HttpSession session, HttpServletRequest request) {
		
		if ( serviceSearchVO.getPageNo() == null || serviceSearchVO.getPageNo().length() == 0) {
			serviceSearchVO = (ServiceSearchVO) session.getAttribute("_SEARCH_");
			if ( serviceSearchVO == null ) {
				serviceSearchVO = new ServiceSearchVO();
			}
		}
		
		ServiceNoticeEventListVO serviceNoticeEventList = serviceService.readAllNoticeEvent(serviceSearchVO);
		
		PageExplorer pagenation = new ClassicPageExplorer(serviceNoticeEventList.getPager());
		String pager = pagenation.getPagingList("pageNo", " [@] ", "이전", "다음", "searchForm");
		
				
		ModelAndView view = new ModelAndView();
		view.setViewName("service/board");
		view.addObject("serviceNoticeEventList" , serviceNoticeEventList.getServiceNoticeEventListVO());
		view.addObject("serviceSearchVO", serviceSearchVO);
		view.addObject("pager", pager);
		
		session.setAttribute("_SEARCH_" , serviceSearchVO);
		
		return view;
	}

	@RequestMapping("/service/faq")
	public ModelAndView viewFaqPage(ServiceSearchVO serviceSearchVO, HttpSession session, HttpServletRequest request) {
		
		if ( serviceSearchVO.getPageNo() == null || serviceSearchVO.getPageNo().length() == 0) {
			serviceSearchVO = (ServiceSearchVO) session.getAttribute("_SEARCH_");
			if ( serviceSearchVO == null ) {
				serviceSearchVO = new ServiceSearchVO();
			}
		}
		
		ServiceFaqListVO serviceFaqList = serviceService.readAllFaq(serviceSearchVO);
		
		PageExplorer pagenation = new ClassicPageExplorer(serviceFaqList.getPager());
		String pager = pagenation.getPagingList("pageNo", " [@] ", "이전", "다음", "searchForm");
		
				
		ModelAndView view = new ModelAndView();
		view.setViewName("service/faq");
		view.addObject("serviceFaqList" , serviceFaqList.getServiceFaqListVO());
		view.addObject("serviceSearchVO", serviceSearchVO);
		view.addObject("pager", pager);
		
		session.setAttribute("_SEARCH_" , serviceSearchVO);
		
		return view;
	}
	
	@RequestMapping("/service/qna")
	public String viewQna() {
		
		return "service/qna";
	}
	
	@RequestMapping("/service/qna-list")
	public String viewQnaList() {
		
		return "service/qna-list";
	}
	
	@RequestMapping("/service/changeFaq")
	@ResponseBody
	public ServiceFaqListVO changeFag(ServiceSearchVO serviceSearchVO) {
		
		ServiceFaqListVO serviceFaqList = serviceService.readAllFaq(serviceSearchVO);
		
		PageExplorer pagenation = new ClassicPageExplorer(serviceFaqList.getPager());
		String pager = pagenation.getPagingList("pageNo", " [@] ", "이전", "다음", "searchForm");
		serviceSearchVO.setPager(pager);
		serviceFaqList.setServiceSearchVO(serviceSearchVO);
		
		return serviceFaqList;
	}
	
	@RequestMapping("/service/board_det/{noticeEventId}")
	public ModelAndView viewBoardDetPage(@PathVariable int noticeEventId) {
		
		ServiceNoticeEventVO serviceNoticeEventVO = serviceService.readOneNoticeEventVO(noticeEventId);
		
		ModelAndView view = new ModelAndView();
		
		view.setViewName("service/board_det");
		view.addObject("serviceNoticeEventVO", serviceNoticeEventVO);
		
		return view;
	}
}
