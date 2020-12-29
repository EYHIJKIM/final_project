<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap{
display:flex;flex-flow: column;
align-content: center;
}
.prjBanner{
display:flex;
}




.modalWrap{

	display: none;
	width:300px;
	height:500px;
	position: absolute;
	top:50%;
	left:50%;
	margin: -250px 0 0 -250px;
	background:#eee;
	z-index:2;

}

	.blackBg{

		display:none;
		position:absolute;
		content:"";
		width:100%;
		height:100%;
		background-color:rgba(0, 0,0, 0.5);
		top:0;
		left:0;
		z-index: 1;
		
	}

.modalClose{
	position:fixed;
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;

}

.modalClose> a{
	display: block;
	width: 100%;
	height: 100%;
	background:url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}


</style>
</head>

<body>





<c:set var="path" value="/fund/resources" />
<c:set var="mem" value="${memberInfo}"/>
<c:set var="prj" value="${projectInfo}" />
<c:set var="day" value="${dDayInfo}"/>


<h2>${prj.project_id}번 게시물 일수: ${day.chk}</h2>

<c:if test="${day.chk>='0' and day.d_day>'0'}">
<div class="banner">
	<h1>이건 진행중인 프로젝트 상세보기 첫화면</h1>
	<a href="/discover?category=${prj.project_main_category}">
	
	<%-- 이거 자바스크립트로 ㄱㄱ, 맵으로 리스트 만들어서 뽑으셈 --%>
	<c:if test="${prj.project_main_category eq 'video'}">
		비디오
	</c:if>
	</a>
	<h1>${prj.project_title}</h1>
	<hr>

<img src="${path}/project/${prj.project_id}.jpg" width="500px" height="500px">

이멜: ${mem.member_email }
	
	<a href="#멤버프로필로 고">
	<img src="${path}/member/${mem.member_email}.jpg" width="50px" height="50px"></a> &nbsp;
	${mem.member_name}<br>
	
	
	모인금액 : ${prj.project_current_donated}원<br>
	남은 시간 : ${prj.project_deadline}
	
	<br>
	
	
	<c:set var="msg" value="좋아요 누르기!" />
				
				<c:forEach var="likeId" items="${likeOrAlarmList}">
					<c:if test="${likeId eq prj.project_id}">
						<c:set var="msg" value="좋아요 이미 누름!" />
					</c:if>
				</c:forEach>
				
	
	후원자${donatedMemberCnt} 명<br>
	<button id="pushPrj">프로젝트 밀어주기</button><br><!-- 비동기로 내려가서 선물선택 보도록. -->
	<button class="button small" id="likeBtn" onClick="MyFavoritProject('${prj.project_id}')">
					<p id="likeBtn${prj.project_id}">${msg}</p>
				</button>
	
<button class="kakao-link-btn" onclick="sendLink()">카톡 공유</button>

	<div class="noticeBox">
		<h3>펀딩 진행중</h3>
		<p>목표 금액인 ${prj.project_target_price } 원이 모여야만 결제됩니다.
		<br>결제는 ${prj.project_deadline_string }에 진행됩니다.</p>
	</div>





	

	<a href="${prj.project_id}">스토리</a>
	<a href="${prj.project_id}/community">라이브</a>
	<a href="${prj.project_id}/notice">펀딩안내</a>

	
</div>
	<hr>
