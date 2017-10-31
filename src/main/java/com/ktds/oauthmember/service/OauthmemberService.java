package com.ktds.oauthmember.service;

import com.ktds.oauthmember.vo.OauthmemberVO;

public interface OauthmemberService {
	
	public boolean createOauthmember(OauthmemberVO oauthmemberVO);
	
	public OauthmemberVO readOneOauthmenber(OauthmemberVO oauthmemberVO);

}
