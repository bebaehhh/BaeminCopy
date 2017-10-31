package com.ktds.service.vo;

import java.util.List;

import io.github.seccoding.web.pager.Pager;

public class ServiceNoticeEventListVO {
	
	private List<ServiceNoticeEventVO> ServiceNoticeEventListVO;
	private ServiceSearchVO serviceSearchVO;
	private Pager pager;
	
	
	public List<ServiceNoticeEventVO> getServiceNoticeEventListVO() {
		return ServiceNoticeEventListVO;
	}
	public void setServiceNoticeEventListVO(List<ServiceNoticeEventVO> serviceNoticeEventListVO) {
		ServiceNoticeEventListVO = serviceNoticeEventListVO;
	}
	public ServiceSearchVO getServiceSearchVO() {
		return serviceSearchVO;
	}
	public void setServiceSearchVO(ServiceSearchVO serviceSearchVO) {
		this.serviceSearchVO = serviceSearchVO;
	}
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}

}
