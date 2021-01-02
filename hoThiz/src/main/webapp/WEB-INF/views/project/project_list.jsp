<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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

</head>
<body>

<%@ include file="../default/project/project_list_header.jsp" %>
	



	총 게시글 :...
	<form action="/fund/discover" method="GET">
		<input type="search" name="query"> <input type="submit" />
	</form>
	<br>
	<!--  <a href="discover/${pj.project_id}">
		<img class="thumbnail" src="project/${pj.project_id}.jpg"></a>
		<a href="discover/${pj.project_id }">${pj.project_title }</a>
		<br>
	메인: ${pj.project_main_category }<br> | 
	서브: ${pj.project_sub_category }<br>
	${pj.project_current_donated }원 / ${pj.project_current_percent}%-->
<c:if test="${param.ongoing eq null}">
	<c:set var="state" value="ongoing"/>
</c:if>
<c:if test="${param.ongoing ne null}">
	<c:set var="state" value="${param.ongoing}"></c:set>
</c:if>


ongoing : ${state}


<c:forEach var="prj" items="${firstList}">
${prj.project_id} 번 프리런치 상태: ${prj.project_prelaunching_check}<br>
	<c:choose>
		<c:when test="${state eq 'ongoing'}">
			<c:if test="${dDayMap[prj.project_id].d_day >='0' and dDayMap[prj.project_id].chk >='0'}">
				
				
				
				${prj.project_id }는 진행중입니다. <br>
				<a href="/fund/discover/${prj.project_id}"><h3>${prj.project_title }</h3></a>
				${prj.project_summary}<br>
				d_day : ${dDayMap[prj.project_id].d_day}<br>
				chk : ${dDayMap[prj.project_id].chk}<br>
				${prj.project_sub_category } | 

										<c:forEach var="mem" items="${memberList}">
											<c:if test="${prj.member_email eq mem.member_email}">
												${mem.member_name}
											</c:if>
										</c:forEach>

	
			  <c:set var="msg" value="좋아요 누르기!" />
				
				<c:forEach var="likeId" items="${likeOrAlarmList}">
					<c:if test="${likeId eq prj.project_id}">
						<c:set var="msg" value="좋아요 이미 누름!" />
					</c:if>
				</c:forEach>
	
	
			
				<button class="button small" id="likeBtn" onClick="MyFavoritProject('${prj.project_id}')">
					<p id="likeBtn${prj.project_id}">${msg}</p>
				</button>
				
				<hr>
			</c:if>
		</c:when>
<%--  
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
			--%>



<%-- ///////////////////////////////////공개예정인 경우. 알림신청으로 나타나야함///////////////////////// --%>

	<c:when test="${state eq 'prelaunching' and prj.project_prelaunching_check eq '1'}">
		
			<h2>공개예정인 경우</h2>
				
				${prj.project_id }는 공개예정입니다. <br>
				d_day : ${dDayMap[prj.project_id].d_day}<br>
				chk : ${dDayMap[prj.project_id].chk}<br>
				${prj.project_sub_category } | 
										<c:forEach var="mem" items="${memberList}">
											<c:if test="${prj.member_email eq mem.member_email}">
												${mem.member_name}
											</c:if>
										</c:forEach>
			
			<%-- 
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
			</div>--%>
	
	
				<c:set var="msg" value="알림신청" />
				<c:forEach var="alarmId" items="${likeOrAlarmList}">
				 
					<c:if test="${alarmId eq prj.project_id}">
						<c:set var="msg" value="알림신청했음" />
					</c:if>
				</c:forEach>
	
	
				<button id="notificationBtn" onClick="MyAlarmProject('${prj.project_id}')">
					<p id="notiBtn${prj.project_id}">${msg}</p>
				</button>
				

		</c:when>

		
	
	<c:when test="${state eq 'confirm'}">
			<h2>끝난 프로젝트 입니다</h2>
		
				d_day : ${dDayMap[prj.project_id].d_day}<br>
				chk : ${dDayMap[prj.project_id].chk}<br>
				${prj.project_sub_category } | 
										<c:forEach var="mem" items="${memberList}">
											<c:if test="${prj.member_email eq mem.member_email}">
												${mem.member_name}
											</c:if>
										</c:forEach>

	</c:when>
</c:choose>

</c:forEach>



	<div id="scrollContent"></div>
	
	
	
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/fund/resources/myjsFunction/projectFunction.js"></script>
<script>



  let page = 0;
  
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

			if (urlParam('category') != null) {
				params += "&category="+urlParam('category');
			}
			if (urlParam('ongoing') != null) {
				params += "&ongoing="+urlParam('ongoing');
			}
			if (urlParam('sort') != null) {
				params += "&sort="+urlParam('sort');
			}if (urlParam('maxAchieveRate') != null) {
				params += "&maxAchieveRate="+urlParam('maxAchieveRate');
			} if (urlParam('minAchieveRate') != null) {
				params += "&minAchieveRate="+urlParam('minAchieveRate');
			}if (urlParam('query') != null) {
				params += "&query="+urlParam('query');
			
			}if (urlParam('currentMoney') != null) {
				params += "&currentMoney="+urlParam('currentMoney');
			}
			if (urlParam('achieveRate') != null) {
				params += "&achieveRate="+urlParam('achieveRate');
			}
			
			
			
			console.log("붙여줄 파람값:");
			

			//비동기 실행
			//여기서 보내줘야할것...은...필요한거 똑같이 보내줘야됨. if문도 걸어줘야 됨.(prelaunchig or not?)
			$.ajax({
				type : 'GET',
				url : '/fund/discover/getData' + params,
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					let html = ""
					
					//console.log(data["likeOrAlarm"]);
					//console.log(data["prj"]);
					//console.log(data["day"]);
					//console.log(data["member"]);
					var state = '${state}' ; //파라미터 상태
					
					$.each(data["prj"], function(index, proj) { //i배열이 들어온다.
						
						html += '<c:set var="projId" value="'+proj.project_id+'"/>'
						html += "<div class='aProject'>";
						html += proj.project_id;
						html += "<img src='proj.project_main_image'><br>";
						html += '<a href="/fund/discover/"'+proj.project_id+'>'+proj.project_title+'</a>';
						html += proj.project_sub_category+"|";
						$.each(data["member"],function(index, mem){
							if(mem.member_email == proj.member_email){
								html += mem.member_name+"<br>";
							}
						});
						html += proj.project_current_percent+"퍼 달성";
						if(state == 'ongoing'){
							
							var msg ="좋아요 누르기!";
							$.each(data['likeOrAlarm'],function(index,like){//project id가 들어있는 리스트
								if(like==proj.project_id){
									console.log(like);
									msg = "좋아요 이미 누름";
								} 
							});
							
							html +='<button class=\"button small\" id=\"likeBtn\" onClick=\"MyFavoritProject(\'${projId}\')\" >';
							html +=	'<p id="likeBtn'+proj.project_id+'">'+msg+' </p> </button>';
							html += "<br><hr></div>";
							
						} else if(state=='prelaunching'){
							var msg ="알림신청하기!";
							$.each(data['likeOrAlarm'],function(index,alarm){//project id가 들어있는 리스트
								if(alarm==proj.project_id){
									console.log(alarm);
									msg = "알림신청됨";
								} 
							});
							
							html +='<button class=\"button small\" id=\"notificationBtn\" onClick=\"MyAlarmProject(\'${projId}\')\" >';
							html +=	'<p id="notiBtn'+proj.project_id+'">'+msg+' </p> </button>';
							html += "<br><hr></div>";

							
						} else if(state=='confirm'){
							
						}

								
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