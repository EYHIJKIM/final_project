package com.hothiz.fund.admin.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hothiz.fund.admin.dto.AdminDTO;
import com.hothiz.fund.board.dto.Member_qnaDTO;
import com.hothiz.fund.member.dto.Member_messageDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;

@Repository
public interface AdminDAO {
	
	@Select("select B.* from(select rownum rn, A.* from"
			+"(select * from admin_notice order by notice_board_id desc)A)B where rn between #{s} and #{e}")
	public ArrayList<AdminDTO> selectNoticeList(@Param("s") int start, @Param("e") int end);
	
	@Select("select count(*) from admin_notice")
	public int selectNoticeAllCount();
	
@Insert("insert into admin_notice(notice_board_id, notice_board_title, notice_board_content)"
			+"values(admin_notice_seq.nextval, #{notice_board_title}, #{notice_board_content})")
public void notice_save(AdminDTO dto);
	
//@Select("select * from member_qna where member_email = #{id}")
//public ArrayList<Member_qnaDTO> idSelect(String id);

//@Select("select B.* from(select rownum rn, A.* from"
//		+"(select * from member_qna where member_email = #{id} order by qna_board_id desc)A)B where rn between #{s} and #{e}")
//public ArrayList<Member_qnaDTO> idSelect(@Param("id") String id, @Param("s") int start, @Param("e") int end);


// 승인대기목록전체불러오는거
@Select("select * from project_info where project_check = 1")
public ArrayList<ProjectInfoDTO> project_check();


//승인대기목록중 특정프로젝트 세부정보보기
@Select("select * from project_info where project_id = #{a}")
public ProjectInfoDTO check_detail(@Param("a") int id);

//승인상태로만들어서 게시완료되게함
@Update("update project_info set project_check = 2 where project_id =#{a} ")
public void agree(@Param("a") int id);

//승인거부해서 0으로되돌려서 작성중상태로 되돌림
@Update("update project_info set project_check = 0 where project_id =#{a} ")
public void disagree(@Param("a") int id);

@Insert("insert into message values('admin@hoThiz.com',message_seq.nextval,"
		+ "'프로젝트승인','프로젝트가 거부되었습니다. 수정해주세요','admin@hoThiz.com',#{a},to_date(sysdate,'yyyy.mm.dd hh24:mi'))")
public void disagreeMessage(@Param("a") String email);





@Insert("insert into message values('admin@hoThiz.com',message_seq.nextval,"
		+ "'프로젝트승인','프로젝트가 승인되었습니다.','admin@hoThiz.com',#{a},to_date(sysdate,'yyyy.mm.dd hh24:mi'))")
public void agreeMessage(@Param("a") String email);

//공지사항에서 제목 검색 후 상세정보보기
@Select("select * from admin_notice where notice_board_id = #{id}")
public AdminDTO notice_detail(@Param("id") int id);


}
