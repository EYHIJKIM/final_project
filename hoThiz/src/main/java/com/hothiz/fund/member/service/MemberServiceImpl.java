package com.hothiz.fund.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hothiz.fund.member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;
	
	@Override
	public void setting(Model model, String id) {
		model.addAttribute("list", dao.setting(id));
		
	}

}
