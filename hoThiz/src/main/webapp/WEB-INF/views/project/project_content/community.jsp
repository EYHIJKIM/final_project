<%@ page language="java" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>hoThiz :: 핫디즈</title>

  <!-- Bootstrap core CSS -->
  <link href="/fund/resources/vendor2/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/fund/resources/css/blog-post.css" rel="stylesheet">
<style type="text/css">

.likeBtn{
    border: none;
    outline:none;
    background-color: white;
    margin-top: 0;
    padding-top: 0;
}

.img-fluid rounded{
float:left;
}


.bigLetter{
	font-size: 3em;


}

.batch{
	float:left;
}

.form-group{
	width: 	50%;
	height:auto;
}

</style>
</head>

<body onload="setTag()">

  <!-- Navigation ${sessionScope.userId}-->
<%@include file="/WEB-INF/views/member/default/main_header.jsp" %>



<c:set var="path" value="/fund/resources/img/project/community/" />
<c:set var="mem" value="${memberInfo}"/>
<c:set var="prj" value="${projectInfo}" />
<c:set var="day" value="${dDayInfo}"/>
<c:set var="userId" value="1"/>


  <!-- Page Content -->
  <div class="container">

    <div class="row">
	<c:if test="${day.chk>='0' and day.d_day>'0'}"><%--진행중인 경우 --%>
      <!-- Post Content Column -->
      <div class="col-lg-8">
		<button class="btn btn-default" onclick="location.href='/fund/discover?category=${prj.project_sub_category}'">
		
		<div id="subCategory">${prj.project_sub_category}</div>
		</button>
        <!-- Title -->
        <h1 class="mt-4">${prj.project_title}</h1>

        <!-- Author -->
        <p class="lead">
			<img class="d-flex mr-3 rounded-circle" width="30px" width="30px" src="${path}/${mem.member_email}/${mem.member_profile_pic}"> &nbsp;
          <a href="/fund/member_info/${member_URL}">${mem.member_name}</a>
        </p>


        <hr>

        <!-- Preview Image -->

        	<img class="img-fluid rounded" src="${path}/project/title/${mem.member_email}/${prj.project_id}/${prj.project_main_image}" >
		<hr>
		
	
			<div class="textBox">
					<p>
						모인금액<br>
						<span class="bigLetter">${prj.project_current_donated}</span>원 <font style="font-weight: bold">${prj.project_current_percent}%</font><br>
					</p>
					<p>
						남은시간<br>
						<span class="bigLetter">${day.d_day}</span>일<br>
					</p>
					<p>
						후원자<br>
						<span class="bigLetter">${donatedMemberCnt}</span>원 <br>
					</p>
			</div>
	
		<blockquote class="blockquote">
          <p class="mb-0">펀딩 진행중
          <footer class="blockquote-footer">
          <p>목표 금액인 ${prj.project_target_price } 원이 모여야만 결제됩니다.
				<br>결제는 ${prj.project_date_string}에 다함께 진행됩니다.</p>
          </footer>
        </blockquote>	
			
			<%--좋아요 버튼 --%>
			<c:set var="flag" value="false" />
	                <c:forEach var="likeId" items="${likeList}">
						<c:if test="${likeId eq prj.project_id}">
							<c:set var="flag" value="true" />
						</c:if>		
					</c:forEach>
					
					
		<c:if test="${flag}">
			<button id="likeBtn${prj.project_id}" class="likeBtn" onClick="MyFavoritProject('${prj.project_id}')">
				<img class="likeImg" src="/fund/resources/img/fullHeart.png">
			</button>
				
		</c:if>
		<c:if test="${not flag}">
			<button id="likeBtn${prj.project_id}" class="likeBtn" onClick="MyFavoritProject('${prj.project_id}')">
				<img class="likeImg" src="/fund/resources/img/blankHeart.png">
			</button>		
		</c:if>
		
		
			<%----------------- --%>
		<button id="pushPrj" class="btn btn-secondary my-2 my-sm-0">프로젝트 밀어주기</button>
		<button class="kakao-link-btn" onclick="sendLink('${prj.project_id}')"><img src="https://lh3.googleusercontent.com/proxy/ix0Cqx6lj7RSmqnBc1zTkJD0F3iSgrLMbFbHwoG4R3mSO_Jf1faNynQffrRcdROFvglg_gMzXaWgkg9FpAsE7OFbcR1r9i27lOLS1DHL_fARwN2lQNWQ0rucBS4FtTR622uB078DQolYRKTPM69Suwo" width="32px" height="32px"></button>
		
        <hr>
        <a href="/fund/discover/${prj.project_id}">스토리</a>
        <a href="/fund/discover/${prj.project_id}/community">커뮤니티</a>
        <a href="/fund/discover/${prj.project_id}/notice">펀딩</a>
        <hr>
		
	
		
        <!-- Post Content -->
        
        <%------------------------------------------------------------------------------------ --%>
        
        <c:set var="replyFlag" value="false"/>
        <%--후원한 멤버 목록에 있다면 댓글쓰기가 가능하도록. --%>
        <c:forEach var="done" items="${donatedMemList}">
        	<c:if test="${userId eq done}">
        		<c:set var="replyFlag" value="true" />
        	</c:if>
        </c:forEach>     
        
        
        <c:set var="writeFlag" value="false" />
        <%-- 프로젝트 글쓴이와 세션이 같으면 글쓰기 버튼 보이게. --%>
        <c:if test="${userId eq mem.member_email}">
        	<c:set var="writeFlag" value="true" />
        </c:if>
  

 
        <c:if test="${writeFlag}" >
				<button type="button" onClick="location.href='/fund/writeForm?project_id=${prj.project_id}'">글쓰기</button>
		</c:if>
        

       <c:forEach var="brd" items="${boardList}">
               <div class="card my-4">
          <h5 class="card-header">No.${brd.bno}  ${brd.member_name} | ${brd.dateFormat}</h5>
          <div class="card-body">
			${brd.content}<br><br>
			<div id="reply${brd.bno}">
				<button class="btn btn-secondary my-2 my-sm-0"  onclick="getReply('${brd.bno}','${prj.project_id}')">댓글 보기</button>
			</div>
			
		 </div>
	
		</div>
		<hr>
	</c:forEach><%----------------------------------게시글임---------------------------------------------- --%>


        <hr>


      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

   

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">창작자 소개</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">Web Design</a>
                  </li>
                  <li>
                    <a href="#">HTML</a>
                  </li>
                  <li>
                    <a href="#">Freebies</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">JavaScript</a>
                  </li>
                  <li>
                    <a href="#">CSS</a>
                  </li>
                  <li>
                    <a href="#">Tutorials</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">선물 선택</h5>
          <div class="card-body">
          
