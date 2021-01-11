package com.hothiz.fund.member.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Member_messageDTO {
   private String member_email;
   private int message_num;
   private String message_type;
   private String message_content;
   private String message_send_member;
   private String message_receive_member;
   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyy-MM-dd")
   private Date message_date;
   private int repeat;
   
   public int getRepeat() {
      return repeat;
   }
   public void setRepeat(int repeat) {
      this.repeat = repeat;
   }
   public int getMessage_num() {
      return message_num;
   }
   public void setMessage_num(int message_num) {
      this.message_num = message_num;
   }
   public Date getMessage_date() {
      return message_date;
   }
   public void setMessage_date(Date message_date) {
      this.message_date = message_date;
   }
   public String getMember_email() {
      return member_email;
   }
   public void setMember_email(String member_email) {
      this.member_email = member_email;
   }
   public String getMessage_type() {
      return message_type;
   }
   public void setMessage_type(String message_type) {
      this.message_type = message_type;
   }
   public String getMessage_content() {
      return message_content;
   }
   public void setMessage_content(String message_content) {
      this.message_content = message_content;
   }
   public String getMessage_send_member() {
      return message_send_member;
   }
   public void setMessage_send_member(String message_send_member) {
      this.message_send_member = message_send_member;
   }
   public String getMessage_receive_member() {
      return message_receive_member;
   }
   public void setMessage_receive_member(String message_receive_member) {
      this.message_receive_member = message_receive_member;
   }
}