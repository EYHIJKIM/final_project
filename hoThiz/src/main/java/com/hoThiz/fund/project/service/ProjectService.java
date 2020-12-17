package com.hothiz.fund.project.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.project.dto.ProjectParamDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;

public interface ProjectService {

	
	//게시글 비동기로 뽑아오기(30개씩)
	public String getProjectList(ProjectParamDTO paramDto);
	
	//처음에 30개 뽑아옴
	public ArrayList<ProjectInfoDTO> firstProjectView(ProjectParamDTO paramDto);

	//게시글 정보
	public ProjectInfoDTO getAProjectDetail(int project_id);
	
	

	//좋아요했는지 안했는지를 체크함
	public String chkLike(Member_likeDTO likeDto);
	
	
	
	
	
	
}