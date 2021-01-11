package com.hothiz.fund.member.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_messageDTO;
import com.hothiz.fund.member.dto.Member_paymentDTO;

public interface MemberService {
   public int user_check(HttpServletRequest request);
   public int register(MemberDTO member);
   public String sendEmail(String email);
   public String new_password_commit(String pwdCh, MemberDTO member);
   public void allMessage(HttpSession session, Model model, int num);
   public ArrayList<Member_messageDTO> message_send(HttpSession session, Model model, int num);
   public ArrayList<Member_messageDTO> message_receive(HttpSession session, Model model, int num);
   public ArrayList<Member_messageDTO> message_all(HttpSession session, Model model, int num);
   public void message_context(int message_num, Model model);
   public void boardDelete(int message_num);
   public void message_modify_update(Member_messageDTO dto);
   public void message_reply(Member_messageDTO dto);
   public void boardReplyView(int message_num, Model model);
   public void my_donate(Model model, HttpSession session);
   public String member_email_check(MemberDTO dto);
   public String member_phnum_chk(MemberDTO dto);
   public void setting(Model model, String id);   
   public int updateSetting(String val,String col, String id);
   //비밀번호변경요청시 현재비밀번호맞는지조회
   public int pwdCheck(String pwd, String id);
   //비밀번호변경요청
   public void pwdChange(String pwd, String id);   
   //좋아하는 프로젝트목록
   public void likeProject(Model model, String id);   
   // 내 프로젝트 목록
   public void myProject(Model model, String id);   
   //알람 수신/비동의처리
   public void setAlarmAgree(int agree, String id);   
   //결제사전정보넘김 model,money,pid,ptitle,id
   public void payInfo(Model model,int money,int pid,String title, String id);   
   //결제처리
   public void paymethod(Member_paymentDTO dto);   
   //이미지저장
   public String saveProfile(MultipartHttpServletRequest request) throws Exception;   
   //좋아요취소
   public void likeCancel(int pid, String id);
   
   public MemberDTO member_info( String url);
   
   
   public void searchUser(String email, Model model);
   
   public void project_delete(int project_id);
}