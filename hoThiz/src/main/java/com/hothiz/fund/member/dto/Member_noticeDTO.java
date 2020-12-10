package com.hothiz.fund.member.dto;

public class Member_noticeDTO {

	private	String member_email;
	private int project_id;
	private int project_process;
	
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
	public int getProject_process() {
		return project_process;
	}
	public void setProject_process(int project_process) {
		this.project_process = project_process;
	}
	
	
}
