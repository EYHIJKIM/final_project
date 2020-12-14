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

import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;
import com.hothiz.fund.project.service.ProjectServiceImpl;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	ProjectServiceImpl ps;
	
	@Autowired
	ProjectDAO dao;
	
		//게시글 전체 목록
		@GetMapping(value = "/getData", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String test(@RequestParam int locatedPage) {
			System.out.println("페이징 처리하러왔슴다");

			
			return ps.testList(locatedPage);
		}
		
		
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
		
		/*
		@GetMapping(value="/allList", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String all() {
			
			String all = ps.all();
			
			return all;
		}
		
		*/
		
		
		//寃뚯떆湲� �긽�꽭蹂닿린
		@GetMapping(value = "/{project_id}")
		public TestDTO test(@PathVariable int project_id, Model model) {
			
			//�뿬湲곗뿉 寃뚯떆湲� �꽭遺��궗�빆 �엳�쓬.
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