<div id="giftForm">

		<div class="aGift">
			<button style="width:100%;height:auto" class="btn btn-default hiddenBtn0" onclick="showOrView(0)"><h3>1,000원+</h3> 선물을 선택하지 않고 밀어만 줍니다</button>
					<div style="width:100%;margin:1.8em;"></div>
					<div class="hiddenList" id="gift0" style="display:none;">
						추가 후원금(선택)<br> 
						<input type="text" id="input0" maxlength="16" oninput="numSet(this,0)"><br>
						<span class="blockquote-footer">더 후원해주시면 프로젝트 성사가 앞당겨집니다.</span>
						<div style="width:100%;margin:0.2em;"></div>
						<button class="btn btn-default" id="5000" onclick="plusMoney(this,0,1000)" >+ 5천원</button>
						<button class="btn btn-default" id="10000" onclick="plusMoney(this,0,1000)" >+ 1만원</button>
						<button class="btn btn-default" id="50000" onclick="plusMoney(this,0,1000)" >+ 5만원</button>
						<button class="btn btn-default" id="100000" onclick="plusMoney(this,0,1000)" >+ 10만원</button><br>
						<div style="width:100%;margin:1.8em;"></div>
						<button class="btn btn-secondary my-2 my-sm-0" id="payMoney0" onclick="pay(0,1000)">1000원 밀어주기</button>
					</div>
		</div>
		<hr>
		
	
			<c:forEach var="gift" items="${projectGift}" varStatus="status">
			
				<div class="aGift">
					<button style="width:100%;height:auto" class="btn btn-default hiddenBtn${gift.gift_id}" onClick="showOrView('${gift.gift_id}')" >
						<h3>${gift.price}원+</h3>${gift.gift}
					</button>
					<div style="width:100%;margin:1.8em;"></div>
					<div class="hiddenList" id="gift${gift.gift_id}" style="display:none;">
						추가 후원금(선택)<br>
						<input type="text" id="input${gift.gift_id}" maxlength="16" oninput="numSet(this,'${gift.price}')"><br>
						<span class="blockquote-footer">더 후원해주시면 프로젝트 성사가 앞당겨집니다.</span>
						<div style="width:100%;margin:0.2em;"></div>
						<button class="btn btn-default" id="5000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5천원</button>
						<button class="btn btn-default" id="10000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 1만원</button>
						<button class="btn btn-default" id="50000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5만원</button>
						<button class="btn btn-default" id="100000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 10만원</button><br>
						<div style="width:100%;margin:1.8em;"></div>
						<button class="btn btn-secondary my-2 my-sm-0" id="payMoney${gift.gift_id}" onclick="pay('${gift.gift_id}','${gift.price}')">${gift.price}원 밀어주기</button>
					</div>	
				<hr>
				</div>
				
				
			</c:forEach>
	
	</div>
	
	
	
	
	
          </div>
        </div>

      </div>

