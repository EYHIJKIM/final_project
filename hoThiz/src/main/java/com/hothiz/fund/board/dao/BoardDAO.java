package com.hothiz.fund.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hothiz.fund.board.dto.Member_qnaDTO;
import com.hothiz.fund.board.dto.Qna_ReplyDTO;

@Repository
public interface BoardDAO {
	
	@Insert("insert into member_qna(qna_board_id, qna_board_content, member_email, qna_board_title)" 
			+"values(member_qna_seq.nextval, #{qna_board_content}, #{member_email}, #{qna_board_title})")
	public void write_save(Member_qnaDTO dto);
	
	/*
	@Select("select * from member_qna")
	public ArrayList<Member_qnaDTO> question_list();
	*/
	
	@Select("select B.* from(select rownum rn, A.* from"
			+"(select * from member_qna order by qna_board_id desc)A)B where rn between #{s} and #{e}")
	public ArrayList<Member_qnaDTO> question_list(@Param("s") int start, @Param("e") int end);
	
	@Select("select * from member_qna where qna_board_id = #{qna_board_id}")
	public Member_qnaDTO question_View(int qna_board_id);
	
	@Update("update member_qna set qna_board_hit = qna_board_hit+1 where qna_board_id=#{qna_board_id}")
	public int upHit(int qna_board_id);
	
	@Update("update member_qna set qna_board_content = #{qna_board_content} where qna_board_id = #{qna_board_id}")
	public int modify(Member_qnaDTO dto);
	
	@Delete("delete from member_qna where qna_board_id = #{qna_board_id}")
	public int delete(int qna_board_id);
	
	@Insert("insert into question_reply(reply_id, reply_title, reply_content, qna_board_id)"
			+"values(#{reply_id}, #{reply_title}, #{reply_content}, #{qna_board_id})")
	public void questionReply(Qna_ReplyDTO dto);
	
	@Select("select * from question_reply where qna_board_id=#{qna_board_id} order by write_date desc")
	public ArrayList<Qna_ReplyDTO> getRepList(int qna_board_id);
	
	@Select("select count(*) from member_qna")
	public int selectBoardCount();
	
	@Insert("insert into question_reply(reply_id, reply_title, reply_content, qna_board_id)"
			+"values(#{id}, #{title}, #{content}, #{qna_board_id})")
	public int addReply(@Param("id") String id, @Param("title") String title,
			@Param("content") String content, @Param("qna_board_id") int qna_board_id );
	
//	@Insert("insert into question_reply(reply_id, reply_title, reply_content, qna_board_id)"
//			+"values(#{reply_id}, #{reply_title}, #{reply_content}, #{qna_board_id})")
//	public void addReply(Qna_ReplyDTO dto);
}
 