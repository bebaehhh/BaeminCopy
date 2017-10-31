package com.ktds.oauthmember.service;

import com.ktds.oauthmember.dao.OauthmemberDao;
import com.ktds.oauthmember.vo.OauthmemberVO;

public class OauthmemberServiceImpl implements OauthmemberService {
	
	private OauthmemberDao oauthmemberDao;
	
	public void setOauthmemberDao(OauthmemberDao oauthmemberDao) {
		this.oauthmemberDao = oauthmemberDao;
	}

	@Override
	public boolean createOauthmember(OauthmemberVO oauthmemberVO) {
		return oauthmemberDao.insertOauthmember(oauthmemberVO) > 0;
	}

	@Override
	public OauthmemberVO readOneOauthmenber(OauthmemberVO oauthmemberVO) {
		return oauthmemberDao.selectOneOauthmenber(oauthmemberVO);
	}

}
