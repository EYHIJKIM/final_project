<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"
             integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
             crossorigin="anonymous"></script>
<title>무한스크롤 페이징</title>
</head>
<body>
<div id="result">content</div>


	
<script>
	
	var locatedPage=0
	console.log(locatedPage);
	//document의 height : 전체 스크롤 길이
	//window의 height: 스크롤 바의 길이
	//window의 scrollTop: 내려온 스크롤 길이(스크롤 바 기준으로 위쪽 공간)
	function infiniteScroll(){
		
		//만약 전체 스크롤-10보다 내려온 스크롤이 크면(밑바닥에 거의 닿으면)
		if($(document).height()-10<=$(window).height()+$(window).scrollTop()){
			
			//list객체에서 page값을 1 올려준다.
			locatedPage++;
			
			
			//비동기 실행
			$.ajax({
				type: 'GET',
				url : '/test/getData?locatedPage='+locatedPage,
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
						$("#result").html(html);
					
				}
				
				
			})
			
			append("<hr>")
			
		}
	}

	$(document).ready(function(){
		$(window).scroll(infiniteScroll)
	});
	
	
	
</script>

</body>
</html>