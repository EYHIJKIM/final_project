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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#modalBtn').click(function(){
			console.log("안녕하삼");

			$('.modalWrap').show();
			$('.blackBg').show();
			
			$('.modalClose').click(function(){
				$('.modalWrap').hide();
				$('.blackBg').hide();
				
			});
			
		});	
	});
	

	
	$(window).scroll(function(event){
		
		var winTop = $(window).scrollTop();
		var bgTop = $(".blackBg").offset().top;
		
		if(winTop > bgTop){
			
			$(".blackBg").css("position", "fixed");
			$(".modalWrap").css("position", "fixed");
		}
		else if(winTop < bgTop){
			$(".blackBg").css("position", "static");
			$(".modalWrap").css("position", "static");
		}
		
		
	});
	
	
</script>



<c:set var="path" value="/fund/resources" />
<c:set var="mem" value="${memberInfo}"/>
<c:set var="prj" value="${projectInfo}" />

	<h1>이게 프로젝트 상세보기 첫화면</h1>
	<a href="/discover?category=${prj.project_main_category}">
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
	
	
	모인금액<br>${prj.project_current_donated}원<br>
	남은 시간<br>${prj.project_deadline - p }
	
	<br>
	후원자${donatedMemberCnt}<br>
	<button id="pushPrj">프로젝트 밀어주기</button><br><!-- 비동기로 내려가서 선물선택 보도록. -->
	<button id="likeBtn">좋아요 버튼</button><br>
	
	
	<button id="modalBtn">공유 버튼</button>
	<div class="blackBg"></div>
	<div class="modalWrap">
			<div class="modalClose"><a herf="#">close</a></div>
			<div class="shredContent">
				카카오톡
				뭐시기
				저시기
			</div>
	</div>
	

	
			공유합시당



	

	<a href="#스토리">스토리</a>
	<a href="#라이브">라이브</a>
	<a href="#펀딩안내">펀딩안내</a>
	
<hr>
	

<br>
여기는 프로젝트 내용...
	->배너 사진은 pj에서 뽑아온 picture로 해야한다.


1. 처음 상세정보 들어오면 주소값 ___/게시글번호/ref=discover,,,추천프로젝트..이런거 뜸.
2. 스토리 /커뮤니티/ 펀딩안내 탭  -> 이때부터 주소값 바뀜


결제창 넘어갈때의 파라미터 이름
money=10000&project_id=5&project_title=%`




아래 푸터에는 해당 동일 대분류 뽑아냄.-> popular기준으로 할까싶음...<br>



============================공개예정인 경우===================
밀어주기 버트만 알림신청으로 ㄱ




<h2>이런 프로젝트 어떠세요?</h2>
<footer id="footer">
				<div class="inner">
					<div class="content">
					 
						
					</div>
					<div class="copyright">
						&copy; Untitled. Photos <a href="https://unsplash.co">Unsplash</a>, Video <a href="https://coverr.co">Coverr</a>.
					</div>
				</div>
</footer>



</body>
</html>