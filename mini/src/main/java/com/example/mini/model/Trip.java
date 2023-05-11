package com.example.mini.model;

public class Trip {
	private String tripNo;
	private String tKind;
	private String tAddr;
	private String tCdatetime;
	private String tUdatetime;
	private String tName;
	private String tContent;
	public String getTripNo() {
		return tripNo;
	}
	public void setTripNo(String tripNo) {
		this.tripNo = tripNo;
	}
	public String gettKind() {
		return tKind;
	}
	public void settKind(String tKind) {
		this.tKind = tKind;
	}
	public String gettAddr() {
		return tAddr;
	}
	public void settAddr(String tAddr) {
		this.tAddr = tAddr;
	}
	public String gettCdatetime() {
		return tCdatetime;
	}
	public void settCdatetime(String tCdatetime) {
		this.tCdatetime = tCdatetime;
	}
	public String gettUdatetime() {
		return tUdatetime;
	}
	public void settUdatetime(String tUdatetime) {
		this.tUdatetime = tUdatetime;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String gettContent() {
		return tContent;
	}
	public void settContent(String tContent) {
		this.tContent = tContent;
	}
}
