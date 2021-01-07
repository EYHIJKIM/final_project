package com.hothiz.fund.project.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectCommunityDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.ProjectParamDTO;
import com.hothiz.fund.project.dto.ProjectReplyDTO;

@Service
public class ProjectCommunityServiceImpl implements ProjectCommunityService {

	
	@Autowired
	ProjectDAO dao;
	
	
	@Override
	public void writeOnCommunity(ProjectCommunityDTO coDto) {
		System.out.println("게시글 넣으러 옴.");
		dao.writeOnBoard(coDto);
		
	}
	
	
	public int getLastBno(int project_id) {
		return dao.getLastBno(project_id);
	}
	
	

	//처음 게시글들
	@Override
	public ArrayList<ProjectCommunityDTO> getBoardList(int project_id){
		ProjectPagingDTO pageDto = new ProjectPagingDTO();
		pageDto.setPER_PAGE_PROJECT(5);pageDto.setStartRownum();pageDto.setEndRownum();
	
		ArrayList<ProjectCommunityDTO> list = dao.getBoardList(project_id, pageDto);
		
		SimpleDateFormat brdDate = new SimpleDateFormat("yyyy.MM.dd");
		
		for(ProjectCommunityDTO dto : list) {
			dto.setDateFormat(brdDate.format(dto.getRegdate()));
		}
		
		
		
		System.out.println(list);
		return list;
		
	}
	
	
	
	
	//비동기 게시글
	@Override
	public String getNoSyncBoardList(int project_id, int page){
		ProjectPagingDTO pageDto = new ProjectPagingDTO(page);
		pageDto.setPER_PAGE_PROJECT(5);pageDto.setStartRownum();pageDto.setEndRownum();
		
		System.out.println("비동기게시글 가지러 옴");
		System.out.println(pageDto.getLocatedPage());
		System.out.println(pageDto.getStartRownum());
		System.out.println(pageDto.getEndRownum());
		ArrayList<ProjectCommunityDTO> list = dao.getBoardList(project_id,pageDto);
		System.out.println(list);
		SimpleDateFormat brdDate = new SimpleDateFormat("yyyy.MM.dd");
		
		
		for(ProjectCommunityDTO dto : list) {
			dto.setDateFormat(brdDate.format(dto.getRegdate()));
			System.out.println(dto.getDateFormat());

		}
		return jsonMapper(list);
		
	}
	
	
	//비동기 댓글
	@Override
	public String getReply(ProjectReplyDTO reDto){
		System.out.println("비동기 댓글 가지러옴");
		ArrayList<ProjectReplyDTO> list = dao.getReplyOnBoard(reDto);
		
		//맵에 넣자..게시글 번호 : {댓글 쓴사람 : ____, 댓글 내용 : _____< }
		SimpleDateFormat brdDate = new SimpleDateFormat("yyyy.MM.dd");
		
		
		for(ProjectReplyDTO dto : list) {
			dto.setDateFormat(brdDate.format(dto.getRegdate()));
			System.out.println(dto.getDateFormat());

		}
		
		
		
		return jsonMapper(list);
		
	}
	
	//비동기 댓글 저장하고 가장 최근댓글 가져올거임
	public String writeReply(ProjectReplyDTO reDto) {
		System.out.println("댓글 저장");
		dao.writeReplyOnBoard(reDto);
		
		System.out.println(reDto.getBno());
		System.out.println(reDto.getProject_id());
		

		
		return getReply(reDto);
		
	}
	
	
	
	@Override
	public String deleteReply (ProjectReplyDTO reDto) {
		System.out.println("댓글삭제하러 서비스옴");
		dao.deleteReply(reDto);

		return getReply(reDto);
	}
	
	
	@Override
	public String editReply(ProjectReplyDTO reDto) {
		System.out.println("댓글수정하러 값 가지러옴.");
		return jsonMapper(dao.getAReply(reDto));

	}
	
	
	
	
	/*
	public ProjectReplyDTO getAReply(ProjectReplyDTO reDto) {
		
		ProjectReplyDTO aDto = dao.getAReply(reDto);
		System.out.println("db에서 잘 꺼냇나:"+aDto);
		SimpleDateFormat brdDate = new SimpleDateFormat("yyyy.MM.dd");
		
			reDto.setDateFormat(brdDate.format(aDto.getRegdate()));
			System.out.println(aDto.getDateFormat());
			
			return aDto;

		}
		*/
	
	
	
	//JSON으로 파싱하는 메소드(비동기시 필수)====================================
	@Override
	public String jsonMapper(Object obj) {
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;

		try {
			jsonStr = mapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			System.out.println("jsonMapper 메소드 오류");
			e.printStackTrace();
		}
		
		return jsonStr;	
	}





}
