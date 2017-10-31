package com.ktds.baeminboard.service;

import java.util.List;

import com.ktds.baeminboard.vo.ReviewVO;
import com.ktds.baeminboard.vo.ShopInfoListVO;
import com.ktds.baeminboard.vo.ShopSearchVO;
import com.ktds.oauthmember.vo.BookmarkVO;

public interface ShopService {

	public ShopInfoListVO readOneShopInfo(ShopSearchVO shopSearchVO);
	
	public List<ReviewVO> readAllReview(ShopSearchVO shopSearchVO);
	
	public boolean createBookmark(BookmarkVO bookmarkVO);
}
