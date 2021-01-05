package com.hothiz.fund.project.service;

import java.util.ArrayList;

import com.hothiz.fund.project.dto.ProjectCommunityDTO;

public interface ProjectCommunityService {

	
	//글쓰기
	
	public void writeOnCommunity(ProjectCommunityDTO coDto);
	
	
	public ArrayList<ProjectCommunityDTO> getBoardList(int project_id);
	
}
