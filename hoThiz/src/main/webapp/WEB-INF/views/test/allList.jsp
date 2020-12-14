<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function test(){
	
	$.ajax({
		type : "GET",
		url : "test",
		success : function(list){
			console.log("성공")
			
			let html=""
			$.each(list, function(index, item){
				html += "<b>아이디 : </b>"+item.project_id+"<br>";
				html += "<b>나이 : </b>" +item.member_name+"<br>";
				html += "<b>제목 : </b>" +item.project_title+"<br>";
				html += "<b>내용 : </b>" +item.project_content+"<br><hr>";
			});
			$("#result").html(html);
		},
		
		error : function(){
			alert("get문제 발생");
		}
		
	});
	
	
}



</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="result">안뇽</div>

</body>
</html>