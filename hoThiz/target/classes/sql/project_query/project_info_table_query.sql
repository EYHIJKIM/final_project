insert into project_info (
	project_id,title,content,savedate,idgroup,step,indent

	)
values(project_info_seq.nextval,#{id},#{title},#{content},sysdate,mvc_board_seq.currval,0,0)




//페이징 셀렉문
뽑아내는게 3가지로 나뉨


SELECT B.*
FROM (SELECT rownum rn, A.* 
		FROM (select * from test order by project_id desc) A 
	 )B 
WHERE rn between #{startRownum} and #{endRownum}


)

