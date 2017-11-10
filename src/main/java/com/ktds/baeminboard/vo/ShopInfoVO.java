package com.ktds.baeminboard.vo;

import java.util.List;

public class ShopInfoVO {

	private int shop_id;
	private String shop_name;
	private String menu_category_name;
	private String shop_open_time;
	private String shop_close_time;
	private String shop_address;
	private String shop_address_detail;
	private String shop_photo_filename;
	private String shop_phonenumber;
	private String shop_introduce;
	private String madein_introduce_comment;
	private String paynow_possible_yn;
	private String pay_yn;
	private String min_payment;
	private int star_point_avg;

	private List<ShopMenuCategoryVO> shopMenuCategoryList;

	public int getShop_id() {
		return shop_id;
	}

	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getMenu_category_name() {
		return menu_category_name;
	}

	public void setMenu_category_name(String menu_category_name) {
		this.menu_category_name = menu_category_name;
	}

	public String getShop_open_time() {
		return shop_open_time;
	}

	public void setShop_open_time(String shop_open_time) {
		this.shop_open_time = shop_open_time;
	}

	public String getShop_close_time() {
		return shop_close_time;
	}

	public void setShop_close_time(String shop_close_time) {
		this.shop_close_time = shop_close_time;
	}

	public String getShop_address() {
		return shop_address;
	}

	public void setShop_address(String shop_address) {
		this.shop_address = shop_address;
	}

	public String getShop_address_detail() {
		return shop_address_detail;
	}

	public void setShop_address_detail(String shop_address_detail) {
		this.shop_address_detail = shop_address_detail;
	}

	public String getShop_photo_filename() {
		return shop_photo_filename;
	}

	public void setShop_photo_filename(String shop_photo_filename) {
		this.shop_photo_filename = shop_photo_filename;
	}

	public String getShop_phonenumber() {
		return shop_phonenumber;
	}

	public void setShop_phonenumber(String shop_phonenumber) {
		this.shop_phonenumber = shop_phonenumber;
	}

	public String getShop_introduce() {
		return shop_introduce;
	}

	public void setShop_introduce(String shop_introduce) {
		this.shop_introduce = shop_introduce;
	}

	public String getMadein_introduce_comment() {
		return madein_introduce_comment;
	}

	public void setMadein_introduce_comment(String madein_introduce_comment) {
		this.madein_introduce_comment = madein_introduce_comment;
	}

	public String getPaynow_possible_yn() {
		return paynow_possible_yn;
	}

	public void setPaynow_possible_yn(String paynow_possible_yn) {
		this.paynow_possible_yn = paynow_possible_yn;
	}

	public String getPay_yn() {
		return pay_yn;
	}

	public void setPay_yn(String pay_yn) {
		this.pay_yn = pay_yn;
	}

	public String getMin_payment() {
		return min_payment;
	}

	public void setMin_payment(String min_payment) {
		this.min_payment = min_payment;
	}

	public int getStar_point_avg() {
		return star_point_avg;
	}

	public void setStar_point_avg(int star_point_avg) {
		this.star_point_avg = star_point_avg;
	}

	public List<ShopMenuCategoryVO> getShopMenuCategoryList() {
		return shopMenuCategoryList;
	}

	public void setShopMenuCategoryList(List<ShopMenuCategoryVO> shopMenuCategoryList) {
		this.shopMenuCategoryList = shopMenuCategoryList;
	}
	
	public static ShopInfoVO replace(ShopInfoVO vo) {
		vo.setShop_photo_filename(
				vo.getShop_photo_filename().replaceAll("\\.", "-"));
		return vo;
	}

}
