package com.hothiz.fund.project.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.hothiz.fund.project.dto.ParamDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;

public interface ProjectService {

	
	//게시글 비동기로 뽑아오기(30개씩)
	public String getProjectList(ParamDTO paramDto);
	
	//처음에 30개 뽑아옴
	public ArrayList<ProjectInfoDTO> firstProjectView(ParamDTO paramDto);

	//게시글 정보
	public ProjectInfoDTO getAProjectDetail(int project_id);
	
	
	
	
	
	
}
