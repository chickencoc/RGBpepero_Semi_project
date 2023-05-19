package com.example.mini.model;

import lombok.Data;

@Data
public class Return {

	private String userId;
	private String cDatetime;
	private String productNo;
	private String guestNo;
	private String userid;
	private String gPhone;
	private String gName;
	private String orderNo;
	private String imgSrc;
	private String price;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getcDatetime() {
		return cDatetime;
	}
	public void setcDatetime(String cDatetime) {
		this.cDatetime = cDatetime;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getGuestNo() {
		return guestNo;
	}
	public void setGuestNo(String guestNo) {
		this.guestNo = guestNo;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getgPhone() {
		return gPhone;
	}
	public void setgPhone(String gPhone) {
		this.gPhone = gPhone;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getRetCnt() {
		return retCnt;
	}
	public void setRetCnt(String retCnt) {
		this.retCnt = retCnt;
	}
	private String retCnt;
	
	
}
