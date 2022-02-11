package com.hungpick.dto;

public class AnswerDto {
	
	private String  memberCode;
	private String  qstnCode;
	private String     answerCode;
	private String  adminCode;
	private String  answerContent;
	private String  answerDate;
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
	public String getAnswerCode() {
		return answerCode;
	}
	public void setAnswerCode(String answerCode) {
		this.answerCode = answerCode;
	}
	public String getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	@Override
	public String toString() {
		return "AnswerDto [memberCode=" + memberCode + ", qstnCode=" + qstnCode + ", answerCode=" + answerCode
				+ ", adminCode=" + adminCode + ", answerContent=" + answerContent + ", answerDate=" + answerDate + "]";
	}
	
	
	
}
