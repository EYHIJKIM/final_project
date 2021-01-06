package com.hothiz.fund.project.service;

import java.util.ArrayList;

import com.hothiz.fund.project.dto.ProjectCommunityDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.ProjectReplyDTO;

public interface ProjectCommunityService {

	
	//글쓰기
	public void writeOnCommunity(ProjectCommunityDTO coDto);
	
	//비동기 댓글 가져오기
	public String getReply(ProjectReplyDTO reDto);
	
	//첫화면 게시글
	public ArrayList<ProjectCommunityDTO> getBoardList(int project_id);

	//비동기 게시글
	public String getNoSyncBoardList(int project_id, int page);
	
	//댓글 저장
	public String writeReply(ProjectReplyDTO reDto);
	
	//json파싱
	public String jsonMapper(Object obj);
	
	public ProjectReplyDTO getAReply(ProjectReplyDTO reDto);
}
