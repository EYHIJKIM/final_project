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
		
		
		// 카테고리 분류인 경우
		if (paramDto.getCategory()!=null) {
			
			String category = paramDto.getCategory();
			projectList = dao.getCategoryProjectList(pageDto, category);

		} 
		
		// 태그분류인 경우
		else if(paramDto.getOngoing() != null) {
			
			if(sort.equals("popular")) {
				// 인기순, 좋아요 50개 이상
				
				projectList = dao.getPopularProjectList(pageDto);

			} else if(sort.equals("endedAt")) {
				//성공임박
				
				int maxAchieveRate = paramDto.getMaxAchieveRate();
				int minAchieveRate = paramDto.getMinAchieveRate();
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
	
		return null;
	}




	@Override
	public String chkLike(Member_likeDTO likeDto) {
		//likeDto에는 project_id와 member_email이 들어있음.
		
		boolean flag = false;
		String msg = "like"; //하트가 체크된 상태를 표시. 뷰단으로 리턴할 것.
		String member_email = likeDto.getMember_email();
		int project_id = likeDto.getProject_id();
		System.out.println("project_id");
		System.out.println("기존 라이크:"+dao.getAProject(project_id).getProject_like());
		
		
		//한 멤버의 좋아요 한 프로젝트 목록
		ArrayList<Integer> likePrjList = dao.chkMemberLike(member_email);
		
		//하나씩 빼서 확인함.
		for(int id : likePrjList) {
			if(id==project_id) { //넘겨받은 프로젝트id와 동일한 id가 테이블에 존재하면
				flag = true; //flag를 true로.
				break;	
			}
		}
		
		
		if(flag) { //이미 좋아요 했던 프로젝트인 경우
			//좋아요 취소 로직 실행.
			System.out.println("좋아요 취소할거임");
			dao.cancelLikeMember(likeDto); //좋아요 한 프젝 없앰
			dao.cancelLikeProject(project_id); //좋아요 -1
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
