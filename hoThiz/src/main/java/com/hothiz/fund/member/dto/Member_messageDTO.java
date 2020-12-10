package com.hothiz.fund.member.dto;

public class Member_messageDTO {
	private String member_email;
	private String message_type;
	private String message_content;
	private String message_send_member;
	private String message_receive_member;
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMessage_type() {
		return message_type;
	}
	public void setMessage_type(String message_type) {
		this.message_type = message_type;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_send_member() {
		return message_send_member;
	}
	public void setMessage_send_member(String message_send_member) {
		this.message_send_member = message_send_member;
	}
	public String getMessage_receive_member() {
		return message_receive_member;
	}
	public void setMessage_receive_member(String message_receive_member) {
		this.message_receive_member = message_receive_member;
	}
}
