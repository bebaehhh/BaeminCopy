package com.ktds.baeminboard.vo;

import java.util.List;

public class ShopMenuCategoryVO {

	private int shop_category_id;
	private int shop_id;
	private String category_name;

	private List<ShopMenuDetailVO> shopMenuDetailList;

	public int getShop_category_id() {
		return shop_category_id;
	}

	public void setShop_category_id(int shop_category_id) {
		this.shop_category_id = shop_category_id;
	}

	public int getShop_id() {
		return shop_id;
	}

	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public List<ShopMenuDetailVO> getShopMenuDetailList() {
		return shopMenuDetailList;
	}

	public void setShopMenuDetailList(List<ShopMenuDetailVO> shopMenuDetailList) {
		this.shopMenuDetailList = shopMenuDetailList;
	}

}
