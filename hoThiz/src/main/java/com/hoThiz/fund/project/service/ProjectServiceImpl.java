package com.hothiz.fund.project.service;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Locale.Category;

import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.annotations.Select;
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
import com.hothiz.fund.project.dto.ProjectStateDTO;
import com.hothiz.fund.project.dto.ProjectDateDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	ProjectDAO dao;


	
	//동기식 게시글 정보 가져오기(첫 화면)
	@Override
	public ArrayList<ProjectInfoDTO> firstProjectView(ProjectParamDTO paramDto) {
		
		/*
		 검색 후 헤더의 카테고리 클릭 -> query + category가 파라미터로 보내짐. 
		 오른쪽의 sort 누르면 +됨. default는 popular
		 
		 if(쿼리가 존재하면){
		     쿼리 + 파라미터값 -> 출력
		 }
		 
		 else{//쿼리가 없으면
		   그냥 파라미터로만 검색.
		 }
		 
		 ==>이거 그냥 sql문을 합쳐야 할듯..
		 
		  */
		
		
		System.out.println("첫화면 가지러 옴");
		
		
		// 페이지 셋팅(db에 넘겨줄 start,end 값)
		ProjectPagingDTO pageDto = new ProjectPagingDTO(paramDto.getPage());

		// select값 넣는 list
		ArrayList<ProjectInfoDTO> projectList = null;
		
		/*
		//어떤걸 기준으로 뽑아낼건지 sort
		String sort = paramDto.getSort();			 	//4가지 경우의 수.. order by로 정렬 순서 정하면됨
		String category = paramDto.getCategory(); 		//이건 걍 where로 뽑으면 되고..
		String ongoing = paramDto.getOngoing(); 		//3가지 경우의 수...서브쿼리로 뽑아야함
		String query = paramDto.getQuery();	    		//쿼리문도 where로 넣어주면 되고..
		int achieveRate = paramDto.getAchieveRate();    //3가지 경우수
		int currentMoney = paramDto.getCurrentMoney();  //5가지 경우수
		
	
			if(ongoing==null || ongoing.equals("")) {ongoing="none";}
			if(category==null || category.equals("")) { category="none";}
			if(query==null || query.equals("")) {query="none";}
			if(sort==null || sort.equals("")) {sort="none";}
		
		
		

		if(!query.equals("none") && !category.equals("none") 
				&& !sort.equals("none") && !ongoing.equals("none")) { //쿼리,소트,카테고리,온고윙
			projectList = dao.allCondition(paramDto,pageDto);
			
			 

			//3개
		} else if(!query.equals("none") && !category.equals("none")&& !sort.equals("none")) {//쿼리,소트,카테고리
			
			
		} else if(!query.equals("none") && !sort.equals("none") && !ongoing.equals("none")) {//쿼리 소트 온고윙
			
			
		} else if(!query.equals("none") && !category.equals("none") && !ongoing.equals("none")) {//쿼리 카테고리 온고윙
			
		
			
			//2개
		} else if(!query.equals("none") && !sort.equals("none")) {//쿼리, 소트
			
		} else if(!query.equals("none") && !category.equals("none") ) {//쿼리, 카테고리
			
			
		}else if(!query.equals("none")&& !ongoing.equals("none")) {//쿼리, 온고윙
			
			
		} else if(!category.equals("none") && !sort.equals("none")) { //소트, 카테고리
			
			
		}else if(!sort.equals("none") && !ongoing.equals("none")) {//소트, 온고윙
			
			
		}else if(!category.equals("none")&& !ongoing.equals("none")) {//카테고리,온고윙
			
			
		}else if(!query.equals("none")) {//쿼리
			
			
		} else if(!category.equals("none")) {//카테고리
			projectList = dao.getCategoryProjectList(pageDto, category);
			
		}else if(!ongoing.equals("none")) {//온고윙
			
			
			
			
			
		if(!sort.equals("none")) {//소트
			
			projectList = dao.getQueryProjectList(pageDto, paramDto);

		} else { //쿼리가 없는 경우 걍 평소대로 분류
			
			if (!category.equals("none")) { // 카테고리 분류인 경우
				projectList = dao.getCategoryProjectList(pageDto, category);
	
			} else if(!ongoing.equals("none")) { //태그분류의 경우
				
				if(ongoing.equals("prelaunching")) { //프리런칭이면
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
		} //쿼리 if문
		*/	
		return projectList;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//비동기식 게시글 가져오기(스크롤)
	@Override
	public String getProjectList(ProjectParamDTO paramDto) {

		// 맵에 프로퍼티 값을 넣어주는 메소드
		// Map<String, Object> paramMap = BeanUtils.describe(paramDto);

		// 페이지 셋팅
		ProjectPagingDTO pageDto = new ProjectPagingDTO(paramDto.getPage());

		// select값 넣는 list
		ArrayList<ProjectInfoDTO> projectList = null;
		
		
		/*
		// 파람에 따라 프로젝트 로직 조절
		String sort = paramDto.getSort();
		
		// 카테고리 분류인 경우
		String category = paramDto.getCategory();
		String ongoing = paramDto.getOngoing();
		String query = paramDto.getQuery();
		
		
		 상위 5분류 -> ongoing을 가짐 즉 category는 "" 이 됨. 
		  
		 
		 
		
		//파라미터 값이 없다면 none을 넣어줌.
		if(ongoing==null || ongoing.equals("")) {ongoing="none";}
		if(category==null || category.equals("")) { category="none";}
		if(query==null || query.equals("")) {query="none";}
		if(sort==null || sort.equals("")) {sort="none";}

		
		if(!query.equals("none")) {//쿼리 존재하는 경우
			System.out.println("쿼리"+query);
			System.out.println("카테고리"+category);
			System.out.println("상태:"+ongoing);
			System.out.println("분류:"+sort);
			projectList = dao.getConditionList(pageDto, paramDto);
			
			
		} else { //안존재
			if (!category.equals("none")) {//카테고리 파라미터 존재하는 경우(카테고리 분류인경우)
				System.out.println("카테고리 가져오기");
	
				projectList = dao.getCategoryProjectList(pageDto, category);
	
				
			//태그분류인 경우
			} else if (!ongoing.equals("none")) {
	
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
							
				
				} else if(ongoing.equals("prelaunching")) {
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

		}
		 */
		return jsonMapper(projectList);

	}





	
	
	//해당 게시글의 좋아요 유무 확인을 위한 리스트
		@Override
		public ArrayList<Integer> likeOrAlarmProjectList(HttpSession session, ProjectParamDTO paramDto) {
			//이거 맵에 해도 될거같긴 한데,,,
			System.out.println("좋아요 or 찜한 목록 가지러 옴");
			String chkParam = paramDto.getOngoing();	
			String userId = (String)session.getAttribute("userId");
			ArrayList<Integer> list = null;
			
			if(chkParam==null) {chkParam = "ongoing";}
			
			if(chkParam.equals("prelaunching")) { //진행중 펀딩
				/////////////여기 파라미터 고쳐////userId로//////////////////////////////////
				System.out.println("공개예정 찜목록");
				list = dao.getAlarmProjectList("1");
				
			} else {
				System.out.println("좋아요 목록");
				list = dao.getLikeProjectList("1");
			}

			
			return list;
		}
		
		
		
		//멤버 정보 리스트(게시글 리스트에서 닉네임 뽑아내야됨)
		//멤버 뽑아서..map으로 넣을까 싶다... key는 프젝아디로...그럼 jsp서 걍 뽑아낼수 있잖아...
		//이거 오버플로 터짐
		/*
			@Override
			public Map<Integer, MemberDTO> getPrjMemberInfoMap() {		
				ArrayList<MemberDTO> list =  dao.getMemberInfoList();
				ArrayList<ProjectInfoDTO> prjList = dao.getAllProjectList();
				Map<Integer, MemberDTO> map = new HashMap<>();
				//project_info의 member_email과 일치하면 -> pj_id : mebmerDTO 일케 묶기
				for (ProjectInfoDTO dto : prjList) {
					for(MemberDTO mDto : list) {
						if(dto.getMember_email().equals(mDto.getMember_email())) {
							map.put(dto.getProject_id(), mDto);
						}
					}
				}	
				return map;
				
			}
			*/
			
			
		//남은날짜 리스트
			@Override
			public Map<Integer, ProjectDateDTO> getDDayMap(){ 
				Map<Integer, ProjectDateDTO> map = new HashMap<>();
				ArrayList<ProjectDateDTO> list = dao.getDDayList();
				
				for(ProjectDateDTO dto : list) {
					map.put(dto.getProject_id(), dto);
				}
				
				return map;
			}
			
		
		///////////////////////////////////////////////////////////////////////////



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
	
	@Override
	public ArrayList<MemberDTO> getMemberInfoList() {
		return dao.getMemberInfoList();
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
	
	//////////////////////게시물이 공개예정인지 아닌지 체크함
	




	/////////////////////메인에 있는거 ////////////////////////////////
	@Override
	public void getMainProjectList(Model model) {
		/*
		ProjectPagingDTO pageDto = new ProjectPagingDTO(0);
		
		System.out.println(dao.getPopularProjectList(pageDto));
		System.out.println(dao.getEndedAtProjectList(pageDto, 80, 99));
		System.out.println(dao.getPrelanchingProjectList(pageDto));
		System.out.println(dao.getProjectList(pageDto));
		
		
		model.addAttribute("popularList", dao.getPopularProjectList(pageDto));
		model.addAttribute("endedAtList",dao.getEndedAtProjectList(pageDto, 80, 99));
		model.addAttribute("prelanchingList", dao.getPrelanchingProjectList(pageDto));
		model.addAttribute("publishedList", dao.getProjectList(pageDto));
		*/
		
	}


	////////////////////////////////////////////////////////////////////


	

	
	
	////////////////////////////게시글 상세보기 필요 객체들///////////////////////////
	
	//게시글 상세정보
	@Override
	public ProjectInfoDTO getAProjectDetail(int project_id) {
		return dao.getAProject(project_id);
		
	}
	//한 멤버 디테일(프로필 정보)
	@Override
	public MemberDTO getAMemberDetail(String member_email) {
		return dao.getAMemberInfo(member_email);
	}

	//후원자 몇명인지 세부내용에서 출력해야됨.
	@Override
	public int getDonatedMemCount(int project_id) {
		return dao.getDonatedMemberCnt(project_id);
	}

	
	
	
	//////////////////////프리런칭/////////////////////////
	
	//세부에서 필요한 날짜
	public ProjectDateDTO getADDay(int project_id) {
		return dao.getADDay(project_id);
	}
	
	//알람신청한 인원
	public int getAlarmMemCount(int project_id) {
		return dao.getAlarmMemCount(project_id);
	}
	
	
	//////////////////////////////////////////////////////


	













	@Override
	public ArrayList<ProjectInfoDTO> getParamProjectList(ProjectParamDTO paramDto) {
		ProjectPagingDTO pageDto = new ProjectPagingDTO(0);
		int currentMoney = paramDto.getCurrentMoney();
		int achieveRate = paramDto.getAchieveRate();
		String sort = paramDto.getSort();
		String onString = paramDto.getOngoing();
		paramDto.setting();

		
		
		
		System.out.println("파람 가지러왔다");
		System.out.println("어치브비율값:"+paramDto.getAchieveRate());
		System.out.println("최저퍼센트"+paramDto.getMinAchieveRate());
		System.out.println("최대퍼센트"+paramDto.getMaxAchieveRate());
		System.out.println(paramDto.getCategory());
		System.out.println("지금돈"+paramDto.getCurrentMoney());
		System.out.println("최대머니:"+paramDto.getMaxMoney());
		System.out.println("최저머니:"+paramDto.getMinMoney());

		System.out.println(paramDto.getOngoing());
		System.out.println(paramDto.getSort());
		
		// 페이지 셋팅(db에 넘겨줄 start,end 값)
		
		// select값 넣는 list
		ArrayList<ProjectInfoDTO> projectList = dao.getParamProjectList(paramDto, pageDto);
		
		
		System.out.println(dao.countProjectList(paramDto));
		
		
		return projectList;
	}












	@Override
	public String syncGetData(ProjectParamDTO paramDto, HttpSession session) {
		

		System.out.println("비동기로 가지러옴");
		System.out.println("페이지:"+paramDto.getPage());
		// 페이지 셋팅
		ProjectPagingDTO pageDto = new ProjectPagingDTO(paramDto.getPage());
		
		paramDto.setting();

		System.out.println(paramDto.getAchieveRate());
		System.out.println("최저퍼센트"+paramDto.getMinAchieveRate());
		System.out.println("최대퍼센트"+paramDto.getMaxAchieveRate());
		System.out.println(paramDto.getCategory());
		System.out.println(paramDto.getCurrentMoney());
		System.out.println("최대머니:"+paramDto.getMaxMoney());
		System.out.println("최저머니:"+paramDto.getMaxMoney());

		System.out.println(paramDto.getOngoing());
		System.out.println(paramDto.getSort());
		//day에 대한 정보 가져오는 맵
		Map<Integer, ProjectDateDTO> dDayMap = getDDayMap();
		
		//멤버 정보들.
		ArrayList<MemberDTO> memberList = dao.getMemberInfoList();
		
		//좋아하는 게시글, 알람신청하는 게시글.
		ArrayList<Integer> likeOrAlarmList = likeOrAlarmProjectList(session, paramDto);
		
		//게시글 목록..
		ArrayList<ProjectInfoDTO> prjList = dao.getParamProjectList(paramDto, pageDto);
		//map..뽑아낼수있게 키값을 넣어줄거임..
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("day", dDayMap);
		map.put("member", memberList);
		map.put("prj", prjList);
		map.put("likeOrAlarm", likeOrAlarmList);
		
		System.out.println(map.get("day"));
		
		
		return jsonMapper(map);
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
