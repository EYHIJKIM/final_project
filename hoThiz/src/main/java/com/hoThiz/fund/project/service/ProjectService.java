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

	
	//게시글 비동기로 뽑아오기(30개씩)
	public String getProjectList(ProjectParamDTO paramDto);
	
	//처음에 30개 뽑아옴
	public ArrayList<ProjectInfoDTO> firstProjectView(ProjectParamDTO paramDto);

	//게시글 정보
	public ProjectInfoDTO getAProjectDetail(int project_id);

	//좋아요했는지 안했는지를 체크함
	public String chkLike(Member_likeDTO likeDto);
	
	//알림 신처 확인
	public String chkAlarm(Member_alarmDTO alarmDto);

	//알림, or 좋아요 신청한 프로젝트 리스트
	public ArrayList<Integer> likeOrAlarmProjectList(HttpSession session, ProjectParamDTO paramDto);

	//메인에서 필요한 게시글 리스트
	public void getMainProjectList(Model model);

	//게시글 상세정보
	public ArrayList<MemberDTO> getMemberInfoList();

	//멤버 한명 상세정보
	public MemberDTO getAMemberDetail(String member_email);

	//해당 프로젝트 후원한 인원수
	int getDonatedMemCount(int project_id);

	//남은날짜 리스트로 반환
	public Map<Integer, ProjectDateDTO> getDDayMap();
	
	//게시글 상세 남은 날짜
	public ProjectDateDTO getADDay(int project_id);
	
	//상세 알람 인원
	public int getAlarmMemCount(int project_id);

	
}
