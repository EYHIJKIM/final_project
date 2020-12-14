<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무한스크롤 페이징</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
<c:forEach var="list" items="${list}">
	프로젝트 번호 : ${list.project_id}<br>
	제목 : ${list.project_title}<br>
	글쓴이 : ${list.member_name}<br>
	<hr>
</c:forEach>

<div id="scrollContent">
	왜안나와
</div>




	
<script>
var page = 0;
	//document의 height : 전체 스크롤 길이
	//window의 height: 스크롤 바의 길이
	//window의 scrollTop: 내려온 스크롤 길이(스크롤 바 기준으로 위쪽 공간)
	function infiniteScroll(){
		console.log("인피니트 진입")
		//만약 전체 스크롤-10보다 내려온 스크롤이 크면(밑바닥에 거의 닿으면)
		if($(document).height()-50<=$(window).height()+$(window).scrollTop()){
			console.log(page);
			page +=1;
			//list객체에서 page값을 1 올려준다.
			
			//비동기 실행
			$.ajax({
				type: 'GET',
				url : 'getData?locatedPage='+page,
				contentType : "application/json",
				success : function(data){
					console.log("성공");
					console.log(data);
					let html=""
						$.each(data, function(index, item){
							html += "<b>프로젝트넘버 : </b>"+item.project_id+"<br>";
							html += "<b>아이디 : </b>" +item.member_name+"<br>";
							html += "<b>제목 : </b>" +item.project_title+"<br>";
						});
						$("#scrollContent").append(html);
						
				}//success func
				
				
			});//ajax 실행
			

			
		}
	}
	
	$(document).ready(function(){
		$(window).scroll(infiniteScroll)
	});
	
</script>


</body>
</html>