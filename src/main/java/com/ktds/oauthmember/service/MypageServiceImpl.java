package com.ktds.oauthmember.service;

import java.util.List;

import com.ktds.oauthmember.dao.MypageDao;
import com.ktds.oauthmember.vo.OauthmemberVO;

public class MypageServiceImpl implements MypageService {
	
	private MypageDao mypageDao;
	
	public void setMypageDao(MypageDao mypageDao) {
		this.mypageDao = mypageDao;
	}

	@Override
	public List<OauthmemberVO> readAllMyBaroList(OauthmemberVO oauthmemberVO) {
		return mypageDao.selectAllMyBaroList(oauthmemberVO);
	}

	@Override
	public boolean updateOauthmember(OauthmemberVO oauthmemberVO) {
		return mypageDao.updateOauthmember(oauthmemberVO) > 0;
	}

	@Override
	public boolean updateMemberId(OauthmemberVO oauthemeberVO) {
		return mypageDao.updateMemberId(oauthemeberVO) > 0;
	}

	@Override
	public List<OauthmemberVO> readAllMyBookmarkList(OauthmemberVO oauthmemberVO) {
		return mypageDao.selectAllMyBookmarkList(oauthmemberVO);
	}

	@Override
	public List<OauthmemberVO> readAllMyLastOrderList(OauthmemberVO oauthmemberVO) {
		return mypageDao.selectAllMyLastOrderList(oauthmemberVO);
	}

	@Override
	public int readMemberPoint(String memberId) {
		return mypageDao.selectMemberPoint(memberId);
	}

	@Override
	public List<OauthmemberVO> readPointInfo(OauthmemberVO oauthmemberVO) {
		return mypageDao.selectPointInfo(oauthmemberVO);
	}




}
