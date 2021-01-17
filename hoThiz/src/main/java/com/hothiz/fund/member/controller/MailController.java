package com.hothiz.fund.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hothiz.fund.member.service.MailService;

@Controller
public class MailController {

	@Autowired
	MailService ms;
	
	@RequestMapping("auth")
	public String auth(HttpServletRequest request, @RequestParam("email") String email) {
		ms.auth(request,email);
		return "redirect:setting";
	}
	
	@RequestMapping("auth_check")
	public String auth_check(@RequestParam("email") String email,
			@RequestParam("userkey") String userkey, HttpSession session) {
		String sessionkey = (String)session.getAttribute(email);
		if(sessionkey != null) {
			session.setAttribute("userId", email);
			ms.verify(email);
		}
		return "redirect:setting";
	}
	
	
}
