package com.ktds.oauthmember.dao;

import java.util.List;

import com.ktds.oauthmember.vo.OauthmemberVO;

public interface MypageDao {
	
	public List<OauthmemberVO> selectAllMyBaroList(OauthmemberVO oauthmemberVO);
	
	public int updateOauthmember(OauthmemberVO oauthmemberVO);
	
	public int updateMemberId(OauthmemberVO oauthemeberVO);
	
	public List<OauthmemberVO> selectAllMyBookmarkList(OauthmemberVO oauthmemberVO);
	
	public List<OauthmemberVO> selectAllMyLastOrderList(OauthmemberVO oauthmemberVO);
	
	public int selectMemberPoint(String memberId);
	
	public	List<OauthmemberVO> selectPointInfo(OauthmemberVO oauthmemberVO);

}
