<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	//String userId = (String)session.getAttribute("userId");
%>
<%
	String userId = "1";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>핫디즈 :: hoThiz</title>

<style type="text/css">
.thumbnail{
	height: 30%;
	width: 30%;

}


</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
	<script type="text/javascript">
		//세션 email을 값으로 보내줘야 함.

		function MyFavoritProject(project_id) {
			console.log("좋아요 자바스크립트 실행")
			if (<%=userId%> == null) {
				location.href = "/fund" //이거 로그인창으로 바꾸셈**//////////////////////
			}

			var id = project_id;

			//console.log($("#btn224").val());

			var likeDto = {
				project_id : project_id,
				member_email :<%=userId%>
			};

			console.log(likeDto.project_id);
			console.log(likeDto.member_email);

			$.ajax({
				type : 'POST',
				url : '/fund/discover/like',
				data : likeDto,
				success : function(data) { //통신 성공시 호출됨,,msg를 담자.
					//data.msg = like 혹은 cancelLike 들음.

					console.log("성공요");

					var like_img = '';

					alert(data);
					console.log(data);

					if (data == '"cancelLike"') { //좋아요 취소함
						//like_img = "images/cancelLike.png"
						$("#likeBtn" + id).html("좋아요 누르기!")

					} else { //좋아요 함
						//like_img = "images/like.png"
						$("#likeBtn" + id).html("좋아요 이미 누름")
					}

				},
				error : function() {
					alert("실패!");
				}

			});

		}

function MyAlarmProject(project_id) {
		alert("알림신청 할거임")

			if (<%=userId%> == "") {
				location.href = "/fund" //이거 로그인창으로 바꾸셈**
			}

			var id = project_id;
			var alarmDto = {
				project_id : project_id,
				member_email : <%=userId%>
		     };

			console.log(alarmDto.project_id);
			console.log(alarmDto.member_email);

			$.ajax({
				type : 'POST',
				url : '/fund/discover/alarm',
				data : alarmDto,
				success : function(data) { //통신 성공시 호출됨,,msg를 담자.
					//data = alarm // cancelAlarm

					console.log("성공요");

					//var like_img = '';

					alert(data);
					console.log(data);

					if (data == '"cancelAlarm"') { //좋아요 취소함
						//like_img = "images/cancelLike.png"
						$("#notiBtn" + id).html("알림신청하기")

					} else { //좋아요 함
						//like_img = "images/like.png"
						$("#notiBtn" + id).html("알림신청완료")
					}

				},
				error : function() {
					alert("실패!");
				}

			});

		}
	</script>

	<%@ include file="../default/main_header.jsp"%>


	
	<form action="/fund/discover" method="GET">
		<input type="search" name="query"> <input type="submit" />
	</form>


	총 게시글 :...
	<br>
	<!--  <a href="discover/${pj.project_id}">
		<img class="thumbnail" src="project/${pj.project_id}.jpg"></a>
		<a href="discover/${pj.project_id }">${pj.project_title }</a>
		<br>
	메인: ${pj.project_main_category }<br> | 
	서브: ${pj.project_sub_category }<br>
	${pj.project_current_donated }원 / ${pj.project_current_percent}%-->
	
<c:forEach var="prj" items="${firstList}">

<c:set var="chk" value="${dDayMap[prj.project_id].chk}"/>
 <h2>${prj.project_id}번 게시물 일수: ${chk}</h2>
	
<!-- 프리런칭 아닌 경우의 뷰. 이걸 구별해주기 위해 dao에서 뽑아내서 음수인 경우->프리런칭 / 아니면 온고윙으로 구분. -->
	<c:if test="${chk >= '0' and param.ongoing ne 'prelaunching' }">
	
		<div class="col-md-2 column productbox" style="position:relative;">
					<a href="${prj.project_id}">	
						<img src="/fund/resources/project/${prj.project_id}.jpg" class="img-responsive"></a>
						<div class="producttitle">
						<a href="discover/${prj.project_id}"><h3>${prj.project_title}</h3></a></div>
						<div class="productprice">
							${prj.project_sub_category } | 
							<c:forEach var="mem" items="${memberList}">
								<c:if test="${prj.member_email eq mem.member_email}">
									${mem.member_name}
								</c:if>
							</c:forEach>
							<div class="pull-right">
								<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
							</div>
							<div class="pricetext">${prj.project_summary }</div>
							
							
						${pj.project_current_donated }원 / ${prj.project_current_percent}%
						
						<h2><c:out value="${dDayMap[prj.project_id].d_day}"/>일 남음</h2>

						</div>
						
				</div>	
		
			<c:set var="msg" value="좋아요 누르기!" />
			<!-- 이부분은 나중에 이미지로 바꿀것. -->

			<!-- 만약 세션의 아이디가 가진 like목록에 해당 pj가 존재하면 좋아요 눌렀음으로 표시해야함. -->
			<c:forEach var="likeId" items="${lOAList}">
				${projectId}

				<c:if test="${likeId eq prj.project_id}">
					<c:set var="msg" value="좋아요 이미 누름!" />
				</c:if>
			</c:forEach>


			<!-- 좋아요 버튼 출력 -->
			<button class="button small" id="likeBtn" onClick="MyFavoritProject('${prj.project_id}')">
				<p id="likeBtn${prj.project_id}">${msg}</p>
			</button>
		</c:if>




