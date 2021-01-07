package com.hothiz.fund.member.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
   private String member_email;
   private String member_pwd;   
   private String member_name;
   private String member_phnum;
   private String member_addr;
   private String member_profile_pic;
   private MultipartFile uploadFile;
   private String member_URL;
   private int member_admin;
   private int member_email_verify;
   private int member_alarm_agree;
   private String member_introduce;
   
   
   
   public String getMember_introduce() {
	return member_introduce;
}
public void setMember_introduce(String member_introduce) {
	this.member_introduce = member_introduce;
}
public int getMember_alarm_agree() {
      return member_alarm_agree;
   }
   public void setMember_alarm_agree(int member_alarm_agree) {
      this.member_alarm_agree = member_alarm_agree;
   }
   public MultipartFile getUploadFile() {
      return uploadFile;
   }
   public void setUploadFile(MultipartFile uploadFile) {
      this.uploadFile = uploadFile;
   }
   public String getMember_email() {
      return member_email;
   }
   public void setMember_email(String member_email) {
      this.member_email = member_email;
   }
   public String getMember_pwd() {
      return member_pwd;
   }
   public void setMember_pwd(String member_pwd) {
      this.member_pwd = member_pwd;
   }
   public String getMember_name() {
      return member_name;
   }
   public void setMember_name(String member_name) {
      this.member_name = member_name;
   }
   public String getMember_phnum() {
      return member_phnum;
   }
   public void setMember_phnum(String member_phnum) {
      this.member_phnum = member_phnum;
   }
   public String getMember_addr() {
      return member_addr;
   }
   public void setMember_addr(String member_addr) {
      this.member_addr = member_addr;
   }
   public String getMember_profile_pic() {
      return member_profile_pic;
   }
   public void setMember_profile_pic(String member_profile_pic) {
	   
	   try 
       {
		   this.member_profile_pic = URLEncoder.encode(member_profile_pic,"utf-8");
       } 
       catch (UnsupportedEncodingException e) 
       {
           e.printStackTrace();
       }


      this.member_profile_pic = member_profile_pic;
   }
   public String getMember_URL() {
      return member_URL;
   }
   public void setMember_URL(String member_URL) {
      this.member_URL = member_URL;
   }
   public int getMember_admin() {
      return member_admin;
   }
   public void setMember_admin(int member_admin) {
      this.member_admin = member_admin;
   }
   public int getMember_email_verify() {
      return member_email_verify;
   }
   public void setMember_email_verify(int member_email_verify) {
      this.member_email_verify = member_email_verify;
   }
}