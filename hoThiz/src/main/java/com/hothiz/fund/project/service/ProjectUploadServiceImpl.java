package com.hothiz.fund.project.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hothiz.fund.member.dao.MemberDAO;
import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.project.dao.ProjectInfoDAO;
import com.hothiz.fund.project.dto.ProjectGiftDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;

@Service
public class ProjectUploadServiceImpl implements ProjectUploadService{
   @Autowired
   ProjectInfoDAO dao;
   
   public void editProject(ProjectInfoDTO dto) {
      dao.editProject(dto);
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
   
   public String get_story(ProjectInfoDTO dto) {
      return dao.get_story(dto);
   }
   
   public String get_member_name(MemberDTO dto) {
      return dao.get_member_name(dto);
   }
   
   public ProjectInfoDTO getImage(ProjectInfoDTO dto) {
      return dao.getImage(dto);
   }
   
   public String get_summary(ProjectInfoDTO dto) {
      return dao.get_summary(dto);
   }
   
   public String get_category(ProjectInfoDTO dto) {
      String category = dao.get_category(dto);
      if(category == null) {
         return "";
      }else if(category.equals("game")) {
         return "게임";
      }else if(category.equals("mobile-game")) {
         return "게임/모바일게임";
      }else if(category.equals("video-game")) {
         return "게임/비디오게임";
      }else if(category.equals("board-game")) {
         return "게임/보드게임";
      }else if(category.equals("show")) {
         return "공연";
      }else if(category.equals("dance")) {
         return "공연/무용";
      }else if(category.equals("musical")) {
         return "공연/뮤지컬";
      }else if(category.equals("theater")) {
         return "공연/연극";
      }else if(category.equals("design")) {
         return "디자인";
      }else if(category.equals("architecture")) {
         return "디자인/건축, 공간";
      }else if(category.equals("graphic-design")) {
         return "디자인/그래픽 디자인";
      }else if(category.equals("product-design")) {
         return "디자인/제품 디자인";
      }else if(category.equals("comics")) {
         return "만화";
      }else if(category.equals("web-comics")) {
         return "만화/웹툰";
      }else if(category.equals("comic-books")) {
         return "만화/만화책";
      }else if(category.equals("art")) {
         return "예술";
      }else if(category.equals("exhibitions")) {
         return "예술/전시";
      }else if(category.equals("sculpture-and-action-figures")) {
         return "예술/조소, 피규어";
      }else if(category.equals("illustration")) {
         return "예술/일러스트레이션";
      }else if(category.equals("crafts")) {
         return "공예";
      }else if(category.equals("candles-and-diffusers-and-soaps")) {
         return "공예/캔들, 조향, 비누";
      }else if(category.equals("leather-and-metal-and-woodworking")) {
         return "공예/가죽, 금속, 목 공예";
      }else if(category.equals("pottery")) {
         return "공예/도예";
      }else if(category.equals("photography")) {
         return "사진";
      }else if(category.equals("people-photography")) {
         return "사진/인물";
      }else if(category.equals("space-and-urban-photography")) {
         return "사진/배경";
      }else if(category.equals("animals-photography")) {
         return "사진/동물";
      }else if(category.equals("video")) {
         return "영상";
      }else if(category.equals("film")) {
         return "영상/영화";
      }else if(category.equals("documentary")) {
         return "영상/다큐";
      }else if(category.equals("animation")) {
         return "영상/애니메이션";
      }else if(category.equals("music-videos")) {
         return "영상/뮤직비디오";
      }else if(category.equals("food")) {
         return "푸드";
      }else if(category.equals("appetizer")) {
         return "푸드/에피타이저";
      }else if(category.equals("main-dish")) {
         return "푸드/메인";
      }else if(category.equals("dessert")) {
         return "푸드/디저트";
      }else if(category.equals("music")) {
         return "음악";
      }else if(category.equals("classical-music")) {
         return "음악/클래식";
      }else if(category.equals("popular-music")) {
         return "음악/대중음악";
      }else if(category.equals("Independent-music")) {
         return "음악/인디음악";
      }else if(category.equals("publication")) {
         return "출판";
      }else if(category.equals("zines")) {
         return "출판/잡지";
      }else if(category.equals("literature-and-essay")) {
         return "출판/문학, 에세이";
      }else if(category.equals("picture-books")) {
         return "출판/그림책";
      }else if(category.equals("technology")) {
         return "테크";
      }else if(category.equals("software")) {
         return "테크/소프트웨어";
      }else if(category.equals("hardware")) {
         return "테크/하드웨어";
      }else if(category.equals("apps")) {
         return "테크/앱";
      }else if(category.equals("web")) {
         return "테크/웹";
      }else if(category.equals("fashion")) {
         return "패션";
      }else if(category.equals("apparels")) {
         return "패션/의류";
      }else if(category.equals("accessories")) {
         return "패션/악세서리";
      }else if(category.equals("beauty")) {
         return "패션/뷰티";
      }else if(category.equals("journalism")) {
         return "저널리즘";
      }else if(category.equals("audio-journals")) {
         return "저널리즘/오디오";
      }else if(category.equals("video-journals")) {
         return "저널리즘/비디오";
      }else if(category.equals("web-journals")) {
         return "저널리즘/웹(개인방송)";
      }
      return "";
   }
   
   public String get_tag(ProjectInfoDTO dto) {
      return dao.get_tag(dto);
   }
   
   public String get_email(ProjectInfoDTO dto) {
      return dao.get_email(dto);
   }
}