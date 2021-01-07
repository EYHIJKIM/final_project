package com.hothiz.fund.member.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

	@Bean
	public static JavaMailSender mailSender() {
		
		JavaMailSenderImpl jms = new JavaMailSenderImpl();
		
		jms.setHost("smtp.gmail.com");
		
		jms.setPort(587);
		
		//지메일아이디
		jms.setUsername("");
		
		//지메일비밀번호
		jms.setPassword("");
		
		
		Properties prop = new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");
		prop.setProperty("mail.smtp.starttls.enable", "true");
		jms.setJavaMailProperties(prop);
		return jms;
	}
}
