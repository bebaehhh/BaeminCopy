package com.ktds.oauthmember.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.oauthmember.vo.OauthmemberVO;

public class OauthmemberDaoImpl extends SqlSessionDaoSupport implements OauthmemberDao{

	@Override
	public int insertOauthmember(OauthmemberVO oauthmemberVO) {
		
		return getSqlSession().insert("OauthmemberDao.insertOauthmember", oauthmemberVO);
	}

	@Override
	public OauthmemberVO selectOneOauthmenber(OauthmemberVO oauthmemberVO) {
		return getSqlSession().selectOne("OauthmemberDao.selectOneOauthmenber", oauthmemberVO);
	}

	
}
