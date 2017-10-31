package com.ktds.baeminboard.dao;

import java.util.List;

import com.ktds.baeminboard.vo.ShopInfoVO;
import com.ktds.baeminboard.vo.ShopSearchVO;

public interface BaeminboardDao {
	
	public int insertBaeminboard(ShopInfoVO shopInfoVO);
	
	public List<ShopInfoVO> searchAllBaeminboard(ShopSearchVO shopSearchVO);
	public int searchAllBaeminboardCount(ShopSearchVO shopSearchVO);
	
	public List<ShopInfoVO> selectAllBaeminboard(ShopSearchVO shopSearchVO);
	public int selectAllBaeminboardCount(ShopSearchVO shopSearchVO);

}
