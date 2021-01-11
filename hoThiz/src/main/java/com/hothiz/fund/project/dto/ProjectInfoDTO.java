package com.hothiz.fund.project.dto;

import java.sql.Date;

public class ProjectInfoDTO {

   private int project_id;
   private String member_email;
   private String project_title;
   private String project_main_image;
   private String project_summary;
   private String project_tag;
   private int project_target_price;
   private Date project_reg_date;
   private Date project_release_date;
   private Date project_total_days;
   private Date project_deadline;
   private int project_like;
   private int project_current_donated;
   private int project_current_percent;
   private String project_main_category;
   private String project_sub_category;
   private int project_check;//펀딩에 성공?실패?
   private int project_prelaunching_check;//0이면 ㄴㄴ 1이면 프리런치
   private String project_story;
   private String project_video;
   private String project_date_string; //펀딩 끝나는 날짜(게시글상세보기), 혹은 펀딩 release 날짜(스케줄러)
   private String member_name;
   private String category_trans;
   
   
   
   
   public String getCategory_trans() {
      return category_trans;
   }
   public void setCategory_trans(String category_trans) {
      this.category_trans = category_trans;
   }
   public String getMember_name() {
      return member_name;
   }
   public void setMember_name(String member_name) {
      this.member_name = member_name;
   }
   public String getProject_video() {
      return project_video;
   }
   public void setProject_video(String project_video) {
      this.project_video = project_video;
   }
   public String getProject_date_string() {
      return project_date_string;
   }
   public void setProject_date_string(String project_date_string) {
      this.project_date_string = project_date_string;
   }
   public String getProject_story() {
      return project_story;
   }
   public void setProject_story(String project_story) {
      this.project_story = project_story;
   }

   public int getProject_prelaunching_check() {
      return project_prelaunching_check;
   }
   public void setProject_prelaunching_check(int project_prelaunching_check) {
      this.project_prelaunching_check = project_prelaunching_check;
   }
   public int getProject_id() {
      return project_id;
   }
   public void setProject_id(int project_id) {
      this.project_id = project_id;
   }
   public int getProject_check() {
      return project_check;
   }
   public void setProject_check(int project_check) {
      this.project_check = project_check;
   }
   public String getMember_email() {
      return member_email;
   }
   public void setMember_email(String member_email) {
      this.member_email = member_email;
   }
   public String getProject_title() {
      return project_title;
   }
   public void setProject_title(String project_title) {
      this.project_title = project_title;
   }
   public String getProject_main_image() {
      return project_main_image;
   }
   public void setProject_main_image(String project_main_image) {
      this.project_main_image = project_main_image;
   }
   public String getProject_summary() {
      return project_summary;
   }
   public void setProject_summary(String project_summary) {
      this.project_summary = project_summary;
   }
   public String getProject_tag() {
      return project_tag;
   }
   public void setProject_tag(String project_tag) {
      this.project_tag = project_tag;
   }
   public int getProject_target_price() {
      return project_target_price;
   }
   public void setProject_target_price(int project_target_price) {
      this.project_target_price = project_target_price;
   }
   public Date getProject_reg_date() {
      return project_reg_date;
   }
   public void setProject_reg_date(Date project_reg_date) {
      this.project_reg_date = project_reg_date;
   }
   public Date getProject_release_date() {
      return project_release_date;
   }
   public void setProject_release_date(Date project_release_date) {
      this.project_release_date = project_release_date;
   }
   public Date getProject_total_days() {
      return project_total_days;
   }
   public void setProject_total_days(Date project_total_days) {
      this.project_total_days = project_total_days;
   }
   public Date getProject_deadline() {
      return project_deadline;
   }
   public void setProject_deadline(Date project_deadline) {
      this.project_deadline = project_deadline;
   }
   public int getProject_current_donated() {
      return project_current_donated;
   }
   public void setProject_current_donated(int project_current_donated) {
      this.project_current_donated = project_current_donated;
   }
   public int getProject_like() {
      return project_like;
   }
   public void setProject_like(int project_like) {
      this.project_like = project_like;
   }

   public int getProject_current_percent() {
      return project_current_percent;
   }
   public void setProject_current_percent(int project_current_percent) {
      this.project_current_percent = project_current_percent;
   }
   public String getProject_main_category() {
      return project_main_category;
   }
   public void setProject_main_category(String project_main_category) {
      this.project_main_category = project_main_category;
   }
   public String getProject_sub_category() {
      return project_sub_category;
   }
   public void setProject_sub_category(String project_sub_category) {
      this.project_sub_category = project_sub_category;
   }
   
   
}