package com.hothiz.fund.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hothiz.fund.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	
	@RequestMapping("login")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("id", "abc@naver.com");
		return "member/login";
	}
	
	
	
	@RequestMapping("setting")
	public String setting(Model model, HttpSession session) {
		
		
		
		//세션값으로설정된 id(email) 이 널이면 로그인창으로보내버림
		if(session.getAttribute("id") == null) {
			return "redirect:login";
		
		//세션값이 존재한다면 세션값을통해 dto생성하는로직
		}else {
			String id = (String)session.getAttribute("id");
		ms.setting(model,id);
		return "member/profile/settings/setting";
		}
		
		
		}
	
}
