package com.hothiz.fund;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;
import com.hothiz.fund.project.service.ProjectService;
import com.hothiz.fund.project.service.ProjectServiceImpl;

//@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	ProjectService ps;
	
	@Autowired
	ProjectDAO dao;
	
	@RequestMapping("/insert")
	public void insertMem() {
		
		for(int i=3;i<70;i++) {
			MemberDTO dto = new MemberDTO();
			dto.setMember_email("testEmail"+i);
			dto.setMember_name("testName"+i);
			dto.setMember_phnum("testPH"+i);
			dao.insertMember(dto);
		}
		
		
		
	}
	
	/*
		
		
		
		@GetMapping(value="/testList", produces = "application/json;charset=utf-8")
		@ResponseBody
		public ModelAndView testList(ModelAndView model) {
			System.out.println("게시글 목록이다");
			ProjectPagingDTO dto = new ProjectPagingDTO();
			dto.pagingSetting(0);
			model.addObject("list", dao.testList(dto));
			model.setViewName("test/testList");
			
			return model;
		}
		

		@GetMapping(value="/allList", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String all() {
			
			String all = ps.all();
			
			return all;
		}
		

		
		
		//寃뚯떆湲� �긽�꽭蹂닿린
		@GetMapping(value = "/{project_id}")
		public TestDTO test(@PathVariable int project_id, Model model) {
			
			
			TestDTO dto = ps.selectOne(project_id);

			return dto;
		}
		
		
		/*
		@RequestMapping(value = "/insert")
		public ModelAndView insert() {
			
			ps.insert();

			return new ModelAndView("redirect:/test/testList");
			
		}
		*/
		
}