<!-- ///////////////////////////////////공개예정인 경우. 알림신청으로 나타나야함///////////////////////// -->
	<c:if test="${chk < '0' and param.ongoing eq 'prelaunching'}">
		<div class="col-md-2 column productbox" style="position:relative;">
					<a href="/discover/${prj.project_id}?ongoing=prelaunching">	
						<img src="/fund/resources/project/${prj.project_id}.jpg" class="img-responsive"></a>
						<div class="producttitle">
						<a href="/discover/${prj.project_id}?ongoing=prelaunching"><h3>${prj.project_title}</h3></a></div>
						<div class="productprice">
							${prj.project_sub_category } | 
							<c:forEach var="mem" items="${memberList}">
								<c:if test="${prj.member_email eq mem.member_email}">
									${mem.member_name}
								</c:if>
							</c:forEach>
							<div class="pull-right">
								<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
							</div>
							<div class="pricetext">${prj.project_summary }</div>
						</div>
		</div>
			<h2><c:out value="${dDayMap[prj.project_id].prelaunching_day}"/>일 남음</h2>

		
			<c:set var="msg" value="알림신청" />
			<c:forEach var="alarmId" items="${lOAList}">
			 
				<c:if test="${alarmId eq prj.project_id}">
					<c:set var="msg" value="알림신청했음" />
				</c:if>
			</c:forEach>


			<button id="notificationBtn" onClick="MyAlarmProject('${prj.project_id}')">
				<p id="notiBtn${prj.project_id}">${msg}</p>
			</button>
		</c:if>




	</c:forEach>






	<div id="scrollContent"></div>



	<script>
		let page = 0;
		//document의 height : 전체 스크롤 길이
		//window의 height: 스크롤 바의 길이
		//window의 scrollTop: 내려온 스크롤 길이(스크롤 바 기준으로 위쪽 공간)
		function infiniteScroll() {
			console.log("인피니트 진입")
			//만약 전체 스크롤-10보다 내려온 스크롤이 크면(밑바닥에 거의 닿으면)
			if ($(document).height() - 30 <= $(window).height()
					+ $(window).scrollTop()) {
				page += 1;
				//list객체에서 page값을 1 올려준다. 

				let params = "?page=" + page;
				//param += ${param.cat1egory} ->이렇게 하면 안돼ㅜ

				//파라미터값이 존재할때만 params에 붇혀줌(ajax로 url에 묻혀줄 변수임)
				if ("${param.category}" != '') {
					params += "&category=${param.category}";
				}
				if ("${param.ongoing}!" != '') {
					params += "&ongoing=${param.ongoing}";
				}
				if ("${param.sort}!" != '') {
					params += "&sort=${param.sort}";
				}
				if ("${param.maxAchieveRate}" != '') {
					params += "&maxAchieveRate=${param.maxAchieveRate}";
				}
				if ("${param.minAchieveRate}" != '') {
					params += "&minAchieveRate=${param.minAchieveRate}";
				}if ("${param.query}!" != '') {
					params += "&query=${param.query}";
				}

				console.log(params);

				//비동기 실행
				$.ajax({
					type : 'GET',
					url : '/fund/discover/getData' + params,
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						let html = ""
						$.each(data, function(index, item) {
							html += "<b>프로젝트넘버 : </b>" + item.project_id
									+ "<br>";
							html += "<b>메인카테고리: </b>"
									+ item.project_main_category + "<br>";
							html += "<b>서브카테고리: </b>"
									+ item.project_sub_category + "<br>";
							html += "<b>좋아요:</b>" + item.project_like + "<br>";
							html += "<b>달성률:</b>"
									+ item.project_current_percent + "<br>";
						});
						$("#scrollContent").append(html);

					}//success func 
					,
					error : function() {
						alert("문제발생");
					}

				});//ajax 실행

			}
		}//infiniteScroll함수

		$(document).ready(function() {
			$(window).scroll(infiniteScroll)
		});
	</script>




</body>
</html>