</c:if>
    
    
<%--공개예정 --%>
<c:if test="${day.chk<'0' and day.d_day>'0' and prj.project_prelaunching_check eq '1'}">
	 <!-- Post Content Column -->
      <div class="col-lg-8">
		<button class="btn btn-default">
		<a href="/fund/discover?category=${prj.project_sub_category}">
		<div id="subCategory">${prj.project_sub_category}</div></a></button>
        <!-- Title -->
        <h1 class="mt-4">${prj.project_title}</h1>

        <!-- Author -->
        <p class="lead">

          <a href="#멤버프로필로 고">
			<img src="${path}/member/${mem.member_email}.jpg" width="50px" height="50px"></a> &nbsp;
		
          <a href="#">${mem.member_name}</a>
        </p>
        <!-- Preview Image -->

        	<img class="img-fluid rounded" src="${path}/project/${prj.project_main_image}" alt="">
		<hr>
		${prj.project_summary}
	
	<p class="launchingDay" style="color:red;">${day.prelaunching_day}</p>
	
	<%--이거 알람 나타나는거 자바 스크립트로 띄우셈...안그러면 잘 안됨.. --%>

			 
	
		
				<c:forEach var="alarmId" items="${alarmList}">
					<c:choose>
						<c:when test="${alarmId eq prj.project_id}">
							<c:set var="msg" value="알림신청완료" />
						</c:when>
						<c:otherwise>
							<c:set var="msg" value="알림신청" />
						</c:otherwise>
					</c:choose>
				</c:forEach>

		
				<button class="btn btn-secondary my-2 my-sm-0" id="notificationBtn" onClick="MyAlarmProject('${prj.project_id}','${alarmMemberCnt}')">
					<p id="notiBtn${prj.project_id}">${msg}</p>
				</button>
<button class="kakao-link-btn" onclick="sendLink()">카톡 공유</button>
<hr>
</c:if><%--공개예정 뷰 --%>












