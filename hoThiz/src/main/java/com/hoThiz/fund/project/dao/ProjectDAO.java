package com.hothiz.fund.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_alarmDTO;
import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.project.dto.ProjectParamDTO;

import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;

@Repository
public interface ProjectDAO {
	
	
	///////////////////////게시글 하나 뽑아냄
	@Select("SELECT * FROM project_info WHERE project_id = #{project_id}")
	public ProjectInfoDTO getAProject(int project_id);
	
	
	///////////////////////////////게시글 목록 뽑아냄////////////////////////////////////////////////
	
	//1.모든 프로젝트
	@Select("SELECT B.*" + 
			" FROM (SELECT rownum rn, A.*" + 
					" FROM (select * from project_info order by project_id desc) A" + 
			") B" + 
			" WHERE rn between #{startRownum} and #{endRownum}")
	public ArrayList<ProjectInfoDTO> getProjectList(ProjectPagingDTO dto);

	
	
	

	
	//2. 인기순 뽑아내기 좋아요 50개 이상	
		@Select("SELECT B.*" + 
				" FROM (SELECT rownum rn, A.*" + 
						" FROM"
						+" (select * from project_info"
						+" WHERE project_like >= 50"
						+" ORDER BY project_id desc) A" + 
				") B " + 
				" WHERE rn BETWEEN #{startRownum} AND #{endRownum}")
		public ArrayList<ProjectInfoDTO> getPopularProjectList(ProjectPagingDTO dto);
		
		
		
	//3. 성공 임박 프로젝트 80~99퍼 사이
	@Select("SELECT B.*" + 
			" FROM (SELECT rownum rn, A.*" + 
					"FROM "
					+" (select * from project_info"
					+" WHERE (project_current_percent BETWEEN #{min} AND #{max})"
					+" ORDER BY project_id desc) A" + 
			") B " + 
			" WHERE rn BETWEEN #{dto.startRownum} AND #{dto.endRownum}")
	public ArrayList<ProjectInfoDTO> getEndedAtProjectList(@Param("dto") ProjectPagingDTO pageDto, @Param("max") int maxAchieveRate,
								@Param("min") int minAchieveRate);
   
	
	
	//4. 공개예정 프로젝트
	@Select("SELECT B.*" + 
			" FROM (SELECT rownum rn, A.*" + 
					"FROM "
					+" (select * from project_info"
					+" WHERE (project_reg_date < project_release_date)"
					+" ORDER BY project_id desc) A" + 
			") B " + 
			" WHERE rn BETWEEN #{startRownum} AND #{endRownum}")
	public ArrayList<ProjectInfoDTO> getPrelanchingProjectList(ProjectPagingDTO dto);
	
	
	//5. 신규추천
	@Select("SELECT B.*" + 
			" FROM (SELECT rownum rn, A.*" + 
					"FROM "
					+" (select * from project_info"
					+" WHERE project_release_date between("
					+ "to_date(sysdate, 'YYYYMMDD')-7 AND to_date(sysdate, 'YYYYMMDD'))"
					+" ORDER BY project_id desc) A" + 
			") B " + 
			" WHERE rn BETWEEN #{startRownum} AND #{endRownum}")
	public ArrayList<ProjectInfoDTO> getNewProjectList(ProjectPagingDTO dto);
	
	
	
	
	//6. 카테고리별 게시글
			@Select("SELECT B.*" + 
					" FROM (SELECT rownum rn, A.*" + 
							" FROM"
							+" (select * from project_info"
							+" WHERE (project_main_category=#{c} OR project_sub_category=#{c})"
							+" ORDER BY project_id desc) A" + 
					") B " + 
					" WHERE rn BETWEEN #{dto.startRownum} AND #{dto.endRownum}")
			public ArrayList<ProjectInfoDTO> getCategoryProjectList(
						@Param("dto") ProjectPagingDTO dto, @Param("c") String category);
			
			
			

