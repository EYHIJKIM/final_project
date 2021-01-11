package com.hothiz.fund.project.dao;

import java.sql.Date;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.project.dto.ProjectGiftDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;

@Repository
public interface ProjectInfoDAO {
   @Insert("insert into project_info(project_id,project_check,member_email,member_name) values(project_info_seq.nextval,0,#{member_email},#{member_name})")
   public void editProject(ProjectInfoDTO dto);
   
   @Select("SELECT project_info_seq.nextval FROM DUAL")
   public int editId();
   
   @Select("select project_title from project_info where project_id=#{project_id}")
   public String getTitle(ProjectInfoDTO dto);
   
   @Update("update project_info set project_title=#{project_title} where project_id=#{project_id}")
   public void insert_title(ProjectInfoDTO dto);
   
   @Update("update project_info set project_summary=#{project_summary} where project_id=#{project_id}")
   public void insert_summary(ProjectInfoDTO dto);
   
   @Update("update project_info set project_tag=#{project_tag} where project_id=#{project_id}")
   public void insert_tag(ProjectInfoDTO dto);
   
   @Update("update project_info set project_main_category=#{project_main_category},project_sub_category=#{project_sub_category} where project_id=#{project_id}")
   public void insert_categrory(ProjectInfoDTO dto);
   
   @Update("update project_info set project_target_price=#{project_target_price} where project_id=#{project_id}")
   public void insert_price(ProjectInfoDTO dto);
   
   @Update("update project_info set project_release_date=#{project_release_date} where project_id=#{project_id}")
   public void insert_release_date(ProjectInfoDTO dto);
   
   
   @Update("update project_info set project_deadline=#{project_deadline} where project_id=#{project_id}")
   public void insert_deadline(ProjectInfoDTO dto);
   
   @Update("update project_info set project_main_image=#{project_main_image} where project_id=#{project_id}")
   public void insert_image(ProjectInfoDTO dto);
   
   @Select("select project_main_image from project_info where project_id=#{project_id}")
   public String get_image_name(ProjectInfoDTO dto);
   
   @Select("select project_deadline from project_info where project_id=#{project_id}")
   public ProjectInfoDTO get_deadline(ProjectInfoDTO dto);
   
   @Select("select project_release_date from project_info where project_id=#{project_id}")
   public ProjectInfoDTO get_release_date(ProjectInfoDTO dto);
   
   @Select("select project_target_price from project_info where project_id=#{project_id}")
   public ProjectInfoDTO get_price(ProjectInfoDTO dto);
   
   @Select("select project_check from project_info where project_id=#{project_id}")
   public int get_project_check(ProjectInfoDTO dto);
   
   
   @Insert("insert into project_gift_list(project_id,project_gift_price,project_gift,gift_id) values(#{project_id},#{project_gift_price},#{project_gift},project_gift_seq.nextval)")
   public void insert_gift_list(ProjectGiftDTO dto);
   
   @Select("select * from project_gift_list where project_id=#{project_id}")
   public ArrayList<ProjectGiftDTO> get_gift(ProjectGiftDTO dto);
   
   @Delete("delete from project_gift_list where gift_id=#{gift_id}")
   public void gift_delete(ProjectGiftDTO dto);
   
   @Update("update project_info set project_video=#{project_video} where project_id=#{project_id}")
   public void insert_video(ProjectInfoDTO dto);
   
   @Select("select project_video from project_info where project_id=#{project_id}")
   public String get_video(ProjectInfoDTO dto);
   
   @Update("update project_info set project_story=#{project_story} where project_id=#{project_id}")
   public void insert_story(ProjectInfoDTO dto);
   
   @Update("update project_info set project_prelaunching_check=#{project_prelaunching_check} where project_id=#{project_id}")
   public void insert_prelaunching(ProjectInfoDTO dto);
   
   @Update("update project_info set project_check=#{project_check} where project_id=#{project_id}")
   public void set_check_num(ProjectInfoDTO dto);
   
   @Select("select project_story from project_info where project_id=#{project_id}")
   public String get_story(ProjectInfoDTO dto);
   
   @Select("select member_name from member_info where member_email=#{member_email}")
   public String get_member_name(MemberDTO dto);
   
   @Select("select member_email, project_id, project_main_image from project_info where project_id=#{project_id}")
   public ProjectInfoDTO getImage(ProjectInfoDTO dto);
   
   @Select("select project_summary from project_info where project_id=#{project_id}")
   public String get_summary(ProjectInfoDTO dto);
   
   @Select("select project_sub_category from project_info where project_id=#{project_id}")
   public String get_category(ProjectInfoDTO dto);
   
   @Select("select project_tag from project_info where project_id=#{project_id}")
   public String get_tag(ProjectInfoDTO dto);
   
   @Select("select member_email from project_info where project_id=#{project_id}")
   public String get_email(ProjectInfoDTO dto);
}