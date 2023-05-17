package com.example.mini.model;

import lombok.Data;

@Data
public class MyRegistry {
	private String registryNo;
	private String productNo;
	private String tripNo;
	private String rCdatetime;
	private String rUdatetime;
	private String rOption;
	private String rContent;
	private String rCnt;
	private String userId;
	private String fundYn;
	private String imgSrc;
	private String pStock;
	private String pName;
	private String pPrice;
	private String orderNo;
	private String uName;
	
	private String fSetprice;
	private String fPutprice;


	
	public String getRegistryNo() {
		return registryNo;
	}
	public void setRegistryNo(String registryNo) {
		this.registryNo = registryNo;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getTripNo() {
		return tripNo;
	}
	public void setTripNo(String tripNo) {
		this.tripNo = tripNo;
	}
	public String getrCdatetime() {
		return rCdatetime;
	}
	public void setrCdatetime(String rCdatetime) {
		this.rCdatetime = rCdatetime;
	}
	public String getrUdatetime() {
		return rUdatetime;
	}
	public void setrUdatetime(String rUdatetime) {
		this.rUdatetime = rUdatetime;
	}
	public String getrOption() {
		return rOption;
	}
	public void setrOption(String rOption) {
		this.rOption = rOption;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFundYn() {
		return fundYn;
	}
	public void setFundYn(String fundYn) {
		this.fundYn = fundYn;
	}
	public String getimgSrc() {
		return imgSrc;
	}
	public void setimgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	
	public String getpStock() {
		return pStock;
	}
	public void setpStock(String pStock) {
		this.pStock = pStock;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getfSetprice() {
		return fSetprice;
	}
	public void setfSetprice(String fSetprice) {
		this.fSetprice = fSetprice;
	}
	public String getfPutprice() {
		return fPutprice;
	}
	public void setfPutprice(String fPutprice) {
		this.fPutprice = fPutprice;
	}
}
