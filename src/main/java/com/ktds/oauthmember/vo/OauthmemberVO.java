package com.ktds.oauthmember.vo;

import com.ktds.baeminboard.vo.ReviewVO;
import com.ktds.baeminboard.vo.ShopInfoVO;
import com.ktds.order.vo.OrderListVO;

public class OauthmemberVO {

	private String memberId;
	private String password;
	private String birthday;
	private String phoneNumber;
	private String genderFlag;
	private String useAgreementYn;
	private String elecFinaceAgreementYn;
	private String infoCorrectYn;
	private String infoThirdAgreementYn;
	private String mailSmsYn;
	private String idCreateDate;
	private String nickName;
	private String profile_photo;
	
	private String oldMemberId;
	
	
	private OrderListVO orderListVO;
	private ShopInfoVO shopInfoVO;
	
	private ReviewVO reviewVO;
	private BookmarkVO bookmarkVO;
	
	private int reviewCount;
	private int bookmarkCount;
	
	private int lastOrderReviewCount;
	private int lastOrderBookmarkCount;
	
	public int getLastOrderReviewCount() {
		return lastOrderReviewCount;
	}

	public void setLastOrderReviewCount(int lastOrderReviewCount) {
		this.lastOrderReviewCount = lastOrderReviewCount;
	}

	public int getLastOrderBookmarkCount() {
		return lastOrderBookmarkCount;
	}

	public void setLastOrderBookmarkCount(int lastOrderBookmarkCount) {
		this.lastOrderBookmarkCount = lastOrderBookmarkCount;
	}

	public ReviewVO getReviewVO() {
		return reviewVO;
	}

	public void setReviewVO(ReviewVO reviewVO) {
		this.reviewVO = reviewVO;
	}

	public BookmarkVO getBookmarkVO() {
		return bookmarkVO;
	}

	public void setBookmarkVO(BookmarkVO bookmarkVO) {
		this.bookmarkVO = bookmarkVO;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getBookmarkCount() {
		return bookmarkCount;
	}

	public void setBookmarkCount(int bookmarkCount) {
		this.bookmarkCount = bookmarkCount;
	}

	public String getOldMemberId() {
		return oldMemberId;
	}

	public void setOldMemberId(String oldMemberId) {
		this.oldMemberId = oldMemberId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getGenderFlag() {
		return genderFlag;
	}

	public void setGenderFlag(String genderFlag) {
		this.genderFlag = genderFlag;
	}

	public String getUseAgreementYn() {
		return useAgreementYn;
	}

	public void setUseAgreementYn(String useAgreementYn) {
		this.useAgreementYn = useAgreementYn;
	}

	public String getElecFinaceAgreementYn() {
		return elecFinaceAgreementYn;
	}

	public void setElecFinaceAgreementYn(String elecFinaceAgreementYn) {
		this.elecFinaceAgreementYn = elecFinaceAgreementYn;
	}

	public String getInfoCorrectYn() {
		return infoCorrectYn;
	}

	public void setInfoCorrectYn(String infoCorrectYn) {
		this.infoCorrectYn = infoCorrectYn;
	}

	public String getInfoThirdAgreementYn() {
		return infoThirdAgreementYn;
	}

	public void setInfoThirdAgreementYn(String infoThirdAgreementYn) {
		this.infoThirdAgreementYn = infoThirdAgreementYn;
	}

	public String getMailSmsYn() {
		return mailSmsYn;
	}

	public void setMailSmsYn(String mailSmsYn) {
		this.mailSmsYn = mailSmsYn;
	}

	public String getIdCreateDate() {
		return idCreateDate;
	}

	public void setIdCreateDate(String idCreateDate) {
		this.idCreateDate = idCreateDate;
	}
	
	

	public String getProfile_photo() {
		return profile_photo;
	}

	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}

	public OrderListVO getOrderListVO() {
		return orderListVO;
	}

	public void setOrderListVO(OrderListVO orderListVO) {
		this.orderListVO = orderListVO;
	}

	public ShopInfoVO getShopInfoVO() {
		return shopInfoVO;
	}

	public void setShopInfoVO(ShopInfoVO shopInfoVO) {
		this.shopInfoVO = shopInfoVO;
	}

}
