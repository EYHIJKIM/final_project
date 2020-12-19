package com.hothiz.fund.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_alarmDTO;
import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectParamDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	ProjectDAO dao;

	
	
	
	@Override
	public ArrayList<ProjectInfoDTO> firstProjectView(ProjectParamDTO paramDto) {
		// 페이지 셋팅(db에 넘겨줄 start,end 값)
		ProjectPagingDTO pageDto = new ProjectPagingDTO(paramDto.getPage());

		// select값 넣는 list
		ArrayList<ProjectInfoDTO> projectList = null;
		
		//어떤걸 기준으로 뽑아낼건지 sort
		String sort = paramDto.getSort();
		String category = paramDto.getCategory();
		String onGoing = paramDto.getOngoing();
		
		
		
		if(category==null || category.equals("")) { category="none";}
		if(onGoing==null || onGoing.equals("")) {onGoing="none";}

		
		if (!category.equals("none")) { // 카테고리 분류인 경우
			projectList = dao.getCategoryProjectList(pageDto, category);

		} else if(!onGoing.equals("none")) { //태그분류의 경우
			
			if(onGoing.equals("prelanching")) { //프리런칭이면
				System.out.println("공개예정");
				projectList = dao.getPrelanchingProjectList(pageDto);
				
			} else {
			
			
				if(sort.equals("popular")) {
					// 인기순, 좋아요 50개 이상
					projectList = dao.getPopularProjectList(pageDto);
				} else if(sort.equals("endedAt")) {
					
					//성공임박		
					int maxAchieveRate = paramDto.getMaxAchieveRate();
					int minAchieveRate = paramDto.getMinAchieveRate();
					projectList = dao.getEndedAtProjectList(pageDto, maxAchieveRate, minAchieveRate);
					
				} else if(sort.equals("publishedAt")) {
					//신규추천
					System.out.println("신규추천");
					projectList = dao.getNewProjectList(pageDto);
					
				}
			}

		} else { // 모든 프로젝트
			System.out.println("모든 프로젝트 가져오기(파라미터 없다이거임)");
			projectList = dao.getProjectList(pageDto);
		}

		return projectList;
	}
	
	
	
	
	@Override
	public String getProjectList(ProjectParamDTO paramDto) {

		// 맵에 프로퍼티 값을 넣어주는 메소드
		// Map<String, Object> paramMap = BeanUtils.describe(paramDto);

		// 페이지 셋팅
		ProjectPagingDTO pageDto = new ProjectPagingDTO(paramDto.getPage());

		// select값 넣는 list
		ArrayList<ProjectInfoDTO> projectList = null;
		
		

		// 파람에 따라 프로젝트 로직 조절
		String sort = paramDto.getSort();
		
		// 카테고리 분류인 경우
		String category = paramDto.getCategory();
		String onGoing = paramDto.getOngoing();
		
		
		/*
		 상위 5분류 -> ongoing을 가짐 즉 category는 "" 이 됨. 
		  
		 
		 */
		
		//파라미터 값이 없다면 none을 넣어줌.
		if(category==null || category.equals("")) { category="none";}
		if(onGoing==null || onGoing.equals("")) {onGoing="none";}

		//카테고리 파라미터 존재하는 경우(카테고리 분류인경우)
		if (!category.equals("none")) {
			System.out.println("카테고리 가져오기");

			projectList = dao.getCategoryProjectList(pageDto, category);

			
		//태그분류인 경우
		} else if (!onGoing.equals("none")) {

			if(sort.equals("popular")) {
				// 인기순, 좋아요 50개 이상
				System.out.println("인기순");
				projectList = dao.getPopularProjectList(pageDto);

			} else if(sort.equals("endedAt")) {
				//성공임박
				System.out.println("성공임박");
				int maxAchieveRate = paramDto.getMaxAchieveRate();
				int minAchieveRate = paramDto.getMinAchieveRate();
				System.out.println("max"+maxAchieveRate);
				System.out.println("min"+minAchieveRate);
				projectList = dao.getEndedAtProjectList(pageDto, maxAchieveRate, minAchieveRate);
						
			
			} else if(sort.equals("prelanching")) {
				//추천공개예정
				System.out.println("공개예정");
				projectList = dao.getPrelanchingProjectList(pageDto);
				
			} else if(sort.equals("publishedAt")) {
				//신규추천
				System.out.println("신규추천");
				projectList = dao.getNewProjectList(pageDto);
				
			}

		} else { // 모든 프로젝트(파라미터 없는 경우)
			System.out.println("모든 프로젝트 가져오기");
			projectList = dao.getProjectList(pageDto);
		}

		

		return jsonMapper(projectList);

	}




	@Override
	public ProjectInfoDTO getAProjectDetail(int project_id) {
	
		ProjectInfoDTO dto = dao.getAProject(project_id);
		
		return dto;
		
	}



	//좋아요 처리하는 메소드======================================
	@Override
	public String chkLike(Member_likeDTO likeDto) {
		//likeDto에는 project_id와 member_email이 들어있음.
		
		String msg = "like"; //하트가 체크된 상태를 표시. 뷰단으로 리턴할 것.
		String member_email = likeDto.getMember_email();
		int project_id = likeDto.getProject_id();

		System.out.println("기존 라이크:"+dao.getAProject(project_id).getProject_like());
		
		
		//한 멤버의 좋아요 한 프로젝트 목록. 해당 프젝을 이미 좋아요한 경우 1 반환 아니면 0
		int chk = dao.chkMemberLike(likeDto);
		
		
		
		if(chk==1) { //이미 좋아요 했던 프로젝트인 경우
			//좋아요 취소 로직 실행.
			System.out.println("좋아요 취소할거임");
			dao.setCancelLikeMember(likeDto); //좋아요 한 프젝 없앰
			dao.setCancelLikeProject(project_id); //좋아요 -1
			msg = "cancelLike"; //취소했으니 캔슬라이크
			System.out.println("취소한 후 라이크:"+dao.getAProject(project_id).getProject_like());
			
			
		} else {//좋아요 안한 프로젝트인경우
			System.out.println("좋아요 하겠읍니다");
			//만약 좋아요를 첨 누른 회원이라면 member_like 테이블에 없을 것임.
			//그걸 판별해서 두개의 sql문을 사용해야 할듯..
			
			dao.setLikeMember(likeDto);
			dao.setLikeProject(project_id);
			System.out.println("좋아요한후 라이크:"+dao.getAProject(project_id).getProject_like());
		}	
		
		System.out.println(msg);
		
		
		return jsonMapper(msg);
		
	}
	
	
	
	//알림처리하는 매소드===========================
	public String chkAlarm(Member_alarmDTO alarmDto) {

		boolean flag = false;
		String msg = "alarm"; //알람신청한 상태
		String member_email = alarmDto.getMember_email();
		int project_id = alarmDto.getProject_id();		
		
		//한 멤버의 알림 프로젝트 목록
		int chk = dao.chkMemberAlarm(alarmDto);
		
		if(chk==1) { //이미 알림신청 프로젝트인 경우
			//좋아요 취소 로직 실행.
			System.out.println("알림 취소");
			dao.setCancelAlarm(alarmDto);
			msg = "cancelAlarm"; //취소했으니 캔슬라이크
			
			System.out.println("취소한 후(0이면 알림취소된거) : "+dao.chkMemberAlarm(alarmDto));
			
			
		} else {//좋아요 안한 프로젝트인경우
			System.out.println("알림 신청");
			dao.setAlarm(alarmDto);
			System.out.println("알림신청(1이면 알림된거) : "+dao.chkMemberAlarm(alarmDto));
		}	
		
		
		
		
		return jsonMapper(msg);
	}
	
	//게시글 리스트 뽑아낼때, 해당 게시글의 좋아요 유무 확인을 위한 리스트 뽑아냄
	@Override
	public ArrayList<Integer> likeOrAlarmProjectList(HttpSession session, ProjectParamDTO paramDto) {
		
		String chkParam = paramDto.getOngoing();	
		String userId = (String)session.getAttribute("userId");
		ArrayList<Integer> list = null;
		
		if(chkParam==null) {chkParam = "onGoing";}
		
		if(chkParam.equals("onGoing")) { //진행중 펀딩
			/////////////여기 파라미터 고쳐////userId로//////////////////////////////////
			list = dao.getLikeProjectList("1");
			
		} else { //공개예정 펀딩
			list = dao.getAlarmProjectList("1");
		}

		
		return list;
	}

	

	
	

	
	
	//JSON으로 파싱하는 메소드(비동기시 필수)====================================
	public String jsonMapper(Object obj) {
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;

		try {
			jsonStr = mapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			System.out.println("jsonMapper 메소드 오류");
			e.printStackTrace();
		}
		
		return jsonStr;	
	}




	





	

	

	
	
	
	
	/// 멤버넣기.. 나중에 지우삼****

	/*
	 * 
	 * public String testList(int locatedPage){
	 * 
	 * ProjectPagingDTO dto = new ProjectPagingDTO();
	 * dto.pagingSetting(locatedPage);
	 * 
	 * 
	 * ArrayList<TestDTO> list = dao.testList(dto);
	 * 
	 * 
	 * ObjectMapper mapper = new ObjectMapper(); String listJson = null;
	 * 
	 * 
	 * try { listJson = mapper.writeValueAsString(list); } catch
	 * (JsonProcessingException e) { System.out.println("testList 서비스 오류");
	 * e.printStackTrace(); }
	 * 
	 * 
	 * return listJson; }
	 * 
	 * 
	 * public TestDTO selectOne(int project_id) {
	 * 
	 * TestDTO dto = dao.selectOne(project_id);
	 * 
	 * return dto; }
	 * 
	 * 
	 */

}
