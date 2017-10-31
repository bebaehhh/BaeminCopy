package com.ktds.order.service;

import java.util.List;

import com.ktds.oauthmember.vo.OauthmemberVO;
import com.ktds.order.dao.OrderDao;
import com.ktds.order.vo.OrderListVO;

public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao;
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public boolean createOrder(OrderListVO orderVO) {
		return orderDao.insertOrder(orderVO) > 0;
	}

	@Override
	public List<OrderListVO> readAllOrder(OrderListVO orderVO) {
		return orderDao.selectAllOrder(orderVO);
	}

	@Override
	public OrderListVO readOneOrder(OauthmemberVO oauthmemberVO) {
		return orderDao.selectOneOrder(oauthmemberVO);
	}

}
