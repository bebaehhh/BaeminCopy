package com.ktds.baeminboard.service;

import java.util.List;

import com.ktds.baeminboard.vo.ShopInfoVO;
import com.ktds.baeminboard.vo.ShopSearchVO;

public interface BaeminboardService {
	
	public boolean createBaeminboard(ShopInfoVO shopInfoVO);
	
	public List<ShopInfoVO> searchAllBaeminboard(ShopSearchVO shopSearchVO);
	
	public List<ShopInfoVO> readAllBaeminboard(ShopSearchVO shopSearchVO);

}
