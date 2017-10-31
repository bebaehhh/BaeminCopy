package com.ktds.service.service;

import java.util.List;

import com.ktds.service.vo.ServiceFaqListVO;
import com.ktds.service.vo.ServiceNoticeEventListVO;
import com.ktds.service.vo.ServiceNoticeEventVO;
import com.ktds.service.vo.ServiceSearchVO;

public interface ServiceService {

	public ServiceFaqListVO readAllFaq(ServiceSearchVO serviceSearchVO);
	public int readAllFaqCount(ServiceSearchVO serviceSearchVO);
	
	public ServiceNoticeEventListVO readAllNoticeEvent(ServiceSearchVO serviceSearchVO);
	public int readAllNoticeEventCount(ServiceSearchVO serviceSearchVO);
	public ServiceNoticeEventVO readOneNoticeEventVO(int noticeEventId);
}