<div class="content">
	여기는 프로젝트 내용...
		->배너 사진은 pj에서 뽑아온 picture로 해야한다.
	
	
	1. 처음 상세정보 들어오면 주소값 ___/게시글번호/ref=discover,,,추천프로젝트..이런거 뜸.<br>
	
	
	2. 스토리 /커뮤니티/ 펀딩안내 탭  -> 이때부터 주소값 바뀜<br>
	
	
	결제창 넘어갈때의 파라미터 이름 => 이거 로그인 안해있으면 로그인창으로 넘겨야함
	money=10000&project_id=5&project_title=%`
	
	
	
	
	아래 푸터에는 해당 동일 대분류 뽑아냄.-> popular기준으로 할까싶음...<br>
</div>
<div class="MemberIntro">
	창작자 소개

</div>

<div id="giftForm">
	선물 선택
		<div class="aGift">
			<button class="basic">1,000원+</button>
			<p>선물을 선택하지 않고 밀어만 줍니다</p>
		</div>
	
	*더 후원해주시면 프로젝트 성사가 앞당겨집니다.
	
	<c:forEach var="gift" items="${projectGift}" varStatus="status">
	
		<div class="aGift">
			<button class="${gift.key}">${gift.price}원+${gift.gift}
			
			추가 후원금(선택)</button>
			
			<input type="text" id="input${gift.gift_id}" maxlength="16" oninput="numSet(this,'${gift.price}')">
			
			
			<button id="5000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5천원</button>
			<button id="10000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 1만원</button>
			<button id="50000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5만원</button>
			<button id="100000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 10만원</button><br>
			<button id="payMoney${gift.gift_id}">${gift.price}원 밀어주기</button>	
		<hr>
		</div>
		
		
	</c:forEach>
	



</div>
</c:if>
<script type="text/javascript">


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






<%--공개예정 --%>
<c:if test="${day.chk<'0' and day.d_day>'0' and prj.project_prelaunching_check eq '1'}">
	<h1>공개예정인 경우</h1>
	
	<%--이거 알람 나타나는거 자바 스크립트로 띄우셈...안그러면 잘 안됨.. --%>

	<c:set var="msg" value="알림신청(${alarmMemberCnt}명 신청중)" />
	
	<img src="${path}/project/${prj.project_id}.jpg" width="500px" height="500px">
	<a href="#멤버프로필로 고">
	<img src="${path}/member/${mem.member_email}.jpg" width="50px" height="50px"></a> &nbsp;
	${mem.member_name}<br>
	
	${prj.project_summary}
	
	
	<p class="launchingDay">${day.prelaunching_day}</p>
				<c:forEach var="alarmId" items="${likeOrAlarmList}">
				 
					<c:if test="${alarmId eq prj.project_id}">
						<c:set var="msg" value="알림신청완료(${alarmMemberCnt}명 신청중)" />
					</c:if>
				</c:forEach>

		
				<button id="notificationBtn" onClick="MyAlarmProject('${prj.project_id}')">
					<p id="notiBtn${prj.project_id}">${msg}</p>
				</button>
<button class="kakao-link-btn" onclick="sendLink()">카톡 공유</button>

</c:if><%--공개예정 뷰 --%>




















<c:if test="${day.d_day<'0'}">
	<h1>펀딩 끝남!!</h1>
	${prj.project_release_date}에 결제 진행됨
</c:if>


<!-- 공유 버튼은 둘다 있음~ -->



<h2>이런 프로젝트 어떠세요?</h2>
<c:forEach var="morePrj" items="${morePrjList}">
	<img src="${path}/project/${morePrj.key}.jpg" width="100px" height="100px">
	<br>
	${morePrj.value.project_title }<br>
	${morePrj.value.project_summary }<br>
	${morePrj.value.member_name}
<c:if test="${morePrj.value.project_like eq 'like' }">
	<c:set var="msg" value="좋아요 누르기!" />
</c:if>
<c:if test="${morePrj.value.project_like eq 'cancelLike' }">
	<c:set var="msg" value="좋아요 이미 누름!" />
</c:if>
	<button class="button small" id="likeBtn" onClick="MyFavoritProject('${morePrj.key}')">
			<p id="likeBtn${morePrj.key}">${msg}</p>
	</button>
<hr>
</c:forEach>




<footer id="footer">
				<div class="inner">
					<div class="content">
					 
						
					</div>
					<div class="copyright">
						&copy; Untitled. Photos <a href="https://unsplash.co">Unsplash</a>, Video <a href="https://coverr.co">Coverr</a>.
					</div>
				</div>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="/fund/resources/myjsFunction/projectFunction.js"></script>
<script type="text/javascript">




/*
jQuery(document).ready(function(){
	
	
	$('#money'+).on('keyup',function(){
		
	});
	
	
});
*/




$("#pushPrj").click(function(){
	console.log("푸쉬");
	var giftLocation = $("#giftForm").offset().top;

	$("html,body").animate({scrollTop : giftLocation}, 500);
});








Kakao.init("4a910cfb1ef1434f4c361ae507d1375a");
function sendLink(){
	console.log("샌드링크 들어옴");
	var like = '${prj.project_like}';
	console.log(like);
	var id = '${prj.project_id}';
	var path='http://localhost:8086/fund/resources/project/224.jpg'
	console.log(id);
	Kakao.Link.createDefaultButton({
		
		  container: '.kakao-link-btn',
		  objectType: 'feed',
		  content: {
		    title: '${prj.project_title}',
		    description: '${prj.project_summary}',
		    imageUrl: path,
		    link: {
		      mobileWebUrl: "http://localhost:8086/fund/discover/224",
		      androidExecParams: 'test',
		    },
		  },
		  social: {
		    likeCount: Number(like),

		  },
		  buttons: [
		    {
		      title: '웹으로 이동',
		      link: {
		        mobileWebUrl: "http://localhost:8086/fund/discover/224",
		      },
		    },
		    {
		      title: '앱으로 이동',
		      link: {
		        mobileWebUrl: "http://localhost:8086/fund/discover/224",
		      },
		    },
		  ]
		});
	
}


</script>


</body>
</html>