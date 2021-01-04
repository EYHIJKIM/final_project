package com.hothiz.fund.project.scheduler;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.hothiz.fund.project.dao.ProjectDAO;

import com.hothiz.fund.project.dto.ProjectInfoDTO;


public class ProjectSchedulerService {

	@Autowired
	ProjectDAO dao;

	
	
	
	//세션으로 user가 어떤 프로젝트 알림신청 했는지 확인
	//프로젝트 id를 뽑아와서-> 해당 프로젝트의 release_date를 sysdate와 비교.
	
	//1.프로젝트 id, release_date, 배열 뽑아옴.
	
	//2.
	
	/*
	 지금은 알림보내는 스케쥴러 해볼거다. 한시간에 한번씩 실행.
	 
	 우선 멤버, 프로젝트 두 부분을 생각해 봐야함.
	 
	 if(지금날짜+시간<=release_date){
	 	1.프리런칭 체크가 1인 애들의 릴리즈 데이트를 꺼내보고 비교.만약 같거나 
	 	2.이 project_id를 알림한 멤버에게 메시지를 보내는 메소드 실행.
	 		->이거 아마 메시지 디비로 넣으면 될거같다.
	 	
	 	2.
	 	
	 	}
	 
	 */
	
	@Scheduled(cron="*/2 * * * * *")
	public void updateAlarmMessage() throws ParseException {
		System.out.println("실행되는중!");
		System.out.println(dao);
		ArrayList<ProjectInfoDTO> prjList = dao.getPreProjectList(); 
		
		
		System.out.println(prjList);
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmm");
		Date time = new Date();
		
		String sysdate =  format.format(time);
		Date relDate = null;
		
		
		//dtd랑 sysdate를 비교할거임
			for(ProjectInfoDTO dto : prjList) {
				System.out.println(dto.getProject_date_string());	
				relDate = format.parse(dto.getProject_date_string());
				if(time.getTime()<=relDate.getTime()) { //릴리즈날짜랑 같거나, 작으면-->시간 된거임.
					System.out.println("알림 메시지를 db에 넣자");
				}		
				
			}
		
		} 
			
		
		
	
	
	
	
	
	
	
	
	
}
