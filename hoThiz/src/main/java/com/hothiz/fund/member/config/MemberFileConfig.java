package com.hothiz.fund.member.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class MemberFileConfig {
	  @Bean
	   public CommonsMultipartResolver multipartResolver() {
	      CommonsMultipartResolver mr = new CommonsMultipartResolver();
	      mr.setMaxUploadSize(52428800);
	      mr.setMaxInMemorySize(1000000);
	      mr.setDefaultEncoding("utf-8");
	      return mr;
	   }
	  
	 
}
