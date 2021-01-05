package com.hothiz.fund.project.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_alarmDTO;
import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.member.dto.Member_messageDTO;
import com.hothiz.fund.project.dto.ProjectParamDTO;
import com.hothiz.fund.project.dto.ProjectStateDTO;
import com.hothiz.fund.project.dto.ProjectAlarmCountDTO;
import com.hothiz.fund.project.dto.ProjectDateDTO;
import com.hothiz.fund.project.dto.ProjectGiftDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;


@Repository
public interface ProjectDAO {
	
	//////////////////////스케줄러 실행//////////////////////
	@Select("select member_email from member_alarm where project_id = #{project_id}")
	public ArrayList<String> getMemberListBeAlarmed(int project_id);
	
	@Insert("INSERT INTO message value(member_email,message_type,message_content,message_send_member,message_receive_member,message_date)"
			+ "values(#{member_email},#{message_type},#{message_content},#{message_send_member},#{message_receive_member},sysdate)")
	public void sendAlarmToMember(Member_messageDTO msgDto);
	
	
	//////////////////////////////////////////////
	
	///////////////////////게시글 하나 뽑아냄/////////////////////////
	@Select("SELECT * FROM project_info WHERE project_id = #{project_id}")
	public ProjectInfoDTO getAProject(int project_id);
	
	///모든 게시글을 셀 것/////////////
	@Select("SELECT count(*) from project_info")
	public int getAllProjectCnt();
	
	//날짜를 스트링 타입으로 가져오자
	@Select("select project_id,to_char(project_release_date,'yyyyMMddHHmm') as project_date_string from project_info where project_prelaunching_check=1")
	public ArrayList<ProjectInfoDTO> getPreProjectList();
	
	////////////////////게시글 gift_list 뽑아옴
	@Select("SELECT * FROM project_gift_list WHERE project_id=#{project_id} ORDER BY gift_id asc")
	public ArrayList<ProjectGiftDTO> getAProjectGift(int project_id);
	
	//gift id 리스트임
	@Select("SELECT gift_id FROM project_gift_list WHERE project_id=#{project_id} ")
	public ArrayList<Integer> getAProjectGiftId(int project_id);
	
	
	///////////////////이런 프젝 어떠세요??
	@Select("SELECT B.* FROM(SELECT rownum rn, A.* FROM project_info A WHERE project_sub_category = #{project_sub_category} "
			+ " AND (project_deadline > project_release_date) AND (project_release_date < sysdate ) )B"
			+ " WHERE rn between 1 and 4 ")
	public ArrayList<ProjectInfoDTO> getMoreProject(String project_sub_category);
	
	
	//메인에 랜덤 4개..
	@Select("SELECT * FROM project_info where project_id in (10,20,30) order by project_id asc")
	public ArrayList<ProjectInfoDTO> getBannerProject();
	
	
	
	///////////////////////////////게시글 목록 뽑아냄////////////////////////////////////////////////
	
