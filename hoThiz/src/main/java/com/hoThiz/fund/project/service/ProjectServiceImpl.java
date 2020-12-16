package com.hothiz.fund.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ParamDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	ProjectDAO dao;

	@Override
	public String getProjectList(ParamDTO paramDto) {

		// 맵에 프로퍼티 값을 넣어주는 메소드
		// Map<String, Object> paramMap = BeanUtils.describe(paramDto);

		// 페이지 셋팅
		ProjectPagingDTO pageDto = new ProjectPagingDTO(paramDto.getPage());

		// select값 넣는 list
		ArrayList<ProjectInfoDTO> projectList = null;

		// 파람에 따라 프로젝트 로직 조절
		String sort = paramDto.getSort();
		
		// 카테고리 분류인 경우
		String category = paramDto.getCategory();
		System.out.println(category);
		
		if (!(category.equals(""))) {
			System.out.println("카테고리 가져오기");

			projectList = dao.getCategoryProjectList(pageDto, category);

		} else if (paramDto.getOnGoing() != null) {// 태그분류인 경우
			if (sort.equals("popular")) {
				// 인기순, 좋아요 50개 이상

			}
			if (sort.equals("endedAt")) {
				// max,min 값을 넘겨줘서 뽑아냄.
				int maxAchieveRate = paramDto.getMaxAchieveRate();
				int minAchieveRate = paramDto.getMinAchieveRate();
				// projectList = dao.getProjectList(pageDto,maxAchieveRate,minAchieveRate);
			}
			if (sort.equals("prelanching")) {
				// 공개예정인 경우.

			}

		} else { // 모든 프로젝트
			System.out.println("모든 프로젝트 가져오기");
			projectList = dao.getProjectList(pageDto);
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonProjectList = null;

		try {
			jsonProjectList = mapper.writeValueAsString(projectList);
		} catch (JsonProcessingException e) {
			System.out.println("testList 서비스 오류");
			e.printStackTrace();
		}

		return jsonProjectList;

	}

	@Override
	public ArrayList<ProjectInfoDTO> firstProjectView(ParamDTO paramDto) {
		// 페이지 셋팅
		ProjectPagingDTO pageDto = new ProjectPagingDTO(paramDto.getPage());

		// select값 넣는 list
		ArrayList<ProjectInfoDTO> projectList = null;
		
		// 파람에 따라 프로젝트 로직 조절
		String sort = paramDto.getSort();

		// 카테고리 분류인 경우
		if (paramDto.getCategory()!=null) {
			System.out.println("카테고리파라미터 존재, but 오는값 없음==공백");
			
			System.out.println(pageDto.getStartRownum());
			System.out.println(pageDto.getEndRownum());
			String category = paramDto.getCategory();
			System.out.println(category);
			
			projectList = dao.getCategoryProjectList(pageDto, category);

		} 
		
		/*else if (paramDto.getOnGoing() != null) {// 태그분류인 경우
			if (sort.equals("popular")) {
				// 인기순, 좋아요 50개 이상

			}
			if (sort.equals("endedAt")) {
				// max,min 값을 넘겨줘서 뽑아냄.
				int maxAchieveRate = paramDto.getMaxAchieveRate();
				int minAchieveRate = paramDto.getMinAchieveRate();
				// projectList = dao.getProjectList(pageDto,maxAchieveRate,minAchieveRate);
			}
			if (sort.equals("prelanching")) {
				// 공개예정인 경우.

			}

		}*/ else { // 모든 프로젝트
			System.out.println("모든 프로젝트 가져오기(카테고리 널 x)");
			projectList = dao.getProjectList(pageDto);
		}

		return projectList;
	}

	/// 멤버넣기.. 나중에 지우삼****

	/*
	 * 
	 * public String testList(int locatedPage){
	 * 
	 * ProjectPagingDTO dto = new ProjectPagingDTO();
	 * dto.pagingSetting(locatedPage);
	 * 
	 * 
	 * ArrayList<TestDTO> list = dao.testList(dto);
	 * 
	 * 
	 * ObjectMapper mapper = new ObjectMapper(); String listJson = null;
	 * 
	 * 
	 * try { listJson = mapper.writeValueAsString(list); } catch
	 * (JsonProcessingException e) { System.out.println("testList 서비스 오류");
	 * e.printStackTrace(); }
	 * 
	 * 
	 * return listJson; }
	 * 
	 * 
	 * public TestDTO selectOne(int project_id) {
	 * 
	 * TestDTO dto = dao.selectOne(project_id);
	 * 
	 * return dto; }
	 * 
	 * 
	 */

}
