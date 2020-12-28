<!DOCTYPE HTML>
<%@ page contentType = "text/html;charset=utf-8" %>
<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Industrious by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/myCss.css" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body class="is-preload">
<%String jspPath = "/fund/WebContent/WEB-INF/views/"; %>
<script>
			$(".more").click(function(){
				if($(this).find(".sub").is(":visible")){
					//$(".list").css("display","none");
					$(this).find(".sub").slideUp();
				} 
				else{
					//$(".list").css("display","block");	
					$(this).find(".sub").slideDown();
				}
				
				
			});	

			

</script>
	
	<header id="header">
		
		
		<a class="logo" href="/fund/">Industrious</a>
		<nav>
			<a href="#search"><i class="fa fa-search"></i></a>	
		</nav>
		<nav>
			<a href="#menu">Menu</a>
		</nav>
		
		<!-- 
			여기 로그인 버튼, 세션 처리 해야됨..(로그인한경우 버튼 달라지게)
		
		 -->
	</header>

	<nav id="search">
		
	</nav>


	<nav id="menu">
		<ul class="links">
			
			<!-- 프로젝트마다 태그를 파라미터로 묻혀서 보내줌. -->
			<li>
			
				<a href="/fund/discover">모든 프로젝트</a>
				<a href="/fund/discover?sort=popular&ongoing=onGoing">인기 추천 프로젝트</a>
				<a href="/fund/discover?maxAchieveRate=99&minAchieveRate=80&sort=endedAt&ongoing=onGoing">성공 임박 프로젝트</a>
				<a href="/fund/discover?sort=publishedAt&ongoing=onGoing">신규 추천 프로젝트</a>
				<a href="/fund/discover?ongoing=prelaunching">공개예정 프로젝트</a>
			
			</li>
		</ul>
		<hr>
		<ul class="links">
			<li class="more">
				<a href="#">게임</a>
				<ul class="sub" style="display:none; text-decoration: none;">
					<li><a href="/fund/discover?category=games">게임 전체</a></li>
					<li><a href="/fund/discover?category=mobile-games">모바일 게임</a></li>
					<li><a href="/fund/discover?category=video-games">비디오 게임</a></li>
					<li><a href="/fund/discover?category=board-games">보드게임</a></li>
				</ul>
				
			</li>
		</ul>
			
			
		
			
			<li><a>공연</a>
			<a href="/fund/discover?category=show">모든 공연</a>
			<a href="/fund/discover?category=dance">무용</a>
			<a href="/fund/discover?category=musical">뮤지컬</a>
			<a href="/fund/discover?category=theater">연극</a>
			</li>
			
			<li>디자인
			<a href="/fund/discover?category=design">모든 디자인</a>
			<a href="/fund/discover?category=architecture">건축</a>
			<a href="/fund/discover?category=graphic-design">그래픽 디자인</a>
			<a href="/fund/discover?category=product-design">제품 디자인</a>
			</li>
			
			<li>만화
			<a href="/fund/discover?category=comics">모든 만화</a>
			<a href="/fund/discover?category=web-comics">웹툰</a>
			<a href="/fund/discover?category=comic-books">만화책</a>

			</li>
			<li>예술
			<a href="/fund/discover?category=art">모든 예술</a>
			<a href="/fund/discover?category=exhibitions">전시</a>
			<a href="/fund/discover?category=sculpture-and-action-figures">조소	&middot;피규어</a>
			<a href="/fund/discover?category=illustration">일러스트레이션</a>
			</li>
			
			<li>공예
			<a href="/fund/discover?category=crafts">모든 예술</a>
			<a href="/fund/discover?category=candles-and-diffusers-and-soaps">캔들&middot;조향	&middot;비누</a>
			<a href="/fund/discover?category=leather-and-metal-and-woodworking">가죽&middot;금속&middot;목 공예</a>
			<a href="/fund/discover?category=pottery">도예</a>
			</li>
			
			<li>사진
			<a href="/fund/discover?category=photography">모든 사진</a>
			<a href="/fund/discover?category=people-photography">인물</a>
			<a href="/fund/discover?category=space-and-urban-photography">배경</a>
			<a href="/fund/discover?category=animals-photography">동물</a>
			</li>
			
			<li>영상
			<a href="/fund/discover?category=video">모든 영상</a>
			<a href="/fund/discover?category=film">영화</a>
			<a href="/fund/discover?category=documentary">다큐</a>
			<a href="/fund/discover?category=animation">애니메이션</a>
			<a href="/fund/discover?category=music-videos">뮤직비디오</a>
			</li>
			
			
			<li>푸드
			<a href="/fund/discover?category=video">모든 푸드</a>
			<a href="/fund/discover?category=appetizer">에피타이저</a>
			<a href="/fund/discover?category=main-dish">메인디쉬</a>
			<a href="/fund/discover?category=dessert">디저트</a>
			</li>
			
			<li>음악
			<a href="/fund/discover?category=music">모든 음악</a>
			<a href="/fund/discover?category=classical-music">클래식</a>
			<a href="/fund/discover?category=popular-music">대중음악</a>
			<a href="/fund/discover?category=independent-music">인디음악</a>
			</li>
			
			<li>출판
			<a href="/fund/discover?category=publication">출판</a>
			<a href="/fund/discover?category=literature-and-essay">문학&middot;에세이</a>
			<a href="/fund/discover?category=picture-books">그림책</a>
			</li>
			
			<li>테크
			<a href="/fund/discover?category=technology">테크</a>
			<a href="/fund/discover?category=software">소프트웨어</a>
			<a href="/fund/discover?category=hardware">하드웨어</a>
			<a href="/fund/discover?category=apps">앱</a>
			<a href="/fund/discover?category=web">웹</a>
			</li>
			
			
			
			<li>테크
			<a href="/fund/discover?category=technology">모든 테크</a>
			<a href="/fund/discover?category=software">소프트웨어</a>
			<a href="/fund/discover?category=hardware">하드웨어</a>
			<a href="/fund/discover?category=apps">앱</a>
			<a href="/fund/discover?category=web">웹</a>
			</li>
			
			
			<li>패션
			<a href="/fund/discover?category=fashion">모든 패션</a>
			<a href="/fund/discover?category=apparels">의류</a>
			<a href="/fund/discover?category=accessories">악세서리</a>
			<a href="/fund/discover?category=beauty">뷰티</a>

			</li>
			
			<li>저널리즘
			<a href="/fund/discover?category=journalism">모든 저널</a>
			<a href="/fund/discover?category=audio-journals">오디오 저널</a>
			<a href="/fund/discover?category=video-journals">비디오 저널</a>
			<a href="/fund/discover?category=web-journals">웹 저널</a>

			</li>
			
			
			
		</ul>
		
		

		
		
	</nav>

	<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>