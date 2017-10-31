package com.ktds.baeminboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.baeminboard.vo.ShopInfoVO;
import com.ktds.baeminboard.vo.ShopSearchVO;

public class BaeminboardDaoImpl extends SqlSessionDaoSupport implements BaeminboardDao{

	@Override
	public int insertBaeminboard(ShopInfoVO shopInfoVO) {
		return getSqlSession().insert("BaeminboardDao.insertBaeminboard", shopInfoVO);
	}

	@Override
	public List<ShopInfoVO> searchAllBaeminboard(ShopSearchVO shopSearchVO) {
		return getSqlSession().selectList("BaeminboardDao.searchAllBaeminboard",shopSearchVO);
	}
	
	@Override
	public int searchAllBaeminboardCount(ShopSearchVO shopSearchVO) {
		return getSqlSession().selectOne("BaeminboardDao.searchAllBaeminboardCount", shopSearchVO);
	}

	@Override
	public List<ShopInfoVO> selectAllBaeminboard(ShopSearchVO shopSearchVO) {
		return getSqlSession().selectList("BaeminboardDao.selectAllBaeminboard", shopSearchVO);
	}

	@Override
	public int selectAllBaeminboardCount(ShopSearchVO shopSearchVO) {
		return getSqlSession().selectOne("BaeminboardDao.selectAllBaeminboardCount", shopSearchVO);
	}

}