<c:if test="${day.d_day<='0'}">
	
	  <!-- Post Content Column -->
      <div class="col-lg-8">
		<button class="btn btn-default">
		<a href="/fund/discover?category=${prj.project_sub_category}">
		<div id="subCategory">${prj.project_sub_category}</div></a></button>
        <!-- Title -->
        <h1 class="mt-4">${prj.project_title}</h1>

        <!-- Author -->
        <p class="lead">

          <a href="#멤버프로필로 고">
			<img src="${path}/member/${mem.member_email}.jpg" width="50px" height="50px"></a> &nbsp;
		
          <a href="#">${mem.member_name}</a>
        </p>


        <hr>

        <!-- Preview Image -->

        	<img class="img-fluid rounded" src="${path}/project/${prj.project_main_image}" alt="">
		<hr>
		
	
			<div class="textBox">
					<p>
						모인금액<br>
						<span class="bigLetter">${prj.project_current_donated}</span>원 <font style="font-weight: bold">${prj.project_current_percent}%</font><br>
					</p>
					<p>
						남은시간<br>
						<span class="bigLetter">${day.chk}</span>일<br>
					</p>
					<p>
						후원자<br>
						<span class="bigLetter">${donatedMemberCnt}</span>원 <br>
					</p>
			</div>
	
	
		<blockquote class="blockquote">
          <p class="mb-0">펀딩 진행중
          <footer class="blockquote-footer">
          <p>목표 금액인 ${prj.project_target_price } 원이 모여야만 결제됩니다.
				<br>결제는 ${prj.project_date_string }에 다함께 진행됩니다.</p>
          </footer>
        </blockquote>	
			
			<%--좋아요 버튼 --%>
			<c:set var="flag" value="false" />
	                <c:forEach var="likeId" items="${likeList}">
						<c:if test="${likeId eq prj.project_id}">
							<c:set var="flag" value="true" />
						</c:if>		
					</c:forEach>
					
					
		<c:if test="${flag}">
			<button id="likeBtn${prj.project_id}" class="likeBtn" onClick="MyFavoritProject('${prj.project_id}')">
				<img class="likeImg" src="/fund/resources/img/fullHeart.png">
			</button>
				
		</c:if>
		<c:if test="${not flag}">
			<button id="likeBtn${prj.project_id}" class="likeBtn" onClick="MyFavoritProject('${prj.project_id}')">
				<img class="likeImg" src="/fund/resources/img/blankHeart.png">
			</button>		
		</c:if>
		
		
			<%----------------- --%>
		<button id="pushPrj" class="btn btn-secondary my-2 my-sm-0" style="'style:opacity:0.5" disabled>밀어주기가 마감되었습니다</button>
		<button class="kakao-link-btn" onclick="sendLink('${prj.project_id}')">카톡 공유</button>
		
        <hr>

        <!-- Post Content -->
        <p class="lead">
        ${prj.project_video}
        
        ${prj.project_story}
        
        </p>

        <hr>

      

        <!-- Comment with nested comments -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

          </div>
        </div>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

   

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">창작자 소개</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">Web Design</a>
                  </li>
                  <li>
                    <a href="#">HTML</a>
                  </li>
                  <li>
                    <a href="#">Freebies</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">JavaScript</a>
                  </li>
                  <li>
                    <a href="#">CSS</a>
                  </li>
                  <li>
                    <a href="#">Tutorials</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">선물 선택</h5>
          <div class="card-body">
          
