insert into project_info (
	project_id,title,content,savedate,idgroup,step,indent
	
	
	
	)
values(project_info_seq.nextval,#{id},#{title},#{content},sysdate,mvc_board_seq.currval,0,0)




//페이징 처리문


//A 테이블은 내림차순 나열. 여기에 rownum을 붙여서 뽑아냄
(select * from test order by project_id desc) A

SELECT B.*
FROM (SELECT rownum rn, A.* 
		FROM (select * from test order by project_id desc) A 
	 )B 
WHERE rn between #{startRownum} and #{endRownum}


)

