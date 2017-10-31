package com.ktds.order.service;

import java.util.List;

import com.ktds.oauthmember.vo.OauthmemberVO;
import com.ktds.order.vo.OrderListVO;

public interface OrderService {
	
	public boolean createOrder(OrderListVO orderVO);
	
	public List<OrderListVO> readAllOrder(OrderListVO orderVO);
	
	public OrderListVO readOneOrder(OauthmemberVO oauthmemberVO);

}
