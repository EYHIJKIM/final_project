package com.hothiz.fund.project.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.ui.Model;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.project.dto.ProjectGiftDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;

public interface ProjectUploadService {
   public void editProject(ProjectInfoDTO dto);
   public int editId();
   public void insert_title(ProjectInfoDTO dto);
   public void insert_summary(ProjectInfoDTO dto);
   public void insert_tag(ProjectInfoDTO dto);
   public void insert_category(ProjectInfoDTO dto);
   public void insert_price(ProjectInfoDTO dto);
   public void insert_release_date(ProjectInfoDTO dto);
   public void insert_deadline(ProjectInfoDTO dto);
   public void insert_image(ProjectInfoDTO dto);
   public String get_image_name(ProjectInfoDTO dto);
   public String getTitle(ProjectInfoDTO dto);
   public ProjectInfoDTO get_deadline(ProjectInfoDTO dto);
   public ProjectInfoDTO get_release_date(ProjectInfoDTO dto);
   public ProjectInfoDTO get_price(ProjectInfoDTO dto);
   public void insert_video(ProjectInfoDTO dto);
   public String get_video(ProjectInfoDTO dto);
   public void insert_story(ProjectInfoDTO dto);
   public void insert_prelaunching(ProjectInfoDTO dto);
   public int get_project_check(ProjectInfoDTO dto);
   public void set_check_num(ProjectInfoDTO dto);
   public String get_story(ProjectInfoDTO dto);
   public ProjectInfoDTO getImage(ProjectInfoDTO dto);
   
   public void insert_gift_list(ProjectGiftDTO dto);
   public ArrayList<ProjectGiftDTO> get_gift(ProjectGiftDTO dto);
   public void gift_delete(ProjectGiftDTO dto);
   
   public String get_member_name(MemberDTO dto);
   
   public String get_summary(ProjectInfoDTO dto);
   public String get_category(ProjectInfoDTO dto);
   public String get_tag(ProjectInfoDTO dto);
   public String get_email(ProjectInfoDTO dto);
}