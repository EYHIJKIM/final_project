package com.hothiz.fund.project.dto;

import java.sql.Date;

public class ProjectCommunityDTO {
	
	

	    
	    private int project_id;
	 	private int bno;
	 	private String content;
	 	private String member_email;
	 	private String member_name;
	 	private Date regdate;
	 	private String dateFormat;
	 	
	 	
	 	
		public String getDateFormat() {
			return dateFormat;
		}
		public void setDateFormat(String dateFormat) {
			this.dateFormat = dateFormat;
		}
		public int getProject_id() {
			return project_id;
		}
		public void setProject_id(int project_id) {
			this.project_id = project_id;
		}
		public int getBno() {
			return bno;
		}
		public void setBno(int bno) {
			this.bno = bno;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getMember_email() {
			return member_email;
		}
		public void setMember_email(String member_email) {
			this.member_email = member_email;
		}
		public String getMember_name() {
			return member_name;
		}
		public void setMember_name(String member_name) {
			this.member_name = member_name;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
	
	
	

}
