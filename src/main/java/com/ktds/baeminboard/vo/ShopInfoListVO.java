package com.ktds.baeminboard.vo;

import java.util.List;

public class ShopInfoListVO {

	private ShopInfoVO shopInfoVO;
	private List<ReviewVO> reviewList;
	private ShopSearchVO shopSearchVO;

	public ShopInfoVO getShopInfoVO() {
		return shopInfoVO;
	}

	public void setShopInfoVO(ShopInfoVO shopInfoVO) {
		this.shopInfoVO = shopInfoVO;
	}

	public List<ReviewVO> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<ReviewVO> reviewList) {
		this.reviewList = reviewList;
	}

	public ShopSearchVO getShopSearchVO() {
		return shopSearchVO;
	}

	public void setShopSearchVO(ShopSearchVO shopSearchVO) {
		this.shopSearchVO = shopSearchVO;
	}
	
	
}
