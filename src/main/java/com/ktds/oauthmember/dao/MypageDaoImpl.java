package com.ktds.oauthmember.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.oauthmember.vo.OauthmemberVO;

public class MypageDaoImpl extends SqlSessionDaoSupport implements MypageDao {
	
	@Override
	public List<OauthmemberVO> selectAllMyBaroList(OauthmemberVO oauthmemberVO) {
		return getSqlSession().selectList("MypageDao.selectAllMyBaroList", oauthmemberVO);
	}

	@Override
	public int updateOauthmember(OauthmemberVO oauthmemberVO) {
		return getSqlSession().update("MypageDao.updateOauthmember", oauthmemberVO);
	}

	@Override
	public int updateMemberId(OauthmemberVO oauthemeberVO) {
		return getSqlSession().update("MypageDao.updateMemberId", oauthemeberVO); 
	}

	@Override
	public List<OauthmemberVO> selectAllMyBookmarkList(OauthmemberVO oauthmemberVO) {
		return getSqlSession().selectList("MypageDao.selectAllMyBookmarkList", oauthmemberVO);
	}

	@Override
	public List<OauthmemberVO> selectAllMyLastOrderList(OauthmemberVO oauthmemberVO) {
		return getSqlSession().selectList("MypageDao.selectAllMyLastOrderList", oauthmemberVO);
	}

	

	@Override
	public int selectMemberPoint(String memberId) {
		
		 
		return getSqlSession().selectOne("MypageDao.selectMemberPoint",memberId);
	}

	@Override
	public List<OauthmemberVO> selectPointInfo(OauthmemberVO oauthmemberVO) {

		return getSqlSession().selectList("MypageDao.selectPointInfo", oauthmemberVO);
	}

}