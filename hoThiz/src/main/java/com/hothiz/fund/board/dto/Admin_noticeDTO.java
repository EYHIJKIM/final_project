package com.hothiz.fund.board.dto;

import java.sql.Date;

public class Admin_noticeDTO {
	
	private int notice_board_id;
	private String notice_board_title;
	private Date notice_board_date;
	private String notice_board_content;
	
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
	public Date getNotice_board_date() {
		return notice_board_date;
	}
	public void setNotice_board_date(Date notice_board_date) {
		this.notice_board_date = notice_board_date;
	}
	public String getNotice_board_content() {
		return notice_board_content;
	}
	public void setNotice_board_content(String notice_board_content) {
		this.notice_board_content = notice_board_content;
	}
	
	
}
