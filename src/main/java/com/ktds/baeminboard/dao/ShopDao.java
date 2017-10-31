package com.ktds.baeminboard.dao;

import java.util.List;

import com.ktds.baeminboard.service.ShopService;
import com.ktds.baeminboard.vo.ReviewVO;
import com.ktds.baeminboard.vo.ShopInfoVO;
import com.ktds.baeminboard.vo.ShopSearchVO;
import com.ktds.oauthmember.vo.BookmarkVO;

public interface ShopDao {

	public ShopInfoVO selectOneShopInfo(ShopSearchVO shopSearchVO);
	
	public List<ReviewVO> selectAllReview(ShopSearchVO shopSearchVO);
	
	public int selectAllReviewCount(ShopSearchVO shopSearchVO);
	
	public int insertBookmark(BookmarkVO bookmarkVO);
}
