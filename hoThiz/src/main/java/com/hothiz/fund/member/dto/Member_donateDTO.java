package com.hothiz.fund.member.dto;

public class Member_donateDTO {

	private String member_email;
	private int project_id;
	private int member_donate_price;
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public int getMember_donate_price() {
		return member_donate_price;
	}
	public void setMember_donate_price(int member_donate_price) {
		this.member_donate_price = member_donate_price;
	}
	
	
	
}
