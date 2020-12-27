package com.hothiz.fund.project.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_alarmDTO;
import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.project.dto.ProjectParamDTO;
import com.hothiz.fund.project.dto.ProjectDateDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;

public interface ProjectService {


	///////////////////////////////게시글////////////////////////////////////////
	
	/////////1. 게시글 리스트
	
	//메인 게시글 리스트
	public void getMainProjectList(Model model);
	
	//게시글 리스트 뽑아오기(조건에 따라서)
	public ArrayList<ProjectInfoDTO> getParamProjectList(ProjectParamDTO paramDto);
	
		//멤버정보 리스트 => 목록에서 닉네임 뽑을때 필요
		public ArrayList<MemberDTO> getMemberInfoList();
		
		//<게시글 번호, 게시글날짜DTO> ==> 목록 뽑아올 때 ongoing/prelaunching/confirm 조건거는데 필요
		public Map<Integer, ProjectDateDTO> getDDayMap();
	
	//게시글 리스트 비동기로 뽑아오기
	public String syncGetData(ProjectParamDTO paramDto, HttpSession session);
		
	
	
	////////2. 게시글 상세 정보
	public ProjectInfoDTO getAProjectDetail(int project_id);

		//해당 프로젝트 후원한 인원수
		int getDonatedMemCount(int project_id);
	
		//게시글 남은 날짜
		public ProjectDateDTO getADDay(int project_id);
		
		//(prelaunching게시글) 해당프젝 알림 인원
		public int getAlarmMemCount(int project_id);
		
		
		
	//////////////////////////////좋아요 or 알림//////////////////////////////////
	//좋아요했는지 안했는지를 체크함
	public String chkLike(Member_likeDTO likeDto);
	
	//알림 신청 확인
	public String chkAlarm(Member_alarmDTO alarmDto);
	/////////////////////////////

	//알림, or 좋아요 신청한 프로젝트 리스트
	public ArrayList<Integer> likeOrAlarmProjectList(HttpSession session, ProjectParamDTO paramDto);

	
	


	
	//멤버 한명 상세정보
	public MemberDTO getAMemberDetail(String member_email);
	
	//public Map<Integer, MemberDTO> getPrjMemberInfoMap();






	

	




	
}
