package com.hothiz.fund.project.dto;

import java.sql.Date;

public class ProjectDateDTO {
	
	//공개예정날짜 
	private Date relaseDate;
	
	//지금 날짜
	private Date nowDate;
	
	//남은 날짜
	private Date dDay;
	
	//마감일
	private Date deadLine;
	

	
	

	public Date getRelaseDate() {
		return relaseDate;
	}

	public void setRelaseDate(Date relaseDate) {
		this.relaseDate = relaseDate;
	}

	public Date getNowDate() {
		return nowDate;
	}

	public void setNowDate(Date nowDate) {
		this.nowDate = nowDate;
	}

	public Date getdDay() {
		return dDay;
	}

	public void setdDay(Date dDay) {
		this.dDay = dDay;
	}

	public Date getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
	}

	
	
	//만약 지금날짜<공개예정 이면 남은날짜에는 공예 - 지금날짜 가 들어오겠지...
	
	
	//만약 펀딩중이면, 지금날짜>공개예정이면
	
	
	
	
	
}
