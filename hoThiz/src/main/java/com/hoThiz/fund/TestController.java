package com.hothiz.fund;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hothiz.fund.project.dto.TestDTO;
import com.hothiz.fund.project.service.ProjectServiceImpl;

@RestController
@RequestMapping("test")
public class TestController {
	
	@Autowired
	ProjectServiceImpl ps;
	
	//寃뚯떆湲� 由ъ뒪�듃
		@GetMapping(value = "/", produces = "application/json;charset=utf-8")
		public String test() {
			System.out.println("湲�紐⑸줉 �슂泥�");
			String list = ps.testList();
			return list;
		}
		
		
		
		
		//寃뚯떆湲� �긽�꽭蹂닿린
		@GetMapping(value = "/{project_id}")
		public TestDTO test(@PathVariable int project_id, Model model) {
			
			//�뿬湲곗뿉 寃뚯떆湲� �꽭遺��궗�빆 �엳�쓬.
			TestDTO dto = ps.selectOne(project_id);

			return dto;
		}
		
		/*
		@RequestMapping(value = "/")
		public ModelAndView insert() {

			return new ModelAndView("redirect:/test/testList");
			
		}
		*/
		
}
