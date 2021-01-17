package com.hothiz.fund.board.dto;

import java.sql.Timestamp;

public class Qna_ReplyDTO {
	private String reply_id;
	private String reply_title;
	private String reply_content;
	private int qna_board_id;
	private Timestamp write_date;
	
	
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_title() {
		return reply_title;
	}
	public void setReply_title(String reply_title) {
		this.reply_title = reply_title;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public int getQna_board_id() {
		return qna_board_id;
	}
	public void setQna_board_id(int qna_board_id) {
		this.qna_board_id = qna_board_id;
	}
	
}
