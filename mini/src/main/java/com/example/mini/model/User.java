package com.example.mini.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public class User {
	private String userid;
	private String password;
	private String uName;
	private String partner;
	private String gender;
	private String uAddrNo;
	private String uAddr1;
	private String uAddr2;
	private String uPhone;
	private String uEmail;
	private String birth;
	private String weddingday;
	private String cdatetime;
	private String udatetime;
	private String status;
	private String bank;
	private String bankaccount;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getPartner() {
		return partner;
	}
	public void setPartner(String partner) {
		this.partner = partner;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getWeddingday() {
		return weddingday;
	}
	public void setWeddingday(String weddingday) {
		this.weddingday = weddingday;
	}
	public String getCdatetime() {
		return cdatetime;
	}
	public void setCdatetime(String cdatetime) {
		this.cdatetime = cdatetime;
	}
	public String getUdatetime() {
		return udatetime;
	}
	public void setUdatetime(String udatetime) {
		this.udatetime = udatetime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBankaccount() {
		return bankaccount;
	}
	public void setBankaccount(String bankaccount) {
		this.bankaccount = bankaccount;
	}
	public String getuAddrNo() {
		return uAddrNo;
	}
	public void setuAddrNo(String uAddrNo) {
		this.uAddrNo = uAddrNo;
	}
	public String getuAddr1() {
		return uAddr1;
	}
	public void setuAddr1(String uAddr1) {
		this.uAddr1 = uAddr1;
	}
	public String getuAddr2() {
		return uAddr2;
	}
	public void setuAddr2(String uAddr2) {
		this.uAddr2 = uAddr2;
	}

}
