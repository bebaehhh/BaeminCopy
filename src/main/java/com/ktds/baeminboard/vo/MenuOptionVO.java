package com.ktds.baeminboard.vo;

public class MenuOptionVO {

	private int menu_option_id;
	private int shop_menu_id;
	private String option_name;
	private int option_price;
	private String required_yn;

	public int getMenu_option_id() {
		return menu_option_id;
	}

	public void setMenu_option_id(int menu_option_id) {
		this.menu_option_id = menu_option_id;
	}

	public int getShop_menu_id() {
		return shop_menu_id;
	}

	public void setShop_menu_id(int shop_menu_id) {
		this.shop_menu_id = shop_menu_id;
	}

	public String getOption_name() {
		return option_name;
	}

	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}

	public int getOption_price() {
		return option_price;
	}

	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}

	public String getRequired_yn() {
		return required_yn;
	}

	public void setRequired_yn(String required_yn) {
		this.required_yn = required_yn;
	}

}
