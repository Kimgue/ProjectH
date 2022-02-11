package com.hungpick.dto;

public class Notice {
	
	private String adminCode;
	private String noticeCode;
	private String noticeTitle;
	private String noticeContent;
	private String noticeImg;
	private String noticeDate;
	public String getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}
	public String getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(String noticeCode) {
		this.noticeCode = noticeCode;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	
	public String getNoticeImg() {
		return noticeImg;
	}
	public void setNoticeImg(String noticeImg) {
		this.noticeImg = noticeImg;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	@Override
	public String toString() {
		return "Notice [adminCode=" + adminCode + ", noticeCode=" + noticeCode + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", boticeImg=" + noticeImg + ", noticeDate=" + noticeDate + "]";
	}
	
	
	
	
	
	
}
