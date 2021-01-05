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

</style>
</head>

<body onload="setTag()">

  <!-- Navigation -->
<%@include file="../../default/main_header.jsp" %>



<c:set var="path" value="/fund/resources" />
<c:set var="mem" value="${memberInfo}"/>
<c:set var="prj" value="${projectInfo}" />
<c:set var="day" value="${dDayInfo}"/>



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
		
        <!-- Post Content -->

       <c:forEach var="brd" items="${boardList}">
               <div class="card my-4">
          <h5 class="card-header">${brd.member_name} | ${brd.regdate}</h5>
          <div class="card-body">
			${brd.content }<br>
			<button class="btn btn-secondary my-2 my-sm-0"  onclick="getReply('${brd.bno}')">댓글 보기</button>
			<div id="reply${brd.bno}"></div>
			
		 </div>
	
		</div>
		<hr>
		</c:forEach>
        
        

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

        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
          </div>
        </div>

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
		    imageUrl: 'http://localhost:8086/fund/resources/project/224.jpg',
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




$("#pushPrj").click(function(){
	console.log("푸쉬");
	var giftLocation = $("#giftForm").offset().top;

	$("html,body").animate({scrollTop : giftLocation}, 500);
});







function pay(id, price){
	let path = '';
	let money = Number($("#input"+id).val());
	money += Number(price);
	let prjId = '${prj.project_id}';
	let title = '${prj.project_title}';
	
	path += 'fund/paymethod?money='+money+'&project_id='+prjId+'&project_title='+title;
	console.log(path);
	//location.href=path;
	
}


function setTag(){
	
	var  category = [
		 { 
		 		'게임' : 'game',
				'모바일 게임' : 'mobile-game', 
				'비디오 게임':'video-game',
				'보드 게임':'board-game'
	 },
	 
	 {
			 	'공연' : 'show',
				'무용' : 'dance', 
				'뮤지컬':'musical',
				'공연':'theater'
	 },
	 
	 {
		 		 '디자인' : 'design',
				 '건축, 공간' : 'architecture', 
				 '그래픽 디자인':'graphic-design',
				 '제품 디자인':'product-design'
	 },
	 
	 {
		        '만화' : 'comics',
				'웹툰' : 'web-comics', 
				'만화책':'comic-books'
				
  },
	 {			
		 	  '예술' : 'art',
		 	  '전시' : 'exhibitions',
			  '웹툰' : 'sculpture-and-action-figures', 
			  '일러스트레이션':'illustration'
			
	 },		
  
	 	{			
			 	  '공예' : 'crafts',
			 	  '캔들&조향&비누' : 'candles-and-diffusers-and-soaps',
			 	  '가죽&금속&목 공예' : 'leather-and-metal-and-woodworking',
			 	  '도예' : 'pottery'
				  
				
		 },
		 
		{			
				 	  '사진' : 'photography',
				 	  '인물' : 'people-photography',
				 	  '배경' : 'space-and-urban-photography',
				 	  '동물' : 'animals-photography'				
		 
	 },

	{				
				 	  '영상' : 'video',
				 	  '영화' : 'film',
				 	  '다큐멘터리' : 'documentary',
				 	  '애니메이션' : 'animation',
				 	  '뮤직비디오' : 'music-videos'
					  
		

	},
		{
					
				 	  '모든' : 'food',
				 	  '에피타이저' : 'appetizer',
				 	  '메인디쉬' : 'main-dish',
				 	  '디저트' : 'dessert'
					  
			 
		},
		
		{
			 	  '음악' : 'music',
			 	  '클래식' : 'classical-music',
			 	  '대중음악' : 'popular-music',
			 	  '인디음악' : 'independent-music'
				  
		},
		
		{
					 '출판' : 'publication',
					 '잡지' : 'zines',
					 '문학&에세이' : 'literature-and-essay',
					 '그림책' : 'picture-books'		  			 		
	    },
	    
		{
		
				 	  '모든테크' : 'technology',
				 	  '소프트웨어' : 'software',
				 	  '하드웨어' : 'hardware',
				 	  '앱' : 'apps',
				 	  '웹' : 'web'
					  
		
		},
	
		{
				 	  '패션' : 'fashion',
				 	  '의류' : 'apparels',
				 	  '악세서리' : 'accessories',
				 	  '뷰티' : 'beauty'
		 		
	   },

		{
				 	  '저널' : 'journalism',
				 	  '오디오 저널' : 'audio-journals',
				 	  '비디오 저널' : 'video-journals',
				 	  '웹 저널' : 'web-journals'

		}	
	];
	
	
	$.each(category,function(idx,map){
		$.each(map,function(key,value){
			if(value=='${prj.project_sub_category}'){
				$("#subCategory").html(key);
			}
			
		})
	})

	
	
}



 
function showOrView(id){
	
	var str = '${giftIdList}'; //gift id만 들어가있는 리스트. 문자열로 들어옴
	str=str.replace('[',''); //배열의 앞뒤 제거, 공백 제거
	str=str.replace(']','');
	str=str.replace(' ','');

	var spList = str.split(','); //,로 스플릿해서 해당 id값만 배열에 받는다.
	spList.push(0); //기본 목록도 나타나도록.
	
	 //index와 비교할 것
	console.log(spList);
	var cnt = 0;
	$.each(spList,function(idx,value){
		//리스트 안의 아이템만큼 반복한다. cnt처음에는 0
		//지금은 리스트가 2갱
		//value는 id리스트임. id는 클릭한 객체.
		
		if($("#gift"+id).is(":visible")){ //목록이 보이는 상황..그럼 굳이 누를건 없고..다른거 올려
			if(id!=value){ //누른 id를 제외한 다른 목록을 올려야 함.
				$("#gift"+value).slideUp();
			
			} 
		} else{//목록이 안보이는 상황이면
			if(id==value){
				$("#gift"+value).slideDown(); //누르것만 내림
			} else{
				$("#gift"+value).slideUp()
			}
		}

	});
	


	
}






//가격 플러스 버튼클릭할시 실행
function plusMoney(info,id,price){
	var plus = Number(info.id);
	var money = Number($("#input"+id).val());
	var price = Number(price)
	var plusMoney = plus+money;
	
	console.log(price);
	
	price += plusMoney
	price = price+'원 밀어주기';
	
	
	$('#input'+id).val(plusMoney);
	$('#payMoney'+id).html(price);

}



function numSet(info,price){
	console.log("numSet들옴");	
	var id = info.id;
	
	id = id.replace('input','');

	var price = Number(price);
	var inputDonate = Number(info.value);
	
	info.value = info.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');	
	if(info.value.length > info.maxLength){
		info.value = info.value.slice(0, info.maxLength);

	}

	console.log("id:"+id);
	console.log("price:"+price);
	console.log("input:"+inputDonate);
	
	
	price +=inputDonate;
	price = price+'원 밀어주기';

	$('#payMoney'+id).html(price);

}	


	
	







</script>
</body>

</html>