<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>제목 나중에 if문처리</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>

<c:forEach var="pj" items="${firstList}">

${pj.project_title }<br>
${pj.project_summary }<br>
${pj.project_current_donated }/${project_current_percent}
${pj.project_main_category }
${pj.project_sub_category }
<hr>
</c:forEach>



<div id="scrollContent">
내용쓰
</div>


<script>

var page = 0;


	//document의 height : 전체 스크롤 길이
	//window의 height: 스크롤 바의 길이
	//window의 scrollTop: 내려온 스크롤 길이(스크롤 바 기준으로 위쪽 공간)
	function infiniteScroll(){
		console.log("인피니트 진입")
		//만약 전체 스크롤-10보다 내려온 스크롤이 크면(밑바닥에 거의 닿으면)
		if($(document).height()-30<=$(window).height()+$(window).scrollTop()){
			page +=1;
			//list객체에서 page값을 1 올려준다. 
			
			var params = "?page="+page;
			//param += ${param.category} ->이렇게 하면 안돼ㅜ
				params += "&category=${param.category}";
			
				console.log(params);
		
				
			//비동기 실행
			$.ajax({
				type: 'GET',
				url : '/fund/discover/getData'+params,
				contentType : "application/json; charset=utf-8",
				success : function(data){
					let html=""
						$.each(data, function(index, item){
							html += "<b>프로젝트넘버 : </b>"+item.project_id+"<br>";
							html += "<b>메인카테고리: </b>" +item.project_main_category+"<br>";
							html += "<b>서브카테고리: </b>" +item.project_sub_category+"<br>";
							html += "<b>제목 : </b>" +item.project_title+"<br>";
						});
						$("#scrollContent").append(html);
						
				}//success func 
				,
				error : function(){
					alert("문제발생");
				}
				
			});//ajax 실행
			

			
		}
	}//infiniteScroll함수
	
	$(document).ready(function(){
		$(window).scroll(infiniteScroll)
	});
	
</script>




</body>
</html>