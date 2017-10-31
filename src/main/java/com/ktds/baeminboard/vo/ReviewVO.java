package com.ktds.baeminboard.vo;

import com.ktds.oauthmember.vo.OauthmemberVO;

public class ReviewVO {

	private int review_id;
	private int shop_id;
	private String member_id;
	private String review_content;
	private String file_name;
	private String write_date;
	private String starpoint;

	private OauthmemberVO oauthmemberVO;

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getShop_id() {
		return shop_id;
	}

	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getStarpoint() {
		return starpoint;
	}

	public void setStarpoint(String starpoint) {
		this.starpoint = starpoint;
	}

	public OauthmemberVO getOauthmemberVO() {
		return oauthmemberVO;
	}

	public void setOauthmemberVO(OauthmemberVO oauthmemberVO) {
		this.oauthmemberVO = oauthmemberVO;
	}

}
