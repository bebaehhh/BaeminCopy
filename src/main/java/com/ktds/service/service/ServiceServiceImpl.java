package com.ktds.service.service;

import java.util.List;

import com.ktds.service.dao.ServiceDao;
import com.ktds.service.vo.ServiceFaqListVO;
import com.ktds.service.vo.ServiceFaqVO;
import com.ktds.service.vo.ServiceNoticeEventListVO;
import com.ktds.service.vo.ServiceNoticeEventVO;
import com.ktds.service.vo.ServiceSearchVO;

import io.github.seccoding.web.pager.Pager;
import io.github.seccoding.web.pager.PagerFactory;

public class ServiceServiceImpl implements ServiceService {

	private ServiceDao serviceDao;
	
	public void setServiceDao(ServiceDao serviceDao) {
		this.serviceDao = serviceDao;
	}
	
	@Override
	public ServiceFaqListVO readAllFaq(ServiceSearchVO serviceSearchVO) {
		
		ServiceFaqListVO serviceFaqListVO = new ServiceFaqListVO();
		
		Pager pager = PagerFactory.getPager(true);
		int serviceCount = serviceDao.selectAllFaqCount(serviceSearchVO);
		
		pager.setTotalArticleCount(serviceCount);
		pager.setPageNumber(serviceSearchVO.getPageNo());
		
		serviceSearchVO.setStartNumber(pager.getStartArticleNumber());
		serviceSearchVO.setEndNumber(pager.getEndArticleNumber());
		
		serviceFaqListVO.setPager(pager);
		serviceFaqListVO.setServiceFaqListVO(serviceDao.selectAllFaq(serviceSearchVO));
		
		return serviceFaqListVO;
	}

	@Override
	public ServiceNoticeEventListVO readAllNoticeEvent(ServiceSearchVO serviceSearchVO) {
		
		ServiceNoticeEventListVO serviceNoticeEventListVO = new ServiceNoticeEventListVO();
		
		Pager pager = PagerFactory.getPager(true);
		int serviceCount = serviceDao.selectAllNoticeEventCount(serviceSearchVO);
		
		pager.setTotalArticleCount(serviceCount);
		pager.setPageNumber(serviceSearchVO.getPageNo());
		
		serviceSearchVO.setStartNumber(pager.getStartArticleNumber());
		serviceSearchVO.setEndNumber(pager.getEndArticleNumber());
		
		serviceNoticeEventListVO.setPager(pager);
		serviceNoticeEventListVO.setServiceNoticeEventListVO(serviceDao.selectAllNoticeEvent(serviceSearchVO));
		
		return serviceNoticeEventListVO;
		
	}

	@Override
	public int readAllFaqCount(ServiceSearchVO serviceSearchVO) {
		return serviceDao.selectAllFaqCount(serviceSearchVO);
	}

	@Override
	public int readAllNoticeEventCount(ServiceSearchVO serviceSearchVO) {
		return serviceDao.selectAllNoticeEventCount(serviceSearchVO);
	}

	@Override
	public ServiceNoticeEventVO readOneNoticeEventVO(int noticeEventId) {
		return serviceDao.selectOneNoticeEventVO(noticeEventId);
	}

	
}