<div id="giftForm">

		<div class="aGift">
			<button style="width:100%;height:auto" class="btn btn-default hiddenBtn0" disabled onclick="showOrView(0)"><h3>1,000원+</h3> 선물을 선택하지 않고 밀어만 줍니다</button>
					<div style="width:100%;margin:1.8em;"></div>
					<div class="hiddenList" id="gift0" style="display:none;">
						추가 후원금(선택)<br> 
						<input type="text" id="input0" maxlength="16" oninput="numSet(this,0)"><br>
						<span class="blockquote-footer">더 후원해주시면 프로젝트 성사가 앞당겨집니다.</span>
						<div style="width:100%;margin:0.2em;"></div>
						<button class="btn btn-default" id="5000" onclick="plusMoney(this,0,1000)" >+ 5천원</button>
						<button class="btn btn-default" id="10000" onclick="plusMoney(this,0,1000)" >+ 1만원</button>
						<button class="btn btn-default" id="50000" onclick="plusMoney(this,0,1000)" >+ 5만원</button>
						<button class="btn btn-default" id="100000" onclick="plusMoney(this,0,1000)" >+ 10만원</button><br>
						<div style="width:100%;margin:1.8em;"></div>
						<button class="btn btn-secondary my-2 my-sm-0" id="payMoney0" onclick="pay(0,1000)">1000원 밀어주기</button>
					</div>
		</div>
		<hr>
		
	
			<c:forEach var="gift" items="${projectGift}" varStatus="status">
			
				<div class="aGift">
					<button disabled style="width:100%;height:auto" class="btn btn-default hiddenBtn${gift.gift_id}" onClick="showOrView('${gift.gift_id}')" >
						<h3>${gift.price}원+</h3>${gift.gift}
					</button>
					<div style="width:100%;margin:1.8em;"></div>
					<div class="hiddenList" id="gift${gift.gift_id}" style="display:none;">
						추가 후원금(선택)<br>
						<input type="text" id="input${gift.gift_id}" maxlength="16" oninput="numSet(this,'${gift.price}')"><br>
						<span class="blockquote-footer">더 후원해주시면 프로젝트 성사가 앞당겨집니다.</span>
						<div style="width:100%;margin:0.2em;"></div>
						<button class="btn btn-default" id="5000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5천원</button>
						<button class="btn btn-default" id="10000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 1만원</button>
						<button class="btn btn-default" id="50000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5만원</button>
						<button class="btn btn-default" id="100000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 10만원</button><br>
						<div style="width:100%;margin:1.8em;"></div>
						<button class="btn btn-secondary my-2 my-sm-0" id="payMoney${gift.gift_id}" onclick="pay('${gift.gift_id}','${gift.price}')">${gift.price}원 밀어주기</button>
					</div>	
				<hr>
				</div>
				
				
			</c:forEach>
	
	</div>
	
	
	
	
	
          </div>
        </div>

      </div>

</c:if>


<!-- 공유 버튼은 둘다 있음~ -->
   
    </div>
    <!-- /.row -->
    
    
    
    
    
    
    
    
    

  </div>
  <!-- /.container -->

<div style="width:100%;margin:3em;"></div>
<h2>이런 프로젝트 어떠세요?</h2><br>
<div class="row text-center">
<c:forEach var="morePrj" items="${morePrjList}">
${memberMap[morePrj.value.project_id].member_URL}
	${morePrj.value.project_id}
	    <div class="col-md-3">
	        <div class="card">
	            <div class="card-img">
	                <img class="img-responsive" src="${path}/${morePrj.value.project_main_image}" onclick="goProject('${morePrj.value.project_id}')">
	            </div>

	<c:set var="flag" value="false" />
	                <c:forEach var="likeId" items="${likeList}">
						<c:if test="${likeId eq morePrj.value.project_id}">
							<c:set var="flag" value="true" />
						</c:if>		
					</c:forEach>
					
					
		<c:if test="${flag}">
			<button id="likeBtn${morePrj.value.project_id}" class="likeBtn" onClick="MyFavoritProject('${morePrj.value.project_id}')">
				<img class="likeImg" src="/fund/resources/img/fullHeart.png">
			</button>
				
		</c:if>
		<c:if test="${not flag}">
			<button id="likeBtn${morePrj.value.project_id}" class="likeBtn" onClick="MyFavoritProject('${morePrj.value.project_id}')">
				<img class="likeImg" src="/fund/resources/img/blankHeart.png">
			</button>		
		</c:if>	
		
		
		
		
	 <div class="card-block">
	               <div class="card-title">
	                    <small><a href="/fund/discover?category=${morePrj.value.project_sub_category}">${morePrj.value.project_sub_category}</a> | <a href="fund/u?member_url=${memberMap[morePrj.value.project_id].member_URL}">${memberMap[morePrj.value.project_id].member_name}</a></small>
	                    <h4><a href="/fund/discover/${morePrj.value.project_id}">${morePrj.value.project_title }</a></h4>
	                    <p>${morePrj.value.project_summary }<br>
	                   ${morePrj.value.project_current_percent} %달성</p>
	                </div>
				
		
				</div>
				
			
				
			</div>
			
		</div>

