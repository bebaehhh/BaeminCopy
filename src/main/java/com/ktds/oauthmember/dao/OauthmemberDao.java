package com.ktds.oauthmember.dao;

import java.util.List;

import com.ktds.oauthmember.vo.OauthmemberVO;

public interface OauthmemberDao {
	
	public int insertOauthmember(OauthmemberVO oauthmemberVO);
	
	public OauthmemberVO selectOneOauthmenber(OauthmemberVO oauthmemberVO);
	
	

}
