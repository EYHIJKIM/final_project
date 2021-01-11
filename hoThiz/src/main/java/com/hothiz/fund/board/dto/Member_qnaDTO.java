package com.hothiz.fund.board.dto;

import java.util.Date;

public class Member_qnaDTO {
	private int qna_board_id;
	private String qna_board_title;
	private String qna_board_content;
	private String member_email;
	private Date qna_board_date;
	private int qna_board_indent;
	private int qna_board_hit;
	
	
	public int getQna_board_hit() {
		return qna_board_hit;
	}
	public void setQna_board_hit(int qna_board_hit) {
		this.qna_board_hit = qna_board_hit;
	}
	public int getQna_board_id() {
		return qna_board_id;
	}
	public void setQna_board_id(int qna_board_id) {
		this.qna_board_id = qna_board_id;
	}
	public String getQna_board_title() {
		return qna_board_title;
	}
	public void setQna_board_title(String qna_board_title) {
		this.qna_board_title = qna_board_title;
	}
	public String getQna_board_content() {
		return qna_board_content;
	}
	public void setQna_board_content(String qna_board_content) {
		this.qna_board_content = qna_board_content;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public Date getQna_board_date() {
		return qna_board_date;
	}
	public void setQna_board_date(Date qna_board_date) {
		this.qna_board_date = qna_board_date;
	}
	public int getQna_board_indent() {
		return qna_board_indent;
	}
	public void setQna_board_indent(int qna_board_indent) {
		this.qna_board_indent = qna_board_indent;
	}
	
	
}
