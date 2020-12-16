package com.hothiz.fund.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.project.dto.ParamDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;

@Repository
public interface ProjectDAO {
	
	
	//모든 게시글을 가져옴
	@Select("select * from test order by project_id desc")
	public ArrayList<TestDTO> allList();
	
	
	//게시글 상세정보
	@Select("select * from test where project_id=#{project_id}")
	public TestDTO selectOne(Integer project_id);

	
	//test용 프로젝트 올리기
	@Insert("INSERT INTO test values(#{project_id},#{member_name},#{project_title},#{project_content})")
	public void insert(TestDTO dto);
	
	
	
	
	//30게시글 갯수(메뉴탭들)
	@Select("SELECT B.*" + 
			"FROM (SELECT rownum rn, A.*" + 
					"FROM (select * from test order by project_id desc) A" + 
			")B " + 
			"WHERE rn between #{startRownum} and #{endRownum}")
	public ArrayList<TestDTO> testList(ProjectPagingDTO dto);

	
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
	
	


	@Insert("insert into project_info" + 
			" value(project_id,member_email,project_title,project_summary,"
				+ "project_target_price,project_like,project_current_percent,"
				+ "project_main_category,project_sub_category)" + 
			" values(project_info_seq.nextval,#{member_email},#{project_title},#{project_summary},#{project_target_price},#{project_like},#{project_current_percent},#{project_main_category},#{project_sub_category})")
	public void setProjectInfo(ProjectInfoDTO dto);
	
	
	
	
	
	//만약 member_like에서 member_email을 확인해서 해당 id가 없다면
	//좋아요 누르면 게시판의 좋아요 올라감.
	@Update("UPDATE project_info SET project_like = project_like+1 WHERE project_id=#{project_id}")
	public void setLikeProject(int project_id);
	
	//그리고 멤버가 좋아하는 프젝에도 올라감.
	@Update("INSERT INTO member_like project_id = #{project_id} WHERE member_email = #{member_email}")
	public void setLikeMember(Member_likeDTO dto);
	
	
	
	
	//게시판 좋아요를 취소하고
	@Update("UPDATE project_info SET project_like = project_like-1 WHERE project_id=#{project_id}")
	public void cancelLikeProject(int project_id);
	
	//멤버 좋아요에서 삭제함
	@Update("DELETE FROM member_like where project_id=#{project}")
	public void cancelLikeMember(int project_id);
	
	
	//멤버가 그 게시글을 좋아요 했는지를 확인. 멤버의 ID를 보내서 확인해보자
	@Select("SELECT project_id FROM member_like where member_email =#{email}")
	public ArrayList<Integer> chkMemberLike(@Param("email") String member_email);
	
	
	
	
	
	/*
	 멤버가 좋아요를 취소하면 -> 프로젝트 테이블에서 like에서 -1을 함.
	 그리고 member_like 테이블에서 해당 project_id를 삭제함.
	 
	  멤버 아이디    프젝 아이디
	  1         3
	  			4
	 
	 */
	
	
	
	
	
	
	
	
	//=================멤버
	
	
	@Insert("insert into member_info"
	         + " value(member_email,member_pwd,member_name,member_profile_pic,member_phnum,member_addr,member_URL,member_admin,member_email_verify)"
	         + " values(#{member_email},#{member_pwd},#{member_name},0,#{member_phnum},#{member_addr},#{member_URL},0,0)")
	public void insertMember(MemberDTO dto);
	//메인에서 10개씩 있는거..카테고리별로 where줘야 함.


	


	


	
	
	

	
	
}
