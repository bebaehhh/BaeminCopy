package com.ktds.service.dao;

import java.util.List;

import com.ktds.service.vo.ServiceFaqVO;
import com.ktds.service.vo.ServiceNoticeEventVO;
import com.ktds.service.vo.ServiceSearchVO;

public interface ServiceDao {
	
	public List<ServiceFaqVO> selectAllFaq(ServiceSearchVO serviceSearchVO);
	public int selectAllFaqCount(ServiceSearchVO serviceSearchVO);
	
	public List<ServiceNoticeEventVO> selectAllNoticeEvent(ServiceSearchVO serviceSearchVO);
	public int selectAllNoticeEventCount(ServiceSearchVO serviceSearchVO);
	public ServiceNoticeEventVO selectOneNoticeEventVO(int noticeEventId);
	
}
