package com.ktds.order.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.oauthmember.vo.OauthmemberVO;
import com.ktds.order.vo.OrderListVO;

public class OrderDaoImpl extends SqlSessionDaoSupport implements OrderDao{

	@Override
	public int insertOrder(OrderListVO orderVO) {
		return getSqlSession().insert("OrderListDao.insertOrder", orderVO);
	}

	@Override
	public List<OrderListVO> selectAllOrder(OrderListVO orderVO) {
		return getSqlSession().selectList("OrderListDao.selectAllOrder", orderVO);
	}

	@Override
	public OrderListVO selectOneOrder(OauthmemberVO oauthmemberVO) {
		return getSqlSession().selectOne("OrderDao.selectOneOrder", oauthmemberVO);
	}

}