	//1.페이징 프로젝트
	@Select("SELECT B.*" + 
			" FROM (SELECT rownum rn, A.*" + 
					" FROM (select * from project_info order by project_id desc) A" + 
			") B" + 
			" WHERE rn between #{startRownum} and #{endRownum}")
	public ArrayList<ProjectInfoDTO> getProjectList(ProjectPagingDTO dto);

	
	//모든 프로젝트 정보 비교
	@Select("SELECT * FROM project_info")
	public ArrayList<ProjectInfoDTO> getAllProjectList();
	
	

//////////////////////////////////////**파라미터 조건으로 게시글 목록 뽑아내기//////////////////////////////////	

@Select("SELECT complete.* " + 
		"FROM (" + 
		"    SELECT rownum rn, condition.* " + 
		"    FROM( " + 
		"            SELECT sort.* FROM( " + 
		"                SELECT * " + 
		"                FROM project_info " + 
		"                ORDER BY  " + 
		"                    case when #{param.sort} = 'publishedAt' THEN project_id " + 
		"                         when #{param.sort} = 'popular' THEN project_like " + 
		"                         when #{param.sort} = 'amount' THEN project_current_donated " + 
		"                    END desc, " + 
		"                    case when #{param.sort} = 'endedAt' THEN project_deadline end asc " + 
		"            ) sort  " + 
		"     )condition " + 
		"     WHERE (  " + 
		"              case WHEN #{param.ongoing} = 'prelaunching' then sysdate " + 
		"                   WHEN #{param.ongoing} = 'ongoing' THEN project_release_date " + 
		"                   WHEN #{param.ongoing} = 'confirm' THEN project_release_date " + 
		"                   WHEN #{param.ongoing} = 'none' THEN sysdate " + 
		"              END < " + 
		"                case when #{param.ongoing} = 'prelaunching' THEN project_release_date " + 
		"                     when #{param.ongoing} = 'ongoing' THEN sysdate " + 
		"                     when #{param.ongoing} = 'confirm' THEN project_deadline " + 
		"                     when #{param.ongoing} = 'none' THEN sysdate+1 " + 
		"                END  " + 
		"             AND " + 
		"              case when #{param.ongoing} = 'prelaunching' then project_release_date " + 
		"                   WHEN #{param.ongoing} = 'ongoing' THEN sysdate " + 
		"                   WHEN #{param.ongoing} = 'confirm' THEN project_deadline " + 
		"                   WHEN #{param.ongoing} = 'none' THEN sysdate " + 
		"                END < " + 
		"              CASE WHEN #{param.ongoing} = 'prelaunching' then project_deadline " + 
		"                   WHEN #{param.ongoing} = 'ongoing' THEN project_deadline " + 
		"                   WHEN #{param.ongoing} = 'confirm' THEN sysdate " + 
		"                   WHEN #{param.ongoing} = 'none' THEN sysdate+1 " + 
		"              END "+
					 "AND"
					  +" CASE WHEN #{param.ongoing}='confirm' THEN project_current_donated "
					  +" ELSE 2 "
					  +" END >"
					  +" CASE WHEN #{param.ongoing}='confirm' THEN project_target_price"
					  +" ELSE 1 "
					  + " END" + 			
					  " ) AND " + 
		"                 project_current_donated BETWEEN #{param.minMoney} and  " + 
		"                 CASE WHEN #{param.currentMoney}=5 or (#{param.currentMoney}=0 and #{param.maxMoney}=0) THEN (select max(project_current_donated) from project_info) " + 
		"                      ELSE #{param.maxMoney}" + 
		"                 END " +
"					  AND  project_current_percent BETWEEN #{param.minAchieveRate} and " + 
	"                 	  case when #{param.achieveRate}=3 or (#{param.achieveRate}=0 and #{param.maxAchieveRate}=0) THEN (select max(project_current_percent) from project_info)" + 
	"                     ELSE #{param.maxAchieveRate} " + 
	"                 END"+
					
	"             AND  " + 
	"                (project_main_category LIKE " + 
	"                    CASE WHEN #{param.category}='none' then '%' " + 
	"                         ELSE #{param.category} " + 
	"                         END " + 
	"                 OR " + 
	"                 project_sub_category LIKE " + 
	"                    CASE WHEN #{param.category}='none' then '%' " + 
	"                         ELSE #{param.category} " + 
	"                         END " + 
	"                )"+
" 			AND ( " + 
"                    project_title LIKE '%' || " + 
"                    CASE WHEN #{param.query}='none' THEN '%' " + 
"                    ELSE #{param.query} END ||'%' " + 
"                    " + 
"                    OR project_summary LIKE '%' || " + 
"                    CASE WHEN #{param.query}='none' THEN '%' " + 
"                    ELSE #{param.query} END ||'%' " + 
"              " + 
"                    OR project_tag LIKE '%' || " + 
"                    CASE WHEN #{param.query}='none' THEN '%' " + 
"                    ELSE #{param.query} END ||'%' " + 
"                )"+
		") complete "+
		"WHERE rn BETWEEN #{page.startRownum} AND #{page.endRownum}")
public ArrayList<ProjectInfoDTO> getParamProjectList(@Param("param") ProjectParamDTO paramDto, @Param("page") ProjectPagingDTO pageDto);
			

@Select("SELECT count(*) " + 
		"FROM (" + 
		"    SELECT rownum rn, condition.* " + 
		"    FROM( " + 
		"            SELECT sort.* FROM( " + 
		"                SELECT * " + 
		"                FROM project_info " + 
		"                ORDER BY  " + 
		"                    case when #{param.sort} = 'publishedAt' THEN project_id " + 
		"                         when #{param.sort} = 'popular' THEN project_like " + 
		"                         when #{param.sort} = 'amount' THEN project_current_donated " + 
		"                    END desc, " + 
		"                    case when #{param.sort} = 'endedAt' THEN project_deadline end asc " + 
		"            ) sort  " + 
		"     )condition " + 
		"     WHERE (  " + 
		"              case WHEN #{param.ongoing} = 'prelaunching' then sysdate " + 
		"                   WHEN #{param.ongoing} = 'ongoing' THEN project_release_date " + 
		"                   WHEN #{param.ongoing} = 'confirm' THEN project_release_date " + 
		"              END < " + 
		"                case when #{param.ongoing} = 'prelaunching' THEN project_release_date " + 
		"                     when #{param.ongoing} = 'ongoing' THEN sysdate " + 
		"                     when #{param.ongoing} = 'confirm' THEN project_deadline " + 
		"                END  " + 
		"             AND " + 
		"              case when #{param.ongoing} = 'prelaunching' then project_release_date " + 
		"                   WHEN #{param.ongoing} = 'ongoing' THEN sysdate " + 
		"                   WHEN #{param.ongoing} = 'confirm' THEN project_deadline " + 
		"                END < " + 
		"              CASE WHEN #{param.ongoing} = 'prelaunching' then project_deadline " + 
		"                   WHEN #{param.ongoing} = 'ongoing' THEN project_deadline " + 
		"                   WHEN #{param.ongoing} = 'confirm' THEN sysdate " + 
		"              END "+
					 "AND"
					  +" CASE WHEN #{param.ongoing}='confirm' THEN project_current_donated "
					  +" ELSE 2 "
					  +" END >"
					  +" CASE WHEN #{param.ongoing}='confirm' THEN project_target_price"
					  +" ELSE 1 "
					  + " END" + 			
					  " ) AND " + 
		"                 project_current_donated BETWEEN #{param.minMoney} and  " + 
		"                 CASE WHEN #{param.currentMoney}=5 or (#{param.currentMoney}=0 and #{param.maxMoney}=0) THEN (select max(project_current_donated) from project_info) " + 
		"                      ELSE #{param.maxMoney}" + 
		"                 END " +
"					  AND  project_current_percent BETWEEN #{param.minAchieveRate} and " + 
	"                 	  case when #{param.achieveRate}=3 or (#{param.achieveRate}=0 and #{param.maxAchieveRate}=0) THEN (select max(project_current_percent) from project_info)" + 
	"                     ELSE #{param.maxAchieveRate} " + 
	"                 END"+
					
	"             AND  " + 
	"                (project_main_category LIKE " + 
	"                    CASE WHEN #{param.category}='none' then '%' " + 
	"                         ELSE #{param.category} " + 
	"                         END " + 
	"                 OR " + 
	"                 project_sub_category LIKE " + 
	"                    CASE WHEN #{param.category}='none' then '%' " + 
	"                         ELSE #{param.category} " + 
	"                         END " + 
	"                )"+
" 			AND ( " + 
"                    project_title LIKE '%' || " + 
"                    CASE WHEN #{param.query}='none' THEN '%' " + 
"                    ELSE #{param.query} END ||'%' " + 
"                    " + 
"                    OR project_summary LIKE '%' || " + 
"                    CASE WHEN #{param.query}='none' THEN '%' " + 
"                    ELSE #{param.query} END ||'%' " + 
"              " + 
"                    OR project_tag LIKE '%' || " + 
"                    CASE WHEN #{param.query}='none' THEN '%' " + 
"                    ELSE #{param.query} END ||'%' " + 
"                ) AND project_check=2"+
		") complete ")
public int getProjectsCnt(@Param("param") ProjectParamDTO paramDto);		

@Select("SELECT count(*) from project_info where project_prelaunching_check=1 and sysdate < project_release_date")
public int getPreProjectsCnt();

