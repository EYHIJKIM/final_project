package com.hothiz.fund.project.controller;





import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_alarmDTO;
import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectParamDTO;

import com.hothiz.fund.project.dto.ProjectInfoDTO;

import com.hothiz.fund.project.service.ProjectService;


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
		
		
		mv.addObject("dDayMap",ps.getDDayMap()); 			//프젝id__dto(프젝id,d_day,prelaunching_day)
		mv.addObject("memberMap",ps.getMemberInfoList());  //멤버 정보들(닉네임 빼낼라고)
		mv.addObject("likeOrAlarmList",ps.likeOrAlarmProjectList(session,paramDto));//좋아하는 게시글/ 혹은 알람신청한 게시글
		mv.addObject("firstList", ps.getParamProjectList(paramDto)); //게시글 목록
		
		mv.setViewName("project/project_list");

		
		return mv;
	}
	

	//비동기로 값 끌어오기 로직
	@GetMapping(value = "/getData", produces = "application/json;charset=utf-8")
	public String getProjectList(ProjectParamDTO paramDto, HttpSession session) {
		System.out.println("비동기con");
		
		//서비스딴에서 위에서 얻어온것들 다 jsonList안에 넣어준다. ㄷㅅㄷ
		String list = ps.syncGetData(paramDto,session);

		
		return list;
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
			ModelAndView mv, ProjectParamDTO paramDto, HttpSession session) {
		String path = "project/project_content/story";
		
		
		//프로젝트 전체 값을 준다음에, 상세보기 페이지에서 받는다.
		//근데 이거...프리런칭인지/아닌지 구분해줘야 됨 =>이거 뷰에서 해버려


		ProjectInfoDTO prjDto=ps.getAProjectDetail(project_id); //프로젝트 상세정보
		MemberDTO memberDto = ps.getAMemberDetail(prjDto.getMember_email()); //프로젝트 발행 멤버
		

		mv.addObject("likeOrAlarmList",ps.likeOrAlarmProjectList(session,paramDto));
		mv.addObject("alarmMemberCnt", ps.getAlarmMemCount(project_id)); //알림 몇명 신청?
		mv.addObject("dDayInfo", ps.getADDay(project_id) ); //며칠 남았는지 
		mv.addObject("donatedMemberCnt", ps.getDonatedMemCount(project_id)); //후원자 몇명인지
		mv.addObject("memberInfo", memberDto); //프젝 진행하는 멤버의 정보(프로필정보)
		mv.addObject("projectInfo", prjDto); //프젝 상세정보
		mv.addObject("projectGift", ps.getAProjectGift(project_id));//프젝 기프트 목록 가져오기
		//이런 프로젝트 어떠세요. prj와 같은 태그의 4개 뽑기...
		mv.addObject("morePrjList", ps.getMoreProject(project_id, session));
		
		
		
		mv.setViewName(path);

		
		
		return mv;
	}
	
	@GetMapping(value = "/{project_id}/community")
	public ModelAndView getAProjectLive(@PathVariable int project_id, ModelAndView mv, HttpSession session, ProjectParamDTO paramDto) {
		

		ProjectInfoDTO prjDto=ps.getAProjectDetail(project_id); //프로젝트 상세정보
		MemberDTO memberDto = ps.getAMemberDetail(prjDto.getMember_email()); //프로젝트 발행 멤버
		

		mv.addObject("likeOrAlarmList",ps.likeOrAlarmProjectList(session, paramDto));
		mv.addObject("alarmMemberCnt", ps.getAlarmMemCount(project_id)); //알림 몇명 신청?
		mv.addObject("dDayInfo", ps.getADDay(project_id) ); //며칠 남았는지 
		mv.addObject("donatedMemberCnt", ps.getDonatedMemCount(project_id)); //후원자 몇명인지
		mv.addObject("memberInfo", memberDto); //프젝 진행하는 멤버의 정보(프로필정보)
		mv.addObject("projectInfo", prjDto); //프젝 상세정보
		mv.addObject("projectGift", ps.getAProjectGift(project_id));//프젝 기프트 목록 가져오기
		//이런 프로젝트 어떠세요. prj와 같은 태그의 4개 뽑기...
		mv.addObject("morePrjList", ps.getMoreProject(project_id, session));
		
		

		//해당 프젝 라이브 꺼내와야함.
		mv.setViewName("project/project_content/community");
		return mv;
	}
	
	
	
	@GetMapping(value = "/{project_id}/notice")
	public ModelAndView getAProjectNotice(@PathVariable int project_id, HttpSession session, ModelAndView mv, ProjectParamDTO paramDto) {
		ProjectInfoDTO prjDto=ps.getAProjectDetail(project_id); //프로젝트 상세정보
		MemberDTO memberDto = ps.getAMemberDetail(prjDto.getMember_email()); //프로젝트 발행 멤버
		

		mv.addObject("likeOrAlarmList",ps.likeOrAlarmProjectList(session, paramDto));
		mv.addObject("alarmMemberCnt", ps.getAlarmMemCount(project_id)); //알림 몇명 신청?
		mv.addObject("dDayInfo", ps.getADDay(project_id) ); //며칠 남았는지 
		mv.addObject("donatedMemberCnt", ps.getDonatedMemCount(project_id)); //후원자 몇명인지
		mv.addObject("memberInfo", memberDto); //프젝 진행하는 멤버의 정보(프로필정보)
		mv.addObject("projectInfo", prjDto); //프젝 상세정보
		mv.addObject("projectGift", ps.getAProjectGift(project_id));//프젝 기프트 목록 가져오기
		//이런 프로젝트 어떠세요. prj와 같은 태그의 4개 뽑기...
		mv.addObject("morePrjList", ps.getMoreProject(project_id, session));
		
		
		//그냥 펀딩 주의사항이요
		mv.setViewName("project/project_content/notice");
		return mv;
	}
	

	@GetMapping(value="header")
	public ModelAndView header(ModelAndView mv) {
		mv.setViewName("default/project/project_list_header");
		
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
		for(int i=1;i<80;i++) {
			dao.updateProject1(i);
		}
	}
	
	@RequestMapping("/update2")
	public void update2() {
		for(int i=103;i<160;i++) {
			dao.updateProject2(i);
		}
	}
	
	@RequestMapping("/update3")
	public void update3() {
		for(int i=160;i<225;i++) {
			dao.updateProject3(i);
		}
	}

}
