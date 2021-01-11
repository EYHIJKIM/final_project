package com.hothiz.fund.member.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_donateDTO;
import com.hothiz.fund.member.dto.Member_messageDTO;
import com.hothiz.fund.member.dto.Member_paymentDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;

@Repository
public interface MemberDAO {

	@Select("select * from member_info where member_email = #{id}")
	public MemberDTO setting(String id);
	
	@Update("update member_info set ${b} =#{a} where member_email =#{c}")
	public int updateSetting(@Param("a") String val,@Param("b") String col,@Param("c") String id);

	@Update("update member_info set member_email_verify = 1 where member_email= #{a}")
	public void verifyEmail(@Param("a") String email);

	@Select("select * from member_info where member_email=#{b} and member_pwd = #{a} ")
	public MemberDTO pwdCheck(@Param("a") String pwd , @Param("b") String id);

	@Update("update member_info set member_pwd = #{a} where member_email = #{b}")
	public void pwdChange(@Param("a") String pwd, @Param("b") String id);

	@Select("select * from project_info where project_id in(select project_id from member_like where member_email = #{id})")
	public List<ProjectInfoDTO> likeProject(String id);

	@Select("select * from project_info where member_email = #{id}")
	public List<ProjectInfoDTO> myProject(String id);

	@Update("update member_info set member_alarm_agree =${a} where member_email = #{b}")
	public void setAlarmAgree(@Param("a")int agree, @Param("b") String id);

	@Insert("insert into member_payment(project_id,member_email,imp_uid,merchant_uid,paid_amount,apply_num) "
			+ "values(#{project_id},#{member_email},#{imp_uid}, #{merchant_uid},#{paid_amount},#{apply_num} )")
	public void paymethod(Member_paymentDTO dto);
	
	@Insert("insert into member_donated_project values(#{member_email},#{project_id},#{paid_amount})")
	public void mydonatedInsert(Member_paymentDTO dto);
	
	@Update("update project_info set project_current_donated = project_current_donated +#{paid_amount} where project_id = #{project_id} ")
	public void projectDonatedUpdate(Member_paymentDTO dto);
	
	//수정필요
    @Update("update member_info set member_profile_pic = #{a} where member_email = #{b}")
    		public int saveProfile(@Param("a")String img, @Param("b")String email);

    //내가 좋아요한 프로젝트목록에서 삭제
	@Delete("delete from member_like where member_email = #{b} and project_id = #{a}")
	public void likeCancel(@Param("a")int pid,@Param("b")String id);
	
	// 프로젝트에서 좋아요 -1
	@Update("update project_info set project_like = project_like -1 where project_id = #{a} ")
	public void likeMinus(@Param("a")int pid);
	
	
	//회원
	   @Select("select * from member_info where member_email=#{member_email}")
	   public MemberDTO user_check(String member_email);
	   @Select("select * from member_info where member_url=#{url}")
	   public MemberDTO urlcheck(String url);
	   @Insert("insert into member_info"
		         + "(member_email,member_pwd,member_name,member_profile_pic,member_phnum,member_addr,member_URL,member_admin,member_email_verify,member_alarm_agree)"
		         + "values(#{member_email},#{member_pwd},#{member_name},#{member_profile_pic},#{member_phnum},#{member_addr},#{member_URL},0,0,0)")
	   public int register(MemberDTO member);
	   
	   @Update("update member_info set member_pwd=#{member_pwd} where member_email=#{member_email}")
	   public int new_password_commit(MemberDTO member);
	   @Select("select member_email from member_info where member_email=#{member_email}")
	   public String member_email_check(MemberDTO member);
	   @Select("select member_email from member_info where member_phnum=#{member_phnum}")
	   public String member_phnum_chk(MemberDTO member);
	   
	   
	   //메세지
	   @Select("select count(*) from message where message_send_member=#{member_email} or message_receive_member=#{member_email}")
	   public int selectBoardCount(Member_messageDTO member);
	   @Select("select count(*) from message where message_send_member=#{member_email}")
	   public int selectSendCount(Member_messageDTO member);
	   @Select("select count(*) from message where message_receive_member=#{member_email}")
	   public int selectReceiveCount(Member_messageDTO member);
	   @Select("select C.* from(select rownum rn, B.* from (select A.* from(select * from message where member_email=#{dto.member_email} or message_receive_member=#{dto.member_email})A "
	         + "order by message_date desc)B)C where rn between #{s} and #{e}")
	   public ArrayList<Member_messageDTO> message_all(@Param("dto") Member_messageDTO member,@Param("s") int start,@Param("e") int end);
	   @Select("select C.* from(select rownum rn, B.* from (select A.* from(select * from message where member_email=#{dto.member_email} and message_send_member=#{dto.member_email})A "
	         + "order by message_date desc)B)C where rn between #{s} and #{e}")
	   public ArrayList<Member_messageDTO> message_send(@Param("dto") Member_messageDTO member,@Param("s") int start,@Param("e") int end);
	   @Select("select C.* from(select rownum rn, B.* from (select A.* from(select * from message where message_receive_member=#{dto.member_email})A "
	         + "order by message_date desc)B)C where rn between #{s} and #{e}")
	   public ArrayList<Member_messageDTO> message_receive(@Param("dto") Member_messageDTO member,@Param("s") int start,@Param("e") int end);
	   @Select("select * from message where message_num=#{n}")
	   public ArrayList<Member_messageDTO> message_context(@Param("n") int message_num);
	   @Delete("delete message where message_num=#{d}")
	   public void boardDelete(@Param("d") int message_num);
	   @Update("update message set message_type=#{message_type}, message_content=#{message_content} where message_num = #{message_num}")
	   public void message_modify_update(Member_messageDTO message);
	   @Insert("insert into message values(#{member_email},message_seq.nextval,#{message_type},#{message_content},#{message_send_member},#{message_receive_member},to_date(sysdate,'yyyy.mm.dd hh24:mi'))")
	   public void message_reply(Member_messageDTO message);
	   @Select("select * from message where message_num=#{n}")
	   public Member_messageDTO boardReplyView(@Param("n") int message_num);
	   
	   //후원
	   @Select("select count(*) from member_donated_project where member_email=#{member_email}")
	   public int my_donate_cnt(Member_donateDTO donate);
//	   @Select("select * from project_info where member_email=#{member_email}")
	   @Select("select * from project_info where project_id in (select project_id from member_donated_project where member_email = #{member_email}) ")
	   public ArrayList<ProjectInfoDTO> donate_project(Member_donateDTO donate);
	   @Select("select * from member_donated_project where member_email=#{member_email}")
	   public ArrayList<Member_donateDTO> donate_price(Member_donateDTO donate);
	
	   @Select("select * from member_info where member_email = #{a}")
	   public MemberDTO searchUser(@Param("a") String member_email);
	   
	   
	   
	   @Select("select * from member_info where member_url = #{s}")
	   public MemberDTO member_info(@Param("s") String url);
	   
	   @Update("update project_info set project_current_percent = (PROJECT_CURRENT_DONATED /project_target_price ) *100 where project_id=#{project_id} " )
	   public void percentRefresh(Member_paymentDTO dto);
	
	      @Delete("delete project_info where project_id=#{id}")
	      public void project_delete(@Param("id") int project_id);
	   
}
