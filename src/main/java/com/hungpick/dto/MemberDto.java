package com.hungpick.dto;

import java.sql.Date;

public class MemberDto {
	
		private String memberCode;
		private String memberId;
		private String memberPw;
		private String memberName;
		private String memberNickname;
		private String memberEmail;
		private String memberNumber;
		private Date memberDate;
		private int holdPoint;
		
		public String getMemberCode() {
			return memberCode;
		}
		public void setMemberCode(String memberCode) {
			this.memberCode = memberCode;
		}
		public String getMemberId() {
			return memberId;
		}
		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}
		public String getMemberPw() {
			return memberPw;
		}
		public void setMemberPw(String memberPw) {
			this.memberPw = memberPw;
		}
		public String getMemberName() {
			return memberName;
		}
		public void setMemberName(String memberName) {
			this.memberName = memberName;
		}
		public String getMemberNickname() {
			return memberNickname;
		}
		public void setMemberNickname(String memberNickname) {
			this.memberNickname = memberNickname;
		}
		public String getMemberEmail() {
			return memberEmail;
		}
		public void setMemberEmail(String memberEmail) {
			this.memberEmail = memberEmail;
		}
		public String getMemberNumber() {
			return memberNumber;
		}
		public void setMemberNumber(String memberNumber) {
			this.memberNumber = memberNumber;
		}
		public Date getMemberDate() {
			return memberDate;
		}
		public void setMemberDate(Date memberDate) {
			this.memberDate = memberDate;
		}
		public int getHoldPoint() {
			return holdPoint;
		}
		public void setHoldPoint(int holdPoint) {
			this.holdPoint = holdPoint;
		}
}
