package com.hothiz.fund.project.dto;

import java.sql.Date;

public class ProjectDateDTO {
	
	
	//
	private int project_id;
	private String prelaunching_day;
	private String d_day;
	private int chk; //음수면 예정
	
	
	
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getPrelaunching_day() {
		return prelaunching_day;
	}
	public void setPrelaunching_day(String prelaunching_day) {
		this.prelaunching_day = prelaunching_day;
	}
	public String getD_day() {
		return d_day;
	}
	public void setD_day(String d_day) {
		this.d_day = d_day;
	}
	
	
	
	
	//만약 지금날짜<공개예정 이면 남은날짜에는 공예 - 지금날짜 가 들어오겠지...
	
	
	//만약 펀딩중이면, 지금날짜>공개예정이면
	
	
	
	
	
}
