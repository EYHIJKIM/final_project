package com.hothiz.fund.project.dao;

public class ProjectSQL {
	
/*
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
					  ) sort
ELSE ''
END
					
 CASE WHEN #{param.ongoing} !='none' THEN
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
					
CASE WHEN #{param.achieveRate} != 'none' THEN
			(SELECT achieve.* FROM(			
				SELECT * FROM project_info WHERE project_current_percent BETWEEN #{param.maxAchieveRate} AND #{param.minAchieveRate}
			) achieve


					
					
*/
	
	
}