	//7. 검색해서 게시글 뽑기
/*
   impl딴에서 null 혹은 "" 일 때 문자열 none을 넣었음.
   
	   만약 쿼리가 없는경우는 -> 바로 sort 쿼리문으로 가고
	   쿼리가 있는 경우는 -> search 메소드로 간다. 쿼리가 먼저이므로..
   
   	쿼리가 있는데 소트는 없음 -> 
						소트 없이 처리
쿼리랑 ongoing은 함께갈 수 없음. 즉 쿼리가 논-> ongoing 확인

 쿼리가 존재하면 -> 카테고리  존재 여부 확인  카테고리 존재 -> 소트 존재 여부 확인
 					           
 					                        카테고리 없으면 -> 소트 존재 여부 
 					                        
 					                 우선...시발..쿼리  
 if 쿼리가 있음-> A테이블에 where로 쿼리문을 붙여야 한다.
 if 카테고리가 있음-> A테이블에 where로 쿼리문을 붙여야 한다.
 
 IF SORT가 있으면 테이블 뽑아낸다.
 if achieveRate가 있으면 조건을 걸어서 테이블을 뽑아낸다. -> 하위
 if currentMoney가 있으면 조건을 걸어서 테이블을 뽑아낸다. -> 하위
 if ongoing이 있으면 
 		onging 이 뭔지 반별해서 테이블을 뽑아내야 한다. -> 하위
 
1. 온고윙+소트+어치브+쿼렌트  => 소트랑 온고윙으로 교집합 JOIN..?
CASE WHEN 온고윙 있으면
 	SELECT ONGOING.* FROM (
 		CASE WHEN 온고윙="머시기"..
 			(select ~~~`)
 			when 온고윙="머시기"
 			...
 		END
 	) 	

 		
 		
 		

즉 4개의 테이블을 뽑아내야 할수도 있음...
 		
 		우선 페이징땜에 CON1테이블은 필수로 존재. 여기는 조건을 걸 필요가 없음. 즉 CON1안에서부터 조건을 걸면 될듯.
 		
 		ONGOING, CURRENTMONEY, SORT, ACHIEVERATE가 존재하면..?
 		
 셀렉 COMPLETE.* FROM(
 	
 	
 	1. ONGOING, SORT, CURRENT ACHIEVERATE가 모두 존
 	
 	셀렉 CON1.*(
 		IF(ONGOING!=NONE){ //ongoing이 존재함
 			소트 테이블로부터 ONGING 조건 뽑아냄.
 			IF(소트 존재함){
 			 	소트 뽑아냄
 			 	ACHIEVE 테이블로부터 소트조건 뽑아냄.
 			 	IF(CURRENT 있음){
 			 		ACHIEVE테이블로부터 CURRENT 조건 뽀ㅃ아냄.
 			 		IF(ACHIEVE 있음){
 			 			
 			 			ACHIEVE 테이블 뽑아냄.
 			 		} ELSE{ 어치브 없음
 			 			CURRENT부터 뽑아내야함.			 		
 			 		}
		 	
 			 	}ELSE{ CURRENT없음
 			 		
 			 	
 			 	}
 			}
 		}ELSE{
 		
 		}
 			) ELSE{소트없음
 				
 			
 			}
 		   
 		   
 		} ELSE{
 		
 		}
 	
 	
 	)CON1	
 
 
 ) COMPLETE
 
 where 30개씩
 
 
 /////////////온고윙 으로 뽑아내기
 CASE WHEN #{param.sort} !='none' THEN
 	SELECT sort.* FROM(
		 CASE WHEN #{param.ongoing} !='none' THEN
		 	CASE WHEN #{param.sort} = 'popular' THEN 
		 				(select * from ongoing WHERE ongoing.project_like >= 50 ORDER BY project_id desc)
				  WHEN #{param.sort} = 'endedAt' THEN
						 		(select * from ongoing 
						   		 where (ongoing.project_current_percent BETWEEN #{param.minAchieveRate} AND #{param.maxAchieveRate}))
				  WHEN #{param.sort} = 'publishedAt' THEN
					 			(select * from project_info ORDER BY project_id desc)
				  WHEN #{param.sort} = 'amount' THEN
					 		 	(select * from project_info ORDER BY project_current_donated desc)
				) sort	 	
					 	
					 	
					 	
					 	
						 	(SELECT ongoing.* FROM(
						 			CASE WHEN #{param.ongoing} = 'ongoing' THEN
						 					(SELECT * FROM project_info WHERE to_date(sysdate, 'YYYYMMDD') < project_deadline)
						 				 WHEN #{param.ongoing} = 'confirm'
							 				(SELECT * FROM project_info WHERE project_current_percent >= 100 
							 					AND to_date(sysdate, 'YYYYMMDD') > project_deadline)
						 				 WHEN #{param.ongoing} = 'prelanching' THEN
						 				 	(select * from project_info WHERE (project_reg_date < project_release_date))
						 			END	 	
						 	) ongoing )
		 ELSE
		 
		 
		 END
 
 		
 
 
 SELECT B.* FROM(
 	SELECT rownum rn, A.*
 	FROM (
 		sort가 존재할경우에만 아래 C를 뽑아낼것 //sort 없으면..??
 		CASE WHEN #{param.sort} != 'none' THEN 
			(SELECT sort.* 
					 FROM ( 
					 	CASE WHEN #{param.sort} = 'popular' THEN 
					 			(select * from project_info WHERE project_like >= 50 ORDER BY project_id desc)
					 		 WHEN #{param.sort} = 'endedAt' THEN
						 		(select * from project_info 
						   		 where (project_current_percent BETWEEN #{param.minAchieveRate} AND #{param.maxAchieveRate}) 
						   		 ORDER BY project_id desc)
					 		 WHEN #{param.sort} = 'publishedAt' THEN
					 			(select * from project_info ORDER BY project_id desc)
					 		 WHEN #{param.sort} = 'amount' THEN
					 		 	(select * from project_info ORDER BY project_current_donated desc)
					 		END
					  ) sort
		 	 WHERE (
		 	 CASE WHEN #{param.category} != 'none' THEN 
		 	 	(project_title LIKE CONCAT('%'|| #{param.query},'%') OR project_summary LIKE CONCAT('%'|| #{param.query},'%') ) 
		 	 		AND category=#{param.category}			
		 	 	)
		 	 ELSE
		 	 
		 	  	project_title LIKE CONCAT('%'|| #{param.query},'%') OR project_summary LIKE CONCAT('%'|| #{param.query},'%')
						  				
			)
						  				
		   ) A
		 	 	
 ) B
 
 
 	
 
WHERE rn between #{page.startRownum} and #{page.endRownum}					
					
					
					
			
WHERE rn between #{page.startRownum} and #{page.endRownum}
  
소트 존재하면
 CASE WHEN #{param.sort} != 'none' THEN 
 		
 		CASE WHEN #{param.category} != 'none' THEN 
					
				CASE WHEN #{param.sort} = 'popular' THEN 
					(SELECT C.* 
					 FROM ( select * from project_info WHERE project_like >= 50 ORDER BY project_id desc) C
 					 WHERE category=#{param.category}
					  		AND (project_title LIKE CONCAT('%'|| #{param.query},'%')
					  				OR project_summary LIKE CONCAT('%'|| #{param.query},'%') )
					) 

			    
					  WHEN #{param.sort} = 'endedAt' THEN
					  (SELECT C.*
					   FROM (select * from project_info 
					   		 where (project_current_percent BETWEEN #{param.minAchieveRate} AND #{param.maxAchieveRate}) 
					   		 ORDER BY project_id desc) C
					   WHERE category=#{param.category}
					  		AND (project_title LIKE CONCAT('%'|| #{param.query},'%')
					  				OR project_summary LIKE CONCAT('%'|| #{param.query},'%') )
					  )  
					 
			    
			    	  WHEN #{param.sort} = 'publishedAt' THEN
					  (SELECT C.*
					   FROM (select * from project_info ORDER BY project_id desc) C
					   WHERE category=#{param.category}
					  		AND (project_title LIKE CONCAT('%'|| #{param.query},'%')
					  				OR project_summary LIKE CONCAT('%'|| #{param.query},'%') )
					 )	  
					  
				
					 WHEN #{param.sort} = 'amount' THEN
					  (SELECT C.*
					   FROM (select * from project_info ORDER BY project_current_donated desc) C
					   WHERE category=#{param.category}
					  		AND (project_title LIKE CONCAT('%'|| #{param.query},'%')
					  				OR project_summary LIKE CONCAT('%'|| #{param.query},'%') )
					)  
				END
				
		
 		ELSE 
 			 
				CASE WHEN #{param.sort} = 'popular' THEN 
					(SELECT C.* 
					 FROM ( select * from project_info WHERE project_like >= 50 ORDER BY project_id desc) C
 					 WHERE project_title LIKE CONCAT('%'|| #{param.query},'%')
					  				OR project_summary LIKE CONCAT('%'|| #{param.query},'%')
					)	  

			    
					  WHEN #{param.sort} = 'endedAt' THEN
					  (SELECT C.*
					   FROM (select * from project_info 
					   		 where (project_current_percent BETWEEN #{param.minAchieveRate} AND #{param.maxAchieveRate}) 
					   		 ORDER BY project_id desc) C
					   WHERE project_title LIKE CONCAT('%'|| #{param.query},'%')
					  				OR project_summary LIKE CONCAT('%'|| #{param.query},'%')
					  )  
					 
			    
			    	  WHEN #{param.sort} = 'publishedAt' THEN
					  (SELECT C.*
					   FROM (select * from project_info ORDER BY project_id desc) C
					   WHERE project_title LIKE CONCAT('%'|| #{param.query},'%')
					  				OR project_summary LIKE CONCAT('%'|| #{param.query},'%')
					 )	  
					  
				
					 WHEN #{param.sort} = 'amount' THEN
					  (SELECT C.*
					   FROM (select * from project_info ORDER BY project_current_donated desc) C
					   WHERE project_title LIKE CONCAT('%'|| #{param.query},'%')
					  				OR project_summary LIKE CONCAT('%',#{param.query},'%') 
					  )
 		
 		END

 ELSE
		CASE WHEN #{param.category} != 'none' THEN
		   (SELECT * FROM project_info 
		   	WHERE category = #{param.category} 
		   		AND (project_title LIKE CONCAT('%'|| #{param.query},'%')
							OR project_summary LIKE CONCAT('%'|| #{param.query},'%'))
		   )
		   
		   
		ELSE (SELECT * from project_info WHERE (project_title LIKE CONCAT('%'|| #{param.query},'%')
							OR project_summary LIKE CONCAT('%'|| #{param.query},'%')))
		END
 END
 
 WHERE project_title LIKE CONCAT('%',#{param.keyword},'%')
OR project_summary LIKE CONCAT('%',#{param.keyword},'%')) A
   	  
   	  WHEN 
   	  WHEN
   	  
   	  
 SELECT *
   
   
   
 */