	//7. 검색해서 게시글 뽑기
/*
   impl딴에서 null 혹은 "" 일 때 문자열 none을 넣었음.
   
   만약 쿼리가 없는경우는 -> 바로 sort로 가고
   쿼리가 있는 경우는 -> 아래 메소드로 온다. 쿼리가 먼저이므로..
   
   쿼리가 있는데 소트는 없음 -> case WHEN #{param.sort} = 'none' THEN
						소트 없이 처리
	소트가 있으면 -> ELSE
   
   
   
 */
			@Select(
					
					
					"SELECT B.*" + 
					" FROM (SELECT rownum rn, A.*" + 
							" FROM (SELECT * from project_info WHERE project_title LIKE CONCAT('%',#{param.keyword},'%')"
							+ " OR project_summary LIKE CONCAT('%',#{param.keyword},'%') A" + 
					") B" + 
					" WHERE rn between #{page.startRownum} and #{page.endRownum}")
			public ArrayList<ProjectInfoDTO> getSearchProjectList(@Param("page") ProjectPagingDTO pageDto, @Param("param") ProjectParamDTO paramDto);
					
	
	/////////////////////////////////////////////////////////////////////////////
			
			
			
	//테스트용으로 프젝에 값넣은거
	@Insert("insert into project_info" + 
			" value(project_id,member_email,project_title,project_summary,"
				+ "project_target_price,project_like,project_current_percent,"
				+ "project_main_category,project_sub_category)" + 
			" values(project_info_seq.nextval,#{member_email},#{project_title},#{project_summary},#{project_target_price},#{project_like},#{project_current_percent},#{project_main_category},#{project_sub_category})")
	public void setProjectInfo(ProjectInfoDTO dto);
	
	
	///////////////////////////////좋아요 로직
	
	
	
	//좋아요 누르면 게시판의 좋아요 올라감.
	@Update("UPDATE project_info SET project_like = project_like+1 WHERE project_id=#{project_id}")
	public void setLikeProject(int project_id);
	
	//좋아요 누르면 삽입.
	@Insert("INSERT INTO member_like value(project_id,member_email) values(#{project_id},#{member_email})")
	public void setLikeMember(Member_likeDTO likeDto);
	
	
	
	
	//게시판 좋아요를 취소하고
	@Update("UPDATE project_info SET project_like = project_like-1 WHERE project_id=#{project_id}")
	public void setCancelLikeProject(int project_id);
	
	//멤버 좋아요에서 삭제함
	@Update("DELETE FROM member_like where project_id=#{project_id} AND member_email=#{member_email}")
	public void setCancelLikeMember(Member_likeDTO likeDto);
	
	
	//멤버가 그 게시글을 좋아요 했는지 여부
	@Select("SELECT COUNT(*) FROM member_like where member_email =#{member_email} AND project_id=#{project_id}")
	public int chkMemberLike(Member_likeDTO likeDto);
	
	//해당 유저의 좋아요 프로젝트 리스트
	@Select("SELECT project_id from member_like where member_email = #{userId}")
	public ArrayList<Integer> getLikeProjectList(String userId);
	
	
	//////////////알림신청///////////////////
	
	//알림신청 했는지의 여부
	@Select("SELECT COUNT(*) FROM member_alarm where member_email=#{member_email} AND project_id=#{project_id}")
	public int chkMemberAlarm(Member_alarmDTO alarmDto);
		
	
	//버튼 누르면 알림신청
	@Insert("INSERT INTO member_alarm value(project_id,member_email) values(#{project_id},#{member_email})")
	public void setAlarm(Member_alarmDTO alarmDto);	
	
	
	//알림 취소
	@Delete("DELETE FROM member_alarm where project_id=#{project_id} AND member_email=#{member_email}")
	public void setCancelAlarm(Member_alarmDTO alarmDto);

	//해당 유저의 알림프젝 리스트
	@Select("SELECT project_id from member_alarm where member_email = #{userId}")
	public ArrayList<Integer> getAlarmProjectList(String userId);
	
	
	
	
	
	
//메인에서 10개씩 있는거..카테고리별로 where줘야 함.
	
	
	
	//=================멤버
	/*
	@Insert("insert into member_info"
	         + " value(member_email,member_pwd,member_name,member_profile_pic,member_phnum,member_addr,member_URL,member_admin,member_email_verify)"
	         + " values(#{member_email},#{member_pwd},#{member_name},0,#{member_phnum},#{member_addr},#{member_URL},0,0)")
	public void insertMember(MemberDTO dto);
	
*/

	


	


	


	


	
	
	

	
	
}
