package com.hothiz.fund.project.controller;



import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_alarmDTO;
import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectParamDTO;
import com.hothiz.fund.project.dto.ProjectDateDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;
import com.hothiz.fund.project.service.ProjectService;
import com.hothiz.fund.project.service.ProjectServiceImpl;

@RestController
@RequestMapping("/discover")
public class ProjectController {
	
	@Autowired
	ProjectService ps;
	
	@Autowired
	ProjectDAO dao;
	
	
	
	///////////////////////////게시글 목록///////////////////////
	//게시글 화면
	@GetMapping(value="", produces = "application/json;charset=utf-8")
	public ModelAndView projectList(ModelAndView mv,
			ProjectParamDTO paramDto, HttpSession session) {


		mv.addObject("dDayMap",ps.getDDayMap()); //프젝id__dto(프젝id,d_day,prelaunching_day)
		mv.addObject("memberList",ps.getMemberInfoList());//멤버 정보들(닉네임 빼낼라고)
		mv.addObject("lOAList",ps.likeOrAlarmProjectList(session,paramDto));//좋아하는 게시글/ 혹은 알람신청한 게시글
		mv.addObject("firstList", ps.firstProjectView(paramDto));//게시글 목록
		
		mv.setViewName("project/project_list");
		
		//12월 20일 12일 - 12월 20일 18시
		
		return mv;
	}
	

	//비동기로 값 끌어오기 로직
	@GetMapping(value = "/getData", produces = "application/json;charset=utf-8")
	public String getProjectList(ProjectParamDTO paramDto) {
		System.out.println("비동기con");
		String jsonList = ps.getProjectList(paramDto);
		System.out.println(jsonList);
		
		return jsonList;
	}
	
	/*
	 맵, 밸류 형태로 프로젝트 정보 넘기려면..?
	 list<map<프로젝트id,프로젝트info dto>> = new ArrayList<>(); 일케하면 될거같다..??
	 ArrayList<map> 해서
	 [{project_id : ""} ,
	 */
	
	//프로젝트 좋아요 비동기
	//post의 값을 보낼땐 text로 매핑을 해줘야한다ㅜㅜ 겨우풀엇다
	@PostMapping(value="/like", produces="application/text;charset=utf-8")
	public String likeProject(Member_likeDTO likeDto) {	
		String msg = ps.chkLike(likeDto);
		
		
		return msg;
	}
	
	
	//프로젝트 알림
	@PostMapping(value="/alarm", produces="application/text;charset=utf-8" )
	public String chkAlarm(Member_alarmDTO alarmDto) {
		System.out.println("알림신청 들어옴");
		String msg = ps.chkAlarm(alarmDto);
		
		return msg;
		
	}
	
	
	/////////게시글 상세보기////////////////////////
	@GetMapping(value = "/{project_id}")
	public ModelAndView getAProjectDetail(@PathVariable int project_id, 
			ModelAndView mv, ProjectParamDTO paramDto) {
		String path = "project/project_content/story";
		//프로젝트 전체 값을 준다음에, 상세보기 페이지에서 받는다.
		//근데 이거...프리런칭인지/아닌지 구분해줘야 됨
		
		//프리런칭인 경우 alaram신청멤버 뽑아서 더해줌
		if(paramDto.getOngoing().equals("prelaunching")) {
			System.out.println("프리런칭임");
			path = "project/project_content/story?ongoing=prelaunching";
			int alarmMemberCnt = ps.getAlarmMemCount(project_id);
			mv.addObject("alarmMemberCnt", alarmMemberCnt);
		}
		
		ProjectInfoDTO prjDto=ps.getAProjectDetail(project_id);
		//해당 프로젝트의 이메일과 일치하는 유저정보를 가져온다.
		MemberDTO memberDto = ps.getAMemberDetail(prjDto.getMember_email());
		
		//후원한 인원수
		int donatedMemberCnt = ps.getDonatedMemCount(project_id);
		ProjectDateDTO dateDto = ps.getADDay(project_id);
		
		
		
		mv.addObject("dDayInfo", dateDto );
		mv.addObject("donatedMemberCnt", donatedMemberCnt);
		mv.addObject("memberInfo", memberDto);
		mv.addObject("projectInfo", prjDto);
		//mv에 후원자 몇명인지, 프로필사진 꺼내오는 오브젝트도 set해줘야함..
		
		
		mv.setViewName(path);

		
		
		return mv;
	}
	
	@GetMapping(value = "/{project_id}/community")
	public ModelAndView getAProjectLive(@PathVariable int project_id, ModelAndView mv) {
		
		//해당 프젝 라이브 꺼내와야함.
		mv.setViewName("project/project_content/community");
		return mv;
	}
	
	
	@GetMapping(value = "/{project_id}/notice")
	public ModelAndView getAProjectNotice(@PathVariable int project_id, ModelAndView mv) {
		
		//해당 프젝 라이브 꺼내와야함.
		mv.setViewName("project/project_content/notice");
		return mv;
	}
	

	
	
	@GetMapping(value="/time")
	public ModelAndView time(ModelAndView mv) {
		
		
		
		
		
		mv.setViewName("time");
		return mv;
	}
	
	
	/*

	@RequestMapping("/insert")
	public void insert() {
		
			for(int i=1;i<31;i++) {
				ProjectInfoDTO dto = new ProjectInfoDTO();
				String e = ""+i;
				dto.setMember_email(e);
				dto.setProject_like(i*50);
				dto.setProject_current_percent(i*50);
				dto.setProject_title(i+"제목");
				dto.setProject_summary("요약"+i);
				dto.setProject_target_price(i*1000);
				dto.setProject_main_category("video");
				dto.setProject_sub_category("film");
				dao.setProjectInfo(dto);
			}
		
	}
*/

	//날짜 넣장
	@RequestMapping("/update")
	public void update() {
	

	}
	
	

}
