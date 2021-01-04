package com.hothiz.fund.project.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hothiz.fund.project.dao.ProjectInfoDAO;
import com.hothiz.fund.project.dto.ProjectGiftDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;

@Service
public class ProjectUploadServiceImpl implements ProjectUploadService{
	@Autowired
	ProjectInfoDAO dao;
	public void editProject() {
		dao.editProject();
	}
	public int editId() {
		return dao.editId()-1;
	}
	public void insert_title(ProjectInfoDTO dto) {
		dao.insert_title(dto);
	}
	public String getTitle(ProjectInfoDTO dto) {
		return dao.getTitle(dto);
	}
	public void insert_summary(ProjectInfoDTO dto) {
		dao.insert_summary(dto);
	}
	public void insert_tag(ProjectInfoDTO dto) {
		dao.insert_tag(dto);
	}
	public void insert_category(ProjectInfoDTO dto) {
		String sub = dto.getProject_sub_category();
		//게임
		if(sub.equals("game")||sub.equals("mobile-game")
				||sub.equals("video-game")||sub.equals("board-game")) {
			dto.setProject_main_category("game");
		//공연
		}else if(sub.equals("show")||sub.equals("dance")
				||sub.equals("musical")||sub.equals("theater")) {
			dto.setProject_main_category("show");
		//디자인
		}else if(sub.equals("design")||sub.equals("architecture")
				||sub.equals("graphic-design")||sub.equals("product-design")) {
			dto.setProject_main_category("design");
		//만화
		}else if(sub.equals("comics")||sub.equals("web-comics")
				||sub.equals("comic-books")) {
			dto.setProject_main_category("comics");
		//예술
		}else if(sub.equals("art")||sub.equals("exhibitions")
				||sub.equals("sculpture-and-action-figures")||sub.equals("illustration")) {
			dto.setProject_main_category("art");
		//공예
		}else if(sub.equals("crafts")||sub.equals("candles-and-diffusers-and-soaps")
				||sub.equals("leather-and-metal-and-woodworking")||sub.equals("pottery")) {
			dto.setProject_main_category("crafts");
		//사진
		}else if(sub.equals("photography")||sub.equals("people-photography")
				||sub.equals("space-and-urban-photography")||sub.equals("animals-photography")) {
			dto.setProject_main_category("photography");
		//영상
		}else if(sub.equals("video")||sub.equals("film")||sub.equals("documentary")
				||sub.equals("animation")||sub.equals("music-videos")) {
			dto.setProject_main_category("video");
		//푸드
		}else if(sub.equals("food")||sub.equals("appetizer")
				||sub.equals("main-dish")||sub.equals("dessert")) {
			dto.setProject_main_category("food");
		//음악
		}else if(sub.equals("music")||sub.equals("classical-music")
				||sub.equals("popular-music")||sub.equals("Independent-music")) {
			dto.setProject_main_category("music");
		//출판
		}else if(sub.equals("publication")||sub.equals("zines")
				||sub.equals("literature-and-essay")||sub.equals("picture-books")) {
			dto.setProject_main_category("publication");
		//테크
		}else if(sub.equals("technology")||sub.equals("software")
				||sub.equals("hardware")||sub.equals("apps")||sub.equals("web")) {
			dto.setProject_main_category("technology");
		//패션
		}else if(sub.equals("fashion")||sub.equals("apparels")
				||sub.equals("accessories")||sub.equals("beauty")) {
			dto.setProject_main_category("fashion");
		//저널리즘
		}else if(sub.equals("journalism")||sub.equals("audio-journals")
				||sub.equals("video-journals")||sub.equals("web-journals")) {
			dto.setProject_main_category("journalism");
		}else {
			System.out.println("가능? 암튼에러임");
		}
		//System.out.println("메인"+dto.getProject_main_category());
		//System.out.println("서브"+dto.getProject_sub_category());
		dao.insert_categrory(dto);
	}
	
	public void insert_price(ProjectInfoDTO dto) {
		dao.insert_price(dto);
	}
	
	public void insert_release_date(ProjectInfoDTO dto) {
		dao.insert_release_date(dto);
	}
	
	public void insert_deadline(ProjectInfoDTO dto) {
		dao.insert_deadline(dto);
	}
	
	public void insert_image(ProjectInfoDTO dto) {
		dao.insert_image(dto);
	}
	
	public String get_image_name(ProjectInfoDTO dto) {
		return dao.get_image_name(dto);
	}
	
	public void insert_gift_list(ProjectGiftDTO dto) {
		dao.insert_gift_list(dto);
	}
	
	public ArrayList<ProjectGiftDTO> get_gift(ProjectGiftDTO dto) {
		return dao.get_gift(dto);
	}
	
	public ProjectInfoDTO get_deadline(ProjectInfoDTO dto) {
		return dao.get_deadline(dto);
	}
	
	public ProjectInfoDTO get_release_date(ProjectInfoDTO dto) {
		return dao.get_release_date(dto);
	}
	
	public ProjectInfoDTO get_price(ProjectInfoDTO dto) {
		return dao.get_price(dto);
	}
	
	public void gift_delete(ProjectGiftDTO dto) {
		dao.gift_delete(dto);
	}
	
	public void insert_video(ProjectInfoDTO dto) {
		dao.insert_video(dto);
	}
	
	public String get_video(ProjectInfoDTO dto) {
		return dao.get_video(dto);
	}
	
	public void insert_story(ProjectInfoDTO dto) {
		dao.insert_story(dto);
	}
	
	public void insert_prelaunching(ProjectInfoDTO dto) {
		dao.insert_prelaunching(dto);
	}
	
	public int get_project_check(ProjectInfoDTO dto) {
		return dao.get_project_check(dto);
	}
	
	public void set_check_num(ProjectInfoDTO dto) {
		dao.set_check_num(dto);
	}
	
	public String get_storyget_story(ProjectInfoDTO dto) {
		return dao.get_storyget_story(dto);
	}
}
