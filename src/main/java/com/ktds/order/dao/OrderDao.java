package com.ktds.order.dao;

import java.util.List;

import com.ktds.oauthmember.vo.OauthmemberVO;
import com.ktds.order.vo.OrderListVO;

public interface OrderDao {
	
	public int insertOrder(OrderListVO orderVO);
	
	public List<OrderListVO> selectAllOrder(OrderListVO orderVO);
	
	public OrderListVO selectOneOrder(OauthmemberVO oauthmemberVO);

}
