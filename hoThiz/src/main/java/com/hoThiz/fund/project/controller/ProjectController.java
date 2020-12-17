package com.hothiz.fund.project.controller;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectParamDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;
import com.hothiz.fund.project.service.ProjectService;
import com.hothiz.fund.project.service.ProjectServiceImpl;

@RestController
@RequestMapping("/discover")
public class ProjectController {
	
	@Autowired
	ProjectService ps;
	
	@Autowired
	ProjectDAO dao;
	
	
	//게시글 화면
	@GetMapping(value="", produces = "application/json;charset=utf-8")
	public ModelAndView projectList(ModelAndView mv,
			ProjectParamDTO paramDto) {
		
		mv.addObject("firstList", ps.firstProjectView(paramDto));
		mv.setViewName("project/project_list");
		
		return mv;
	}
	

	//비동기로 값 끌어오기 로직
	@GetMapping(value = "/getData", produces = "application/json;charset=utf-8")
	public String getProjectList(ProjectParamDTO paramDto) {
		System.out.println("비동기con");
		String jsonList = ps.getProjectList(paramDto);
		System.out.println(jsonList);
		
		return jsonList;
	}
	
	/*
	 맵, 밸류 형태로 프로젝트 정보 넘기려면..?
	 list<map<프로젝트id,프로젝트info dto>> = new ArrayList<>(); 일케하면 될거같다..??
	 ArrayList<map> 해서
	 [{project_id : ""} ,
	 */
	
	//프로젝트 좋아요 비동기
	//post로 받을땐 text로 매핑을 해줘야한다ㅜㅜ시발 겨우풀엇다
	@PostMapping(value="/like", produces="application/text;charset=utf-8")
	public String likeProject(Member_likeDTO likeDto) {
		System.out.println("좋아요 로직 con");
		System.out.println(likeDto.getMember_email());
		System.out.println(likeDto.getProject_id());
		String msg = ps.chkLike(likeDto);
		System.out.println("매핑한 메시지"+msg);
		
		return msg;
	}
	
	
	
	
	@GetMapping(value = "/{project_id}")
	public ProjectInfoDTO getAProjectDetail(@PathVariable int project_id, Model model) {
		
		
		ProjectInfoDTO dto=null;

		return dto;
	}
	

	
	
	

	@RequestMapping("/insert")
	public void insert() {
		
			for(int i=1;i<31;i++) {
				ProjectInfoDTO dto = new ProjectInfoDTO();
				String e = ""+i;
				dto.setMember_email(e);
				dto.setProject_like(i*50);
				dto.setProject_current_percent(i*50);
				dto.setProject_title(i+"제목");
				dto.setProject_summary("요약"+i);
				dto.setProject_target_price(i*1000);
				dto.setProject_main_category("video");
				dto.setProject_sub_category("film");
				dao.setProjectInfo(dto);
			}
		
	}

	
	

	
	
	

}