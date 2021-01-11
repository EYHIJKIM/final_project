package com.hothiz.fund.project.dto;

import java.sql.Date;

public class ProjectDateDTO {
	
	

	//
	private int project_id;
	private String prelaunching_day; //공개예정 날짜 출력
	
	private int d_day; //deadline - sysdate : 남은 날
					   //양수 : 진행중
					   //음수 : sysdate가 더 큰거임..그니까 긑난거라고..
							
	private int chk; //sysdate - release : 공개예정? 진행중?
					 //양수 : 진행 중(지금 날짜가 release보다 커야함.)
					// 음수 : 공개예정(지금 날짜가 release보다 작아야함)

	
	//release - deadline
	//진행 중 : chk>=0 이고 dead>=0
	//공개예정 : chk<=0
	/*		 
	 공개예정 :    sysdate < release < deadline
	 		sysdate - release = 음수  chk
	 		deadline - sysdate = 양수 d_day
	 		rleease - deadline = 음수
	 
	 진행중 : release < sysdate < deadline
	 		sysdate - release = 양수 chk
	 		deadline - sysdate = 양수 d_day
	 		rleease - deadline = 양수
	 
	 
	 끝남 : release < deadline < sysdate
	 		sysdate - release = 양수 chk
	 		deadline - sysdate = 음수 d_day
	 		rleease - deadline = 음수
	 */
	
	
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
	public int getD_day() {
		return d_day;
	}
	public void setD_day(int d_day) {
		this.d_day = d_day;
	}

	
	//만약 지금날짜<공개예정 이면 남은날짜에는 공예 - 지금날짜 가 들어오겠지...
	
	
	//만약 펀딩중이면, 지금날짜>공개예정이면
	
	
	
	
	
}
