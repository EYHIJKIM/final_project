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
</head>
<body class="is-preload">
<%String jspPath = "/fund/WebContent/WEB-INF/views/"; %>


	<header id="header">
		<a class="logo" href="/fund/">Industrious</a>
		<nav>
			<a href="#menu">Menu</a>
		</nav>
		
		
		
		<!-- 
			여기 로그인 버튼, 세션 처리 해야됨..(로그인한경우 버튼 달라지게)
		
		 -->
		
		
	</header>

	<nav id="menu">
		<ul class="links">
			
			<!-- 프로젝트마다 태그를 파라미터로 묻혀서 보내줌. -->
			<li><a href="/fund/discover">모든 프로젝트</a>
			<a href="/fund/discover?sort=popular&ongoing=onGoing">인기 추천 프로젝트</a>
			<a href="/fund/discover?maxAchieveRate=99&minAchieveRate=80&sort=endedAt&ongoing=onGoing">성공 임박 프로젝트</a>
			<a href="/fund/sort=publishedAt&ongoing=onGoing">신규 추천 프로젝트</a>
			<a href="/fund/ongoing=prelaunching">공개예정 프로젝트</a>
			</li>
			<hr>
			<li>
			<a href="/fund/discover?category=games">모든 게임</a>
			</li>
			
			
			<li><a href="/fund/discover?category=show">모든 공연</a></li>
			<li></li>
			<li></li>
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