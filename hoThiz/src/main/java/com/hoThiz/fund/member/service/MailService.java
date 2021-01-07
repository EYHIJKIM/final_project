package com.hothiz.fund.member.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.hothiz.fund.member.dao.MemberDAO;

@Service
public class MailService {

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	MemberDAO dao;
	
	
	public void sendMail(String to, String subject, String body) {

		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper =
					new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText(body,true);
			mailSender.send(message);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void auth(HttpServletRequest request,String email) {
		HttpSession session = request.getSession();
		String userid = email;
		String userkey = rand();
		session.setAttribute(userid, userkey);
		String body = "<h2>안녕하세요</h2>"
				+ "<h3>"+userid+" 님</h3>"
				+"<p>인증하기 버튼을 누르면 로그인 됩니다</p>"
				+"<a href='http://localhost:8086"
				+request.getContextPath()+"/auth_check?email="
				+userid+"&userkey="+userkey+"'>인증하기</a>";
		
		//보낼사람 제목 내용
		sendMail(userid, "이메일인증", body);
				
	}
	
	//인증키 공장
	private String rand() {
		Random ran = new Random();
		String str="";
		int num;
		while(str.length() != 20) {
			//0-74 + 78 (숫자, 소문자, 대문자 범위)
			num = ran.nextInt(75)+48 ;
			if((num >=48 && num<= 57) ||
					(num >= 65 && num <= 90)|| (num>=97 && num<=122)) {
				str+=(char)num;
			}else {
				continue;
			}
		}
		return str;
	}
	
	public void verify(String email) {
		dao.verifyEmail(email);		
	}
	
	
}
