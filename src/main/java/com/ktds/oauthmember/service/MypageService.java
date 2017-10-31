package com.ktds.oauthmember.service;

import java.util.List;

import com.ktds.oauthmember.vo.OauthmemberVO;

public interface MypageService {
	
	public List<OauthmemberVO> readAllMyBaroList(OauthmemberVO oauthmemberVO);
	
	public boolean updateOauthmember(OauthmemberVO oauthmemberVO);
	
	public boolean updateMemberId(OauthmemberVO oauthemeberVO);
	
	public List<OauthmemberVO> readAllMyBookmarkList(OauthmemberVO oauthmemberVO);
	
	public List<OauthmemberVO> readAllMyLastOrderList(OauthmemberVO oauthmemberVO);
	
	public int readMemberPoint(String memberId);
	
	public	List<OauthmemberVO> readPointInfo(OauthmemberVO oauthmemberVO);


}
