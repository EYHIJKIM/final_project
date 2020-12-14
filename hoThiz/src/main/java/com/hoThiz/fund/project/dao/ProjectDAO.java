package com.hothiz.fund.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.hothiz.fund.project.dto.TestDTO;

@Repository
public interface ProjectDAO {
	
	
	
	@Select("select * from test order by project_id desc")
	public ArrayList<TestDTO> testList();
	
	@Select("select * from test where project_id=#{project_id}")
	public TestDTO selectOne(Integer project_id);

	
	@Insert("INSERT INTO test values(#{project_id},#{member_name},#{project_title},#{project_content})")
	public void insert(TestDTO dto);
	
	
	//모든 게시글을 가져옴
	
	
	//해당 카테고리 게시글을 30개씩 뽑아냄. =>스크롤 비동기
	
	
	
	//메인에서 카
	
	
	
}
