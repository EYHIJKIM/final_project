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
import com.hothiz.fund.project.dto.TestDTO;

@Service
public class ProjectServiceImpl{

	@Autowired
	ProjectDAO dao;
	
	
	public String testList(){
		ArrayList<TestDTO> list = dao.testList();
		
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


	public void insert() {
		for(int i=150;i<=250;i++) {
			TestDTO dto = new TestDTO();
			dto.setProject_id(i);
			dto.setMember_name(i+"a");
			dto.setProject_title(i+"제목");
			dto.setProject_content(i+"내용");
			dao.insert(dto);
		}
	}
		
	
	
}
