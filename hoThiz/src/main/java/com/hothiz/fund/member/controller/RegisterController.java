package com.hothiz.fund.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.service.MemberService;

@RestController
public class RegisterController {
	@Autowired
	MemberService ms;
	
	@RequestMapping(value = "member_email_check", produces="application/text;charset=utf-8")
	public String member_email_check(MemberDTO dto) {		
		String result = ms.member_email_check(dto);
		return result;
	}
	
	@RequestMapping(value = "member_phnum_chk", produces="application/text;charset=utf-8")
	public String member_phnum_chk(MemberDTO dto) {
		String result = ms.member_phnum_chk(dto);
		return result;
	}
}