</c:forEach>
  </div>     

    <div style="width:100%;margin:5em;"></div>
    
    
    
    
    
    
    
 

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/fund/resources/myjsFunction/projectFunction.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="/fund/resources/vendor2/bootstrap/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">



var page = 0;
function infiniteScroll() {
		console.log("인피니트 진입")
		//만약 전체 스크롤-10보다 내려온 스크롤이 크면(밑바닥에 거의 닿으면)
		if ($(document).height() - 50 <= $(window).height()
				+ $(window).scrollTop()) {
			page += 1;
			//list객체에서 page값을 1 올려준다. 
			let params = "?page=" + page;
			//param += ${param.cat1egory} ->이렇게 하면 안돼ㅜ
			//파라미터값이 존재할때만 params에 붇혀줌(ajax로 url에 묻혀줄 변수임)
				params += "&project_id="+'${prj.project_id}';
	
			
			console.log("붙여줄 파람값:"+params);
			
			//비동기 실행
			//여기서 보내줘야할것...은...필요한거 똑같이 보내줘야됨. if문도 걸어줘야 됨.(prelaunchig or not?)
			$.ajax({
				type : 'GET',
				url : '/fund/discover/board' + params,
				contentType : "application/json; charset=utf-8",
				success : function(data) {
		
					let bhtml = "";
					

					$.each(data, function(index, dto) { //i배열이 들어온다.
						bhtml += '<div class="card my-4"><h5 class="card-header">No.'+dto.bno+' '+dto.member_email+'|'+dto.dateFormat+'</h5>';
						bhtml += '<div class="card-body">'+dto.content+'<br><br><button class="btn btn-secondary my-2 my-sm-0"  onclick="getReply('+dto.bno+','+dto.project_id+')">댓글보기</button>';
						bhtml += '<div id="reply'+dto.bno+'"></div></div></div><hr>';			
	
					});

					$("#board").append(bhtml);
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




function getReply(bno,prjId){
	
	var param = '?project_id='+prjId+'&bno='+bno;
	var sessionData = "userId"; //세션의 이메일 가져오는 것.
	sessionStorage.setItem("userId","1");//이거 합치면 지워라잉/////////////////
	
	var userId = sessionStorage.getItem(sessionData);
	
	//bno의 댓글목록을 불러옴.
	$.ajax({
				type : 'GET',
				url : '/fund/discover/reply'+param ,
				contentType : "application/json; charset=utf-8",
				success : function(replyList) {//
					let html = "";
				
			
					//html += ' <div class="card my-4"><h5 class="card-header">댓글달기</h5><div class="card-body">';
					
						html += '<hr><form id="form"'+prjId+'><div class="form-group"><textarea id="text'+bno+'" name="content" class="form-control" rows="3"></textarea> </div>';
						html +='<input type="hidden" name="member_email" value="'+userId+'"><input type="button" class="btn btn-secondary my-2 my-sm-0" value="댓글달기" onclick="replySub('+bno+','+prjId+')"></form></div>';

						
					var rno=0;
					$.each(replyList,function(index,dto){
					 	
						html +='<div class="media mb-4"><div class="media-body"><h5 class="mt-0">'+dto.member_name+'</h5>'+dto.content+'</div></div>';				
						//html +='<div id="rno"'+dto.bno+dto.rno+1+'></div>'
						
						if(userId==dto.member_email){
							html +='<button class="btn btn-secondary my-2 my-sm-0">수정</button>nbsp;nbsp;';
							html +='<button class="btn btn-secondary my-2 my-sm-0">삭제</button><hr>';
							
						}	
						
						
						rno = dto.rno;
					});
					
				
					
					$("#reply"+bno).html(html);
				}//success func 
				,
				error : function() {
					alert("문제발생");
				}
			});//ajax 실행
	
}

function replySub(bno,prjId){
	console.log(prjId+"프로젝트의"+bno+"번 게시글 댓글달러감");

	var sessionData = "userId"; //세션의 이메일 가져오는 것.
	var userId = sessionStorage.getItem(sessionData);
	var content = $('#text'+bno).val(); //댓글내용
	
	console.log("세션아이디:"+typeof userId);
	
	
	
	let doneMem = '${donatedMemList}';
	doneMem = doneMem.replace('[',''); //배열의 앞뒤 제거, 공백 제거
	doneMem = doneMem.replace(']','');
	doneMem = doneMem.replace(' ','');

	var doneList = doneMem.split(',');
	var flag = false;
	
	$.each(doneList,function(index,email){
		if(email==userId){ //지금 로그인한 사람이 도네목록에 있으면
			flag =true;
		}
		
	});
	
	if(flag){
		if(content.replace(/\s| /gi, "").length==0){
			alert("내용을 입력하세요.");
		} else{
			
			let reDto = {
					project_id : prjId,
					bno : bno,
					content : content,
					member_email : userId,		
			};
			
			console.log(reDto.project_id);
			console.log(reDto.content);
			console.log(reDto.member_email);
			
			
			$.ajax({
				type : 'POST',
				url : '/fund/discover/reply',
				dataType : 'json',
				data : reDto,
				success : function(data) {
					var htmlr='';
					console.log(data);
					console.log(data['project_id']);
					alert("성공");
					
					if(userId==null){
						htmlr += '<hr><form id="form"'+prjId+'><div class="form-group"><textarea id="text'+bno+'" name="content" class="form-control" rows="3"></textarea> </div>';
					}
						htmlr +='<input type="hidden" name="member_email" value="'+userId+'"><input type="button" class="btn btn-primary" value="댓글보기" onclick="replySub('+bno+','+prjId+')"></form></div>';
					
					$.each(data, function(index,map){
						console.log(map['project_id']);
						htmlr += '<div class="media mb-4"><div class="media-body"><h5 class="mt-0">'+map['member_name']+'</h5>'+map['content']+'<span style="text-align:right">'+map['dateFormat']+'</span></div></div>';
						if(userId==map['member_email']){
							htmlr +='<button class="btn btn-secondary my-2 my-sm-0">수정</boutton>nbsp;nbsp;';
							htmlr +='<button class="btn btn-secondary my-2 my-sm-0">삭제</boutton>';
						}
						
					});
	
					$("#reply"+bno).html(htmlr);
	
				},
				error : function() {
					alert("실패!");
				}
	
			});
		
		}

	}//도네목록 있는 사람 조건문
	else{
		
		alert("해당 프로젝트의 후원자만 쓸 수 있습니다.");
	}
	
	
}











Kakao.init("4a910cfb1ef1434f4c361ae507d1375a");
function sendLink(prjId){
	console.log("샌드링크 들어옴");
	var like = '${prj.project_like}';
	console.log(like);
	var id = prjId;
	var path='http://localhost:8086/fund/resources/project/224.jpg';
	var url = 'http://localhost:8086/fund/discover/'+id;
	console.log(id);
	Kakao.Link.sendDefault({
		
		 
		  objectType: 'feed',
		  content: {
		    title: '${prj.project_title}',
		    description: '${prj.project_summary}',
		    imageUrl: '/fund/resources/project/224.jpg',
		    link: {
		      mobileWebUrl: url,
		     
		    },
		  },
		  social: {
		    likeCount: Number(like),

		  },
		  buttons: [
		    {
		      title: '웹으로 이동',
		      link: {
		        webUrl: url,
		      },
		    },
		    
		  ]
		});
	
}








</script>
</body>

</html>