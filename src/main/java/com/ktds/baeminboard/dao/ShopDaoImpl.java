package com.ktds.baeminboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.baeminboard.service.ShopService;
import com.ktds.baeminboard.vo.ReviewVO;
import com.ktds.baeminboard.vo.ShopInfoVO;
import com.ktds.baeminboard.vo.ShopSearchVO;
import com.ktds.oauthmember.vo.BookmarkVO;

public class ShopDaoImpl extends SqlSessionDaoSupport implements ShopDao {

	@Override
	public ShopInfoVO selectOneShopInfo(ShopSearchVO shopSearchVO) {
		return getSqlSession().selectOne("ShopDao.selectOneShopInfo", shopSearchVO);
	}

	@Override
	public List<ReviewVO> selectAllReview(ShopSearchVO shopSearchVO) {
		return getSqlSession().selectList("ShopDao.selectAllReview", shopSearchVO);
	}

	@Override
	public int selectAllReviewCount(ShopSearchVO shopSearchVO) {
		return getSqlSession().selectOne("ShopDao.selectAllReviewCount", shopSearchVO);
	}

	@Override
	public int insertBookmark(BookmarkVO bookmarkVO) {
		return getSqlSession().insert("ShopDao.insertBookmark", bookmarkVO);
	}

}
