package com.hungpick.dto;

public class Gifticon {

	private String gifticonCode;
	private String brandCode;
	private String menuCode;
	private String gifticonName;
	private String gifticonImg;
	private int gifticonPrice;
	
	public String getGifticonCode() {
		return gifticonCode;
	}
	public void setGifticonCode(String gifticonCode) {
		this.gifticonCode = gifticonCode;
	}
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
	public String getGifticonName() {
		return gifticonName;
	}
	public void setGifticonName(String gifticonName) {
		this.gifticonName = gifticonName;
	}
	public String getGifticonImg() {
		return gifticonImg;
	}
	public void setGifticonImg(String gifticonImg) {
		this.gifticonImg = gifticonImg;
	}
	public int getGifticonPrice() {
		return gifticonPrice;
	}
	public void setGifticonPrice(int gifticonPrice) {
		this.gifticonPrice = gifticonPrice;
	}
	
	@Override
	public String toString() {
		return "Gifticon [gifticonCode=" + gifticonCode + ", brandCode=" + brandCode + ", menuCode=" + menuCode
				+ ", gifticonName=" + gifticonName + ", gifticonImg=" + gifticonImg + ", gifticonPrice=" + gifticonPrice
				+ "]";
	}
	
	
}
