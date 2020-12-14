package com.hothiz.fund.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.TestDTO;

@Repository
public interface ProjectDAO {
	
	
	//모든 게시글을 가져옴
	@Select("select * from test order by project_id desc")
	public ArrayList<TestDTO> allList();
	
	
	//게시글 상세정보
	@Select("select * from test where project_id=#{project_id}")
	public TestDTO selectOne(Integer project_id);

	
	//test용 프로젝트 올리기
	@Insert("INSERT INTO test values(#{project_id},#{member_name},#{project_title},#{project_content})")
	public void insert(TestDTO dto);
	
	
	
	
	//30게시글 갯수(메뉴탭들)
	@Select("SELECT B.*" + 
			"FROM (SELECT rownum rn, A.*" + 
					"FROM (select * from test order by project_id desc) A" + 
			")B " + 
			"WHERE rn between #{startRownum} and #{endRownum}")
	public ArrayList<TestDTO> testList(ProjectPagingDTO dto);

	
	///////////////////////////////////////////////////////////////////////////////
	
	//모든 프로젝트
	@Select("SELECT B.*" + 
			"FROM (SELECT rownum rn, A.*" + 
					"FROM (select * from project_info order by project_id desc) A" + 
			")B " + 
			"WHERE rn between #{startRownum} and #{endRownum}")
	public ArrayList<TestDTO> getAllProjectList(ProjectPagingDTO dto);
	
	
	
	//태그별 게시글
	
	
	
	
	
	
	
	
	//메인에서 10개씩 있는거..카테고리별로 where줘야 함.
	
	

	
	
}
