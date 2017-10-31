package com.ktds.order.vo;

import java.util.List;

public class OrderListVO {

	private int orderlistId;
	private int shopId;
	private String memberId;
	private int totalPrice;
	private String payMethod;
	private String orderPhoneNumber;
	private String orderAddress;
	private String requestContent;
	private String reviewYn;
	private String reviewPossibleYn;
	private String orderDate;
	private int pointsavePrice;
	private String pointsaveDate;
	private String orderStatus;

	private List<OrderDetailVO> orderDetailList;

	public int getOrderlistId() {
		return orderlistId;
	}

	public void setOrderlistId(int orderlistId) {
		this.orderlistId = orderlistId;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getOrderPhoneNumber() {
		return orderPhoneNumber;
	}

	public void setOrderPhoneNumber(String orderPhoneNumber) {
		this.orderPhoneNumber = orderPhoneNumber;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getRequestContent() {
		return requestContent;
	}

	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}

	public String getReviewYn() {
		return reviewYn;
	}

	public void setReviewYn(String reviewYn) {
		this.reviewYn = reviewYn;
	}

	public String getReviewPossibleYn() {
		return reviewPossibleYn;
	}

	public void setReviewPossibleYn(String reviewPossibleYn) {
		this.reviewPossibleYn = reviewPossibleYn;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getPointsavePrice() {
		return pointsavePrice;
	}

	public void setPointsavePrice(int pointsavePrice) {
		this.pointsavePrice = pointsavePrice;
	}

	public String getPointsaveDate() {
		return pointsaveDate;
	}

	public void setPointsaveDate(String pointsaveDate) {
		this.pointsaveDate = pointsaveDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public List<OrderDetailVO> getOrderDetailList() {
		return orderDetailList;
	}

	public void setOrderDetailList(List<OrderDetailVO> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}

}
