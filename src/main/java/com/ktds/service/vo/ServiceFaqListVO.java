package com.ktds.service.vo;

import java.util.List;

import io.github.seccoding.web.pager.Pager;

public class ServiceFaqListVO {

	private List<ServiceFaqVO> ServiceFaqListVO;
	private ServiceSearchVO serviceSearchVO;
	private Pager pager;

	public List<ServiceFaqVO> getServiceFaqListVO() {
		return ServiceFaqListVO;
	}

	public void setServiceFaqListVO(List<ServiceFaqVO> serviceFaqListVO) {
		ServiceFaqListVO = serviceFaqListVO;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public ServiceSearchVO getServiceSearchVO() {
		return serviceSearchVO;
	}

	public void setServiceSearchVO(ServiceSearchVO serviceSearchVO) {
		this.serviceSearchVO = serviceSearchVO;
	}

}
