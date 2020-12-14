<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="assets/js/jquery.min.js"></script>
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


</head>
<body>

<h2>test입니다</h2>
<input type="button" onclick="test()" value="db리스트 가져오깅"/>
<br>
<span id="result">흠냐뤼</span>

</body>
</html>