package com.hungpick.dto;


public class ReviewDto {
	
	private String brandCode;
	private String menuCode;
	private String reviewCode;
	private String memberCode;
	private double reviewScore;
	private String reviewContent;
	private String reviewDate;
	private String reviewImg;
	private String reviewConfirm;
	private int earnPoint;
	private String earnDatePoint;
	
	public String getBrandCode() {
		return brandCode;
	}
	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getReviewCode() {
		return reviewCode;
	}
	public void setReviewCode(String reviewCode) {
		this.reviewCode = reviewCode;
	}
	public double getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(double reviewScore) {
		this.reviewScore = reviewScore;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}

	public String getReviewConfirm() {
		return reviewConfirm;
	}
	public void setReviewConfirm(String reviewConfirm) {
		this.reviewConfirm = reviewConfirm;
	}
	public int getEarnPoint() {
		return earnPoint;
	}
	public void setEarnPoint(int earnPoint) {
		this.earnPoint = earnPoint;
	}
	public String getEarnDatePoint() {
		return earnDatePoint;
	}
	public void setEarnDatePoint(String earnDatePoint) {
		this.earnDatePoint = earnDatePoint;
	}




	
	
}