	/////////////////////////////////////////////////////////////////////////////
			
			
			
	//테스트용으로 프젝에 값넣은거
	@Insert("insert into project_info" + 
			" value(project_id,member_email,project_title,project_summary,"
				+ "project_target_price,project_like,project_current_percent,"
				+ "project_main_category,project_sub_category)" + 
			" values(project_info_seq.nextval,#{member_email},#{project_title},#{project_summary},#{project_target_price},#{project_like},#{project_current_percent},#{project_main_category},#{project_sub_category})")
	public void setProjectInfo(ProjectInfoDTO dto);
	
	
	///////////////////////////////좋아요 로직
	
	
	
	//좋아요 누르면 게시판의 좋아요 올라감.
	@Update("UPDATE project_info SET project_like = project_like+1 WHERE project_id=#{project_id}")
	public void setLikeProject(int project_id);
	
	//좋아요 누르면 삽입.
	@Insert("INSERT INTO member_like value(project_id,member_email) values(#{project_id},#{member_email})")
	public void setLikeMember(Member_likeDTO likeDto);
	
	
	
	
	//게시판 좋아요를 취소하고
	@Update("UPDATE project_info SET project_like = project_like-1 WHERE project_id=#{project_id}")
	public void setCancelLikeProject(int project_id);
	
