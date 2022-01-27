package com.hungpick.dto;

public class Question {
	
	private String memberCode;
	private String qstnCode;
	private String qstnTitle;
	private String qstnContent;
	private String qstnImg;
	private String qstnDate;
	private String qstnConfirm;
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getQstnCode() {
		return qstnCode;
	}
	public void setQstnCode(String qstnCode) {
		this.qstnCode = qstnCode;
	}
	public String getQstnTitle() {
		return qstnTitle;
	}
	
	public void setQstnTitle(String qstnTitle) {
		this.qstnTitle = qstnTitle;
	}
	
	public String getQstnContent() {
		return qstnContent;
	}
	public void setQstnContent(String qstnContent) {
		this.qstnContent = qstnContent;
	}
	public String getQstnImg() {
		return qstnImg;
	}
	public void setQstnImg(String qstnImg) {
		this.qstnImg = qstnImg;
	}
	public String getQstnDate() {
		return qstnDate;
	}
	public void setQstnDate(String qstnDate) {
		this.qstnDate = qstnDate;
	}
	public String getQstnConfirm() {
		return qstnConfirm;
	}
	public void setQstnConfirm(String qstnConfirm) {
		this.qstnConfirm = qstnConfirm;
	}
	@Override
	public String toString() {
		return "Question [memberCode=" + memberCode + ", qstnCode=" + qstnCode + ", qstnTitle=" + qstnTitle
				+ ", qstnContent=" + qstnContent + ", qstnDate=" + qstnDate + ", qstnConfirm=" + qstnConfirm + "]";
	}
	
	
}
