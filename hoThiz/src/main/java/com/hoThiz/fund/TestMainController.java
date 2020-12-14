package com.hothiz.fund;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hothiz.fund.project.service.ProjectServiceImpl;

public class TestMainController {

	@Autowired
	ProjectServiceImpl ps;
	
	

	
}
