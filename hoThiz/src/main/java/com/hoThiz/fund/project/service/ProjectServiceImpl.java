package com.hothiz.fund.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;

@Service
public class ProjectServiceImpl{

	@Autowired
	ProjectDAO dao;

	
	
	
	public String testList(int locatedPage){
		
		ProjectPagingDTO dto = new ProjectPagingDTO();
		dto.pagingSetting(locatedPage);
		
		
		ArrayList<TestDTO> list = dao.testList(dto);
		

		ObjectMapper mapper = new ObjectMapper();
		String listJson = null;
		
		
		try {
			listJson = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			System.out.println("testList 서비스 오류");
			e.printStackTrace();
		}
		

		return listJson;
	}


	public TestDTO selectOne(int project_id) {

		TestDTO dto = dao.selectOne(project_id);	
		
		return dto;
	}
	







	
	
}