	//멤버 좋아요에서 삭제함
	@Update("DELETE FROM member_like where project_id=#{project_id} AND member_email=#{member_email}")
	public void setCancelLikeMember(Member_likeDTO likeDto);
	
	
	//멤버가 그 게시글을 좋아요 했는지 여부
	@Select("SELECT COUNT(*) FROM member_like where member_email =#{member_email} AND project_id=#{project_id}")
	public int chkMemberLike(Member_likeDTO likeDto);
	
	//해당 유저의 좋아요 프로젝트 리스트
	@Select("SELECT project_id from member_like where member_email = #{userId}")
	public ArrayList<Integer> getLikeProjectList(String userId);
	
	
	//////////////알림신청///////////////////
	
	//알림신청 했는지의 여부
	@Select("SELECT COUNT(*) FROM member_alarm where member_email=#{member_email} AND project_id=#{project_id}")
	public int chkMemberAlarm(Member_alarmDTO alarmDto);
		
	
	//버튼 누르면 알림신청
	@Insert("INSERT INTO member_alarm value(project_id,member_email) values(#{project_id},#{member_email})")
	public void setAlarm(Member_alarmDTO alarmDto);	
	
	
	//알림 취소
	@Delete("DELETE FROM member_alarm where project_id=#{project_id} AND member_email=#{member_email}")
	public void setCancelAlarm(Member_alarmDTO alarmDto);

