package com.hothiz.fund.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.hothiz.fund.member.dto.MemberDTO;

@Repository
public interface MemberDAO {

	@Select("select * from member_info where member_email = #{id}")
	public MemberDTO setting(String id);
}
