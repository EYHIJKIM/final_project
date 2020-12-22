<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


</style>
</head>
<body>

	<h1>이게 프로젝트 상세보기 첫화면</h1>

<c:set var="prj" value="${projectInfo}" />
	<a href="/discover/category=${prj.project_main_category}">x
		${prj.project_main_category}</a>
	<h1>${prj.project_title}</h1>
	<a href="#멤버프로필로 고">
	프로필 사진+멤버 아이디
	</a><br>
	
	
	<img src="${prj.project_main_image}">
	
	
	모인금액<br> ${prj.project_current_donated}<br>
	남은 시간<br> ${prj. }
	
	<br>
	후원자<br><!-- 시발 이것도..따로 mv에 추가해줘야할듯.. 어ㅏ피 멤버도 얻어야함.-->
	
	
	펀딩 진행중<br>
	목표금액인 ${prj.project_target_price }원이 모여야만 결제됩니다.
	결제는 ${prj.project_deadline}에 다함께 진행됩니다.
	<button onclick>프로젝트 밀어주기</button><br><!-- 비동기로 내려가서 선물선택 보도록. -->
	<button>좋아요 버튼</button><br>
	<button>공유 버튼</button><br><!-- 창 띄우고 공유하기 API -->
	
	<a href="#스토리">스토리</a>
	<a href="#라이브">라이브</a>
	<a href="/fund/discover/${prj.project_id}/community">펀딩안내</a>
	
	


	

<br>
------------헤더는 배너까지--------------
	->배너 사진은 pj에서 뽑아온 picture로 해야한다.


1. 처음 상세정보 들어오면 주소값 ___/게시글번호/ref=discover,,,추천프로젝트..이런거 뜸.
2. 스토리 /커뮤니티/ 펀딩안내 탭  -> 이때부터 주소값 바뀜


결제창 넘어갈때의 파라미터 이름
money=10000&project_id=5&project_title=%





아래 푸터에는 해당 동일 대분류 뽑아냄.-> popular기준으로 할까싶음...

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