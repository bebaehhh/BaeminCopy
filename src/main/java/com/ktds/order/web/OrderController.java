package com.ktds.order.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.oauthmember.vo.OauthmemberVO;
import com.ktds.order.service.OrderService;
import com.ktds.order.vo.OrderListVO;

@Controller
public class OrderController {
	
	private OrderService orderService;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@RequestMapping("/order/info")
	public ModelAndView viewOrderInfo(OrderListVO orderListVO, HttpSession session) {
		
		ModelAndView view = new ModelAndView();
		
		view.setViewName("order/info");
		
		OauthmemberVO oauthmemberVO = (OauthmemberVO) session.getAttribute("_USER_");
		
		OrderListVO oldOrderListVO = orderService.readOneOrder(oauthmemberVO);
		view.addObject("oldOrderListVO", oldOrderListVO);
		view.addObject("orderListVO", orderListVO);
		
		return view;
	}

}
