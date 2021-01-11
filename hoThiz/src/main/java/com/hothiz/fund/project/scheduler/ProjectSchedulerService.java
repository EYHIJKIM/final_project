package com.hothiz.fund.project.scheduler;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_messageDTO;
import com.hothiz.fund.project.dao.ProjectDAO;

import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectParamDTO;

@Component
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
	
	@Scheduled(cron="0 0 0/1 * * *")
	public void updateAlarmMessage() throws ParseException { //알림 메시지 보내기.
	
		//공개예정 프로젝트들
		ArrayList<ProjectInfoDTO> prjList = dao.getPreProjectList(); 
		Member_messageDTO msgDto = null;

		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmm");
		Date time = new Date();
		
		String sysdate =  format.format(time);
		Date relDate = null;
		
		
		//dtd랑 sysdate를 비교할거임
			for(ProjectInfoDTO dto : prjList) {
				relDate = format.parse(dto.getProject_date_string());
				
				
				msgDto = new Member_messageDTO(); //
				
				msgDto.setMessage_send_member("admin");
				msgDto.setMessage_type("기타");
				
				String project_title = dto.getProject_title();
				int project_id = dto.getProject_id();
				String message_content = "알림신청하신 '"+project_title+"'의 펀딩이 시작되었습니다!"
						+"<br><a href=\"/fund/discover/"+project_id+"\">바로가기</a>";
				msgDto.setMessage_content(message_content);
				
				
				  { //릴리즈날짜랑 같거나, 작으면-->시간 된거임.
						
					
					//해당 프로젝트의 id를 가져와서, 이걸 알림한 유저들을 뽑아오는 dao 실행.
					ArrayList<String> memList = dao.getMemberListBeAlarmed(dto.getProject_id());
					
					for(String email:memList) {
						msgDto.setMessage_receive_member(email);
						msgDto.setMember_email("admin");
						dao.sendMessage(msgDto);
						
					}
					
					
					
				}		
				
			}
		
		} 
			
		
		/*
	@Scheduled(cron="0 0 0/1 * * *")
	public void updateProjectStatus(){
		
		ProjectParamDTO paramDto = new ProjectParamDTO();
		paramDto.setOngoing("ongoing");
		
		//진행중인 프로젝트의 상황을 체크해서 넣을거임.
		//즉 파라미터는 온고윙정도???
		
		ArrayList<ProjectInfoDTO> prjList = dao.getParamProjectList(paramDto, pageDto)
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmm");
		Date time = new Date();
		String sysdate =  format.format(time);
		Date deadLine = null;
		
		for(ProjectInfoDTO dto : prjList) {
			deadLine = format.parse(dto.getProject_date_string());
		}
		
		
		
	}*/
	
	
	
	
	
	
	
	
}
