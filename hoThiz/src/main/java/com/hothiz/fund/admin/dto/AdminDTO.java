package com.hothiz.fund.admin.dto;

import java.sql.Timestamp;

public class AdminDTO {
	private int notice_board_id;
	private String notice_board_title;
	private String notice_board_content;
	private Timestamp notice_board_date;
	
	public int getNotice_board_id() {
		return notice_board_id;
	}
	public void setNotice_board_id(int notice_board_id) {
		this.notice_board_id = notice_board_id;
	}
	public String getNotice_board_title() {
		return notice_board_title;
	}
	public void setNotice_board_title(String notice_board_title) {
		this.notice_board_title = notice_board_title;
	}
	public String getNotice_board_content() {
		return notice_board_content;
	}
	public void setNotice_board_content(String notice_board_content) {
		this.notice_board_content = notice_board_content;
	}
	public Timestamp getNotice_board_date() {
		return notice_board_date;
	}
	public void setNotice_board_date(Timestamp notice_board_date) {
		this.notice_board_date = notice_board_date;
	}
	
	
}
