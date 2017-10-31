package com.ktds.service.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.service.vo.ServiceFaqVO;
import com.ktds.service.vo.ServiceNoticeEventVO;
import com.ktds.service.vo.ServiceSearchVO;

public class ServiceDaoImpl extends SqlSessionDaoSupport implements ServiceDao {

	@Override
	public List<ServiceFaqVO> selectAllFaq(ServiceSearchVO serviceSearchVO) {
		return getSqlSession().selectList("ServiceDao.selectAllFaq", serviceSearchVO);
	}

	@Override
	public List<ServiceNoticeEventVO> selectAllNoticeEvent(ServiceSearchVO serviceSearchVO) {
		return getSqlSession().selectList("ServiceDao.selectAllNoticeEvent", serviceSearchVO);
	}

	@Override
	public int selectAllFaqCount(ServiceSearchVO serviceSearchVO) {
		return getSqlSession().selectOne("ServiceDao.selectAllFaqCount", serviceSearchVO);
	}

	@Override
	public int selectAllNoticeEventCount(ServiceSearchVO serviceSearchVO) {
		return getSqlSession().selectOne("ServiceDao.selectAllNoticeEventCount", serviceSearchVO);
	}

	@Override
	public ServiceNoticeEventVO selectOneNoticeEventVO(int noticeEventId) {
		return getSqlSession().selectOne("ServiceDao.selectOneNoticeEventVO", noticeEventId);
	}

}
