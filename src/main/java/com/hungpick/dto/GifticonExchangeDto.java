package com.hungpick.dto;

import java.util.Date;

public class GifticonExchangeDto {

	private String memberCode;
	private String gifticonExcode;
	private String gifticonCode;
	private String gifticonNumber;
	private Date gifticonExdate;
	private int usePoint;
	
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getGifticonExcode() {
		return gifticonExcode;
	}
	public void setGifticonExcode(String gifticonExcode) {
		this.gifticonExcode = gifticonExcode;
	}
	public String getGifticonCode() {
		return gifticonCode;
	}
	public void setGifticonCode(String gifticonCode) {
		this.gifticonCode = gifticonCode;
	}
	public String getGifticonNumber() {
		return gifticonNumber;
	}
	public void setGifticonNumber(String gifticonNumber) {
		this.gifticonNumber = gifticonNumber;
	}
	public Date getGifticonExdate() {
		return gifticonExdate;
	}
	public void setGifticonExdate(Date gifticonExdate) {
		this.gifticonExdate = gifticonExdate;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	@Override
	public String toString() {
		return "GifticonExchangeDto [memberCode=" + memberCode + ", gifticonExcode=" + gifticonExcode
				+ ", gifticonCode=" + gifticonCode + ", gifticonNumber=" + gifticonNumber + ", gifticonExdate="
				+ gifticonExdate + ", usePoint=" + usePoint + "]";
	}
	
}
