<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%//String userId = (String)session.getAttribute("userId"); %>
<%String userId = "1"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>제목 나중에 if문처리</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
<script type="text/javascript">

//세션 email을 값으로 보내줘야 함.

let likeFlag = true;

 function MyFavoritProject(project_id){
	 
	 var id = project_id;
	 
	 //console.log($("#btn224").val());

	
	 var likeDto = {
			 project_id : project_id,
			 member_email : <%=userId%>
			 
	 };
	
	 console.log(likeDto.project_id);
	 console.log(likeDto.member_email);
	 


		 $.ajax({
				type: 'POST',
				url : '/fund/discover/like',
				data : likeDto,
				success : function(data){ //통신 성공시 호출됨,,msg를 담자.
					//data.msg = like 혹은 cancelLike 들음.
					
					console.log("성공요");
					
					var like_img = '';

										
					alert(data);	
					console.log(data);
					
					if(data == '"cancelLike"'){ //좋아요 취소함
						//like_img = "images/cancelLike.png"
						$("#btn"+id).html("좋아요 눌렀다!")
						
					} else{ //좋아요 함
						//like_img = "images/like.png"
						$("#btn"+id).html("좋아요 이미 누름")
					}
				
					},
				error: function(){
					alert("실패!");
				}
					
			});
	 
 }


</script>


<c:forEach var="pj" items="${firstList}">

<a href="discover/${pj.project_id }">${pj.project_title }</a><br>
메인: ${pj.project_main_category }<br>
서브: ${pj.project_sub_category }<br>
달성률:${pj.project_current_percent}<br>
좋아요:${pj.project_like}<br>

<button id="likeBtn" onClick="MyFavoritProject('${pj.project_id}')">
	<p id="btn${pj.project_id}" value="의 값">좋아욘</p>
</button>
<hr>
</c:forEach>



<div id="scrollContent">
내용쓰
</div>


<script>

let page = 0;


	//document의 height : 전체 스크롤 길이
	//window의 height: 스크롤 바의 길이
	//window의 scrollTop: 내려온 스크롤 길이(스크롤 바 기준으로 위쪽 공간)
	function infiniteScroll(){
		console.log("인피니트 진입")
		//만약 전체 스크롤-10보다 내려온 스크롤이 크면(밑바닥에 거의 닿으면)
		if($(document).height()-30<=$(window).height()+$(window).scrollTop()){
			page +=1;
			//list객체에서 page값을 1 올려준다. 
			
			let params = "?page="+page;
			//param += ${param.cat1egory} ->이렇게 하면 안돼ㅜ
			
			//파라미터값이 존재할때만 params에 붇혀줌(ajax로 url에 묻혀줄 변수임)
			if("${param.category}"!=''){params += "&category=${param.category}";}
			if("${param.ongoing}!"!=''){params += "&ongoing=${param.ongoing}";}
			if("${param.sort}!"!=''){params += "&sort=${param.sort}";}
			if("${param.maxAchieveRate}"!=''){params += "&maxAchieveRate=${param.maxAchieveRate}";}
			if("${param.minAchieveRate}"!=''){params += "&minAchieveRate=${param.minAchieveRate}";}
			
	
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
							html += "<b>좋아요:</b>" + item.project_like+"<br>";
							html += "<b>달성률:</b>" + item.project_current_percent+"<br>";
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