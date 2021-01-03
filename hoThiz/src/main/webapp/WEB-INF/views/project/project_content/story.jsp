<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hoThiz :: 핫디즈</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	  <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	  <link rel="stylesheet" href="resources/mycss/mycss.css">

<style type="text/css">




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




.likeBtn{
    border: none;
    outline:none;
    background-color: white;
}

</style>
</head>

<body onload="setTag()">

<%@include file="../../default/main_header.jsp" %>



<c:set var="path" value="/fund/resources" />
<c:set var="mem" value="${memberInfo}"/>
<c:set var="prj" value="${projectInfo}" />
<c:set var="day" value="${dDayInfo}"/>


<h2>${prj.project_id}번 게시물 일수: ${day.chk}</h2>

<c:if test="${day.chk>='0' and day.d_day>'0'}"><%--진행중인 경우 --%>

<div class="banner">
	<h1>이건 진행중인 프로젝트 상세보기 첫화면</h1>
	<a href="/fund/discover?category=${prj.project_sub_category}">
	
	<%-- 이거 자바스크립트로 ㄱㄱ, 맵으로 리스트 만들어서 뽑으셈 --%>
	<div id="subCategory">${prj.project_sub_category}</div>
	</a>
	
	<h1>${prj.project_title}</h1>
	<hr>

<img src="${path}/project/${prj.project_main_image}" width="500px" height="500px">

이멜: ${mem.member_email }
	
	<a href="#멤버프로필로 고">
	<img src="${path}/member/${mem.member_email}.jpg" width="50px" height="50px"></a> &nbsp;
	${mem.member_name}<br>
	
	
	모인금액 : ${prj.project_current_donated}원<br>
	남은 시간 : ${day.chk} 일
	후원자${donatedMemberCnt} 명<br>
	<br>
	

				
				
				

				
	
	
	<button id="pushPrj">프로젝트 밀어주기</button><br><!-- 비동기로 내려가서 선물선택 보도록. -->


				
			
	<%--만약 이미 좋아하는 프로젝트면 flag는 true --%>		
	<c:if test="${likeId eq prj.project_id}">
		<c:set var="flag" value="true"></c:set>
	</c:if>			
	<c:if test="${flag}">
		<button id="likeBtn${prj.project_id}" class="likeBtn" onClick="MyFavoritProject('${prj.project_id}')">
			<img class="likeImg" src="${path}/img/fullHeart.png">
		</button>
				
	</c:if>
	<c:if test="${not flag}">
		<button id="likeBtn${prj.project_id}" class="likeBtn" onClick="MyFavoritProject('${prj.project_id}')">
			<img class="likeImg" src="${path}/img/blankHeart.png">
		</button>
	</c:if>


	
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
			<button class="hiddenBtn0" onclick="showOrView(0)">1,000원+ 선물을 선택하지 않고 밀어만 줍니다</button>
					<div class="hiddenList" id="gift0" style="display:none;">
					
						<input type="text" id="input0" maxlength="16" oninput="numSet(this,0)">
	
						<button id="5000" onclick="plusMoney(this,0,1000)" >+ 5천원</button>
						<button id="10000" onclick="plusMoney(this,0,1000)" >+ 1만원</button>
						<button id="50000" onclick="plusMoney(this,0,1000)" >+ 5만원</button>
						<button id="100000" onclick="plusMoney(this,0,1000)" >+ 10만원</button><br>
						<button id="payMoney0" onclick="pay(0,1000)">1000원 밀어주기</button>
					</div>


		</div>
	
		*더 후원해주시면 프로젝트 성사가 앞당겨집니다.
	
			<c:forEach var="gift" items="${projectGift}" varStatus="status">
			
				<div class="aGift">
					<button class="hiddenBtn${gift.gift_id}" onClick="showOrView('${gift.gift_id}')">${gift.price}원+${gift.gift}
					
					추가 후원금(선택)
					</button>
					<div class="hiddenList" id="gift${gift.gift_id}" style="display:none;">
					
						<input type="text" id="input${gift.gift_id}" maxlength="16" oninput="numSet(this,'${gift.price}')">
	
						<button id="5000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5천원</button>
						<button id="10000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 1만원</button>
						<button id="50000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5만원</button>
						<button id="100000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 10만원</button><br>
						<button id="payMoney${gift.gift_id}" onclick="pay('${gift.gift_id}','${gift.price}')">${gift.price}원 밀어주기</button>
					</div>	
				<hr>
				</div>
				
				
			</c:forEach>
	
	</div>
	
</c:if><%--진행중인 경우 --%>



<script type="text/javascript">

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
	
	var str = '${projectGift}';
	var spList = str.split('{');
	var cnt =0;

	$.each(spList,function(idx,value){
		if($("#gift"+id).is(":visible")){ //목록이 보이는 상황..그럼 굳이 누를건 없고..다른거 올려
			if(cnt!==id){
				$("#gift"+cnt).slideUp();
			} 
		} else{//목록이 안보이는 상황이면
			if(cnt==id){
				$("#gift"+cnt).slideDown(); //누르것만 내림
			} else{
				$("#gift"+cnt).slideUp()
			}
		}

		cnt++;
	});
	


	//만약 보이는 중에 클릭하면
	if($("#gift"+id).is(":visible")){ //보이면
		//다른거 다 올려야될듯..
		
		
	}else{//만약 안보이면
		
		//선택한것만 내림
		$("#gift"+id).slideDown();
	}
	
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
		${morePrj.value.project_current_percent} %달성
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


<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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