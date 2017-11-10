package com.ktds.baeminboard.service;

import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import com.ktds.baeminboard.dao.BaeminboardDao;

import com.ktds.baeminboard.vo.ShopInfoVO;
import com.ktds.baeminboard.vo.ShopSearchVO;

import io.github.seccoding.web.pager.Pager;
import io.github.seccoding.web.pager.PagerFactory;

public class BaeminboardServiceImpl implements BaeminboardService{
	
	private BaeminboardDao baeminboardDao;
	
	public void setBaeminboardDao(BaeminboardDao baeminboardDao) {
		this.baeminboardDao = baeminboardDao;
	}

	@Override
	public boolean createBaeminboard(ShopInfoVO shopInfoVO) {
		return baeminboardDao.insertBaeminboard(shopInfoVO) > 0;
	}
	
	@Override
	public List<ShopInfoVO> searchAllBaeminboard(ShopSearchVO shopSearchVO) {
		
		Pager pager = PagerFactory.getPager(true, 21, 10);
		int searchAllCount = baeminboardDao.searchAllBaeminboardCount(shopSearchVO);
		
		shopSearchVO.setTotalConut(searchAllCount);
		pager.setTotalArticleCount(searchAllCount);
		pager.setPageNumber(shopSearchVO.getPageNo());
		
		shopSearchVO.setStartNumber(pager.getStartArticleNumber());
		shopSearchVO.setEndNumber(pager.getEndArticleNumber());
		shopSearchVO.setPageNo(pager.getPageNumber());
		
		List<ShopInfoVO> shopInfoVOList = baeminboardDao.searchAllBaeminboard(shopSearchVO);
		
		shopInfoVOList = shopInfoVOList.stream()
					  .map(vo ->{
						  vo.setShop_photo_filename(vo.getShop_photo_filename().replaceAll("\\.", "-"));
						  return vo;
					  }).collect(Collectors.toList());
														   
		
		shopInfoVOList.forEach(vo -> vo.setShop_photo_filename(vo.getShop_photo_filename().replaceAll("\\.", "-")));
					
					  
		
		/*for(ShopInfoVO shopInfoVO : shopInfoVOList) {
			String fileName = (shopInfoVO.getShop_photo_filename()).replaceAll("\\.", "-");
			shopInfoVO.setShop_photo_filename(fileName);
		}*/
		
		return shopInfoVOList.stream()
				  .map(vo ->{
					  vo.setShop_photo_filename(vo.getShop_photo_filename().replaceAll("\\.", "-"));
					  return vo;
				  }).collect(Collectors.toList());
	}

	@Override
	public List<ShopInfoVO> readAllBaeminboard(ShopSearchVO shopSearchVO) {
		
		Pager pager = PagerFactory.getPager(true, 21, 10);
		int readAllCount = baeminboardDao.selectAllBaeminboardCount(shopSearchVO);
		
		shopSearchVO.setTotalConut(readAllCount);
		pager.setTotalArticleCount(readAllCount);
		pager.setPageNumber(shopSearchVO.getPageNo());
		
		shopSearchVO.setStartNumber(pager.getStartArticleNumber());
		shopSearchVO.setEndNumber(pager.getEndArticleNumber());
		shopSearchVO.setPageNo(pager.getPageNumber());
		
		
		/*for(ShopInfoVO shopInfoVO : shopInfoVOList) {
			String fileName = (shopInfoVO.getShop_photo_filename()).replaceAll("\\.", "-");
			shopInfoVO.setShop_photo_filename(fileName);
		}*/
		
		return baeminboardDao.searchAllBaeminboard(shopSearchVO)
							 .stream()
							 .map(ShopInfoVO::replace)
							 .collect(Collectors.toList());
	}

}
