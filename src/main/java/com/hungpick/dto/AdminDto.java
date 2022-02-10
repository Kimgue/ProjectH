package com.hungpick.dto;

public class AdminDto {

	private String adminCode;
	private String adminId;
	private String adminPw;
	private String adminName;
	
	public String getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	
	@Override
	public String toString() {
		return "AdminDto [adminCode=" + adminCode + ", adminId=" + adminId + ", adminPw=" + adminPw + ", adminName="
				+ adminName + "]";
	}
}