	//해당 유저의 알림프젝 리스트
	@Select("SELECT project_id from member_alarm where member_email = #{userId}")
	public ArrayList<Integer> getAlarmProjectList(String userId);

	
	//알림신청 몇명?
	@Select("SELECT COUNT(*) FROM member_alarm where project_id=#{project_id} ")
	public int getAlarmMemCount(int project_id);
	
	//알림신청 몇명??리스트로->메인에서보여줘야됨.
	@Select("SELECT project_id, count(*) AS \"count\" from member_alarm group by project_id ")
	public ArrayList<ProjectAlarmCountDTO> getAlarmCountList();
	
	
//////////////////멤버정보 뽑아옴////////////////////////////////	
@Select("SELECT * FROM member_info")
public ArrayList<MemberDTO> getMemberInfoList();
	
@Select("SELECT * FROM member_info WHERE member_email=#{member_email}")
public MemberDTO getAMemberInfo(String member_email);
	
@Select("SELECT COUNT(*) FROM member_donated_project WHERE project_id = #{project_id}")
public int getDonatedMemberCnt(int project_id);

//confirm인 경우에 줄거임.
@Select("select project_id, count(*) AS \"count\" from member_donated_project group by project_id")
public ArrayList<ProjectAlarmCountDTO> getDonatedCntList();


	
///////////////////날짜차이 뽑아주기//////////////////////////////
@Select("select project_id, to_number(to_date(project_deadline,'yyyy-MM-DD')-to_date(sysdate,'yyyy-MM-DD')) AS \"d_day\" "
		+ ", to_number(to_date(sysdate,'yyyy-MM-DD')-to_date(project_release_date,'yyyy-MM-DD')) AS \"chk\" " + 
		"" +
				" from project_info")
public ArrayList<ProjectDateDTO> getDDayList();


//프리런칭한 경우 언제 진행되는지 뽑음 or 공개하는 경우는 날짜 얼마나 남았는지 (dday)
@Select("SELECT project_id, to_char(project_release_date,'yyyy\"년 \" MM\"월\" DD\"일\" HH\"시\" MI\"분\" \"공개예정\" ') AS \"prelaunching_day\" " + 
		", to_number(to_date(project_deadline,'yyyy-MM-DD')-to_date(sysdate,'yyyy-MM-DD')) AS \"d_day\" " +
		", to_number(to_date(sysdate,'yyyy-MM-DD')-to_date(project_release_date,'yyyy-MM-DD')) AS \"chk\" " +
		"" +
		" FROM project_info WHERE project_id = #{project_id}")
public ProjectDateDTO getADDay(int project_id);


	
	

	@Insert("insert into member_info"
	         + " value(member_email,member_pwd,member_name,member_profile_pic,member_phnum,member_addr,member_URL,member_admin,member_email_verify)"
	         + " values(#{member_email},#{member_pwd},#{member_name},0,#{member_phnum},#{member_addr},#{member_URL},0,0)")
	public void insertMember(MemberDTO dto);
	
@Update("update project_info set project_main_image = #{img} where project_id=#{project_id}")
public void updateProject1(@Param("project_id") int project_id, @Param("img") String img);

	
@Update("update project_info set project_deadline = to_date('2021-01-12','YY-MM-DD') where project_id=#{project_id}")
public void updateProject2(int project_id);

	

@Update("update project_info set project_release_date = to_date('2021-01-11','YY-MM-DD') where project_id=#{project_id}")
public void updateProject3(int project_id);



	


	
	
	

	
	
}
