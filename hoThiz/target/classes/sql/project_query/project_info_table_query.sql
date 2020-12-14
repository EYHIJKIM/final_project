insert into project_info (
	project_id,title,content,savedate,idgroup,step,indent
	
	
	
	)
values(project_info_seq.nextval,#{id},#{title},#{content},sysdate,mvc_board_seq.currval,0,0)



