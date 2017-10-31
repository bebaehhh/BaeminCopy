package com.ktds.baeminboard.service;

import java.util.List;

import com.ktds.baeminboard.dao.ShopDao;
import com.ktds.baeminboard.vo.ReviewVO;
import com.ktds.baeminboard.vo.ShopInfoListVO;
import com.ktds.baeminboard.vo.ShopInfoVO;
import com.ktds.baeminboard.vo.ShopMenuCategoryVO;
import com.ktds.baeminboard.vo.ShopMenuDetailVO;
import com.ktds.baeminboard.vo.ShopSearchVO;
import com.ktds.oauthmember.vo.BookmarkVO;

import io.github.seccoding.web.pager.Pager;
import io.github.seccoding.web.pager.PagerFactory;


public class ShopServiceImpl implements ShopService {

	private ShopDao shopDao;
	
	public void setShopDao(ShopDao shopDao) {
		this.shopDao = shopDao;
	}
	
	@Override
	public ShopInfoListVO readOneShopInfo(ShopSearchVO shopSearchVO) {
		
		ShopInfoListVO shopInfoListVO = new ShopInfoListVO();
		
		shopInfoListVO.setShopInfoVO(shopDao.selectOneShopInfo(shopSearchVO));
		for(ShopMenuCategoryVO  categoryVO : shopInfoListVO.getShopInfoVO().getShopMenuCategoryList()) {
			for(ShopMenuDetailVO menuDetailVO : categoryVO.getShopMenuDetailList() ) {
				String file = menuDetailVO.getMenu_photo_file();
				if(file != null) {
					String fileName = file.replaceAll("\\.", "-");
					menuDetailVO.setMenu_photo_file(fileName);
				}
			}
		}
		
		shopInfoListVO.setReviewList(readAllReview(shopSearchVO));
		
		shopInfoListVO.setShopSearchVO(shopSearchVO);
		
		return shopInfoListVO;
		
	}

	@Override
	public List<ReviewVO> readAllReview(ShopSearchVO shopSearchVO) {
		
		 
		Pager pager = PagerFactory.getPager(true, 4, 10);
		int reviewCount = shopDao.selectAllReviewCount(shopSearchVO);
		pager.setTotalArticleCount(reviewCount);
		pager.setPageNumber(shopSearchVO.getPageNo());
		
		shopSearchVO.setStartNumber( pager.getStartArticleNumber());
		shopSearchVO.setEndNumber( pager.getEndArticleNumber());
		
		List<ReviewVO> ReviewList = shopDao.selectAllReview(shopSearchVO);
		for(ReviewVO reviewVO : ReviewList) {
			String file = reviewVO.getFile_name();
			if(file != null) {
				String fileName = file.replaceAll("\\.", "-");
				reviewVO.setFile_name(fileName);
			}
		}
		
		return ReviewList;
	}

	@Override
	public boolean createBookmark(BookmarkVO bookmarkVO) {
		return shopDao.insertBookmark(bookmarkVO) > 0;
	}

}
