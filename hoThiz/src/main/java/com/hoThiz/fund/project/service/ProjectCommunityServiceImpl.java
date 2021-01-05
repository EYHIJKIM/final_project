package com.hothiz.fund.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectCommunityDTO;

@Service
public class ProjectCommunityServiceImpl implements ProjectCommunityService {

	
	@Autowired
	ProjectDAO dao;
	
	@Override
	public void writeOnCommunity(ProjectCommunityDTO coDto) {
		dao.writeOnBoard(coDto);
		
	}

	public ArrayList<ProjectCommunityDTO> getBoardList(int project_id){
		
		return dao.getBoardList(project_id);
		
	}
	
	
	
	
}
