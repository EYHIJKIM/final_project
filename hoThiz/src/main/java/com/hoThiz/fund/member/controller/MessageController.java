package com.hothiz.fund.member.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.deser.std.ObjectArrayDeserializer;
import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_messageDTO;
import com.hothiz.fund.member.service.MemberService;

import net.sf.json.JSONArray;

@RestController
public class MessageController {
	@Autowired
	MemberService ms;
	
	
	
	//��ü�޽���
		@RequestMapping(value="message_all", produces="application/json;charset=utf-8")
		public String message_all(HttpSession session, Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num) throws Exception {
			System.out.println("num = " + num);
			ArrayList<Member_messageDTO> arr = new ArrayList<Member_messageDTO>();
			
			model.addAttribute("test",3);
			
			arr = ms.message_all(session,model,num);			
			
			ObjectMapper mapper = new ObjectMapper();
			String strJson = null;
			strJson = mapper.writeValueAsString(arr);
			return strJson;
		}
	
	//�����޽���
	@RequestMapping(value="message_send", produces="application/json;charset=utf-8")
	public String message_send(HttpSession session, Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num) throws Exception {
		System.out.println("num = " + num);
		ArrayList<Member_messageDTO> arr = new ArrayList<Member_messageDTO>();
		
		arr = ms.message_send(session,model,num);
		
		ObjectMapper mapper = new ObjectMapper();
		String strJson = null;
		strJson = mapper.writeValueAsString(arr);
		return strJson;
	}
	
	//�����޽���
		@RequestMapping(value="message_receive", produces="application/json;charset=utf-8")
		public String message_receive(HttpSession session, Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num) throws Exception {
			System.out.println("num = " + num);
			ArrayList<Member_messageDTO> arr = new ArrayList<Member_messageDTO>();
			
			arr = ms.message_receive(session,model,num);
			
			ObjectMapper mapper = new ObjectMapper();
			String strJson = null;
			strJson = mapper.writeValueAsString(arr);
			return strJson;
		}
	
	
}
