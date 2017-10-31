package com.ktds.baeminboard.vo;

import java.util.List;

public class ShopMenuDetailVO {

	private int shop_menu_id;
	private int shop_category_id;
	private String menu_name;
	private int menu_price;
	private String recommend_menu_yn;
	private String menu_photo_file;
	private String menu_comment;

	private List<MenuOptionVO> menuOptionList;

	public int getShop_menu_id() {
		return shop_menu_id;
	}

	public void setShop_menu_id(int shop_menu_id) {
		this.shop_menu_id = shop_menu_id;
	}

	public int getShop_category_id() {
		return shop_category_id;
	}

	public void setShop_category_id(int shop_category_id) {
		this.shop_category_id = shop_category_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getRecommend_menu_yn() {
		return recommend_menu_yn;
	}

	public void setRecommend_menu_yn(String recommend_menu_yn) {
		this.recommend_menu_yn = recommend_menu_yn;
	}

	public String getMenu_photo_file() {
		return menu_photo_file;
	}

	public void setMenu_photo_file(String menu_photo_file) {
		this.menu_photo_file = menu_photo_file;
	}

	public String getMenu_comment() {
		return menu_comment;
	}

	public void setMenu_comment(String menu_comment) {
		this.menu_comment = menu_comment;
	}

	public List<MenuOptionVO> getMenuOptionList() {
		return menuOptionList;
	}

	public void setMenuOptionList(List<MenuOptionVO> menuOptionList) {
		this.menuOptionList = menuOptionList;
	}

}
