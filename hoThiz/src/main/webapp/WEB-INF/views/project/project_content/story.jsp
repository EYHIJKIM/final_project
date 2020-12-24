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
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
/*
import Vue from 'vue'
import App from './App.vue'
Kakao.init("4a910cfb1ef1434f4c361ae507d1375a");

new Vue({
	render: h => h(App),
}).$mount('#app')
	
	export default {
		  name: "App",
		  data(){
			  return{
				  feedSettings:{
					  objectType: "feed",
					  content:{
						  title: '전소연 천재',
						  description: '전소연 천재입니다 아십니까??당장 아이들 앨범을 사십시오 ',
						  imageUrl: "http://localhost:8086/fund/resources/project/224.jpg",
						  link: {
						      mobileWebUrl: 'https://localhost:8086/fund/discover/${prj.project_id}',
					 	  },
				  		},
		  
		  social: {
		    likeCount: ${prj.project_like},
		    commentCount: 20,
		    sharedCount: 30,
		  },
		  buttons: [
		    {
		      title: '웹으로 이동',
		      link: {
		        mobileWebUrl: 'https://localhost:8086/fund/discover/${prj.project_id}',
		      },
		    },
		    {
		      title: '앱으로 이동',
		      link: {
		        mobileWebUrl: 'https://localhost:8086/fund/discover/${prj.project_id}',
		      },
		    },
		  ],
		},
	  };
    },
	mounted(){
    	Kakao.Link.createDefaultButton(
    		Object.assign({},this.feedSettings,{container:".kakao-link"}) 
    		//이거는 버튼사용하는 법. 이걸로 할 경우 container를 settings부분에 추가해준다.
  
    	);  
    },
	methods:{
		share(){
			Kakao.Link.sendDefault(this.feedSettings);
		},	
	},	  
};
*/
Kakao.init("4a910cfb1ef1434f4c361ae507d1375a");
function sendLink(){
	console.log("샌드링크 들어옴");
	var like = '${prj.project_like}';
	var id = '${prj.project_id}';
	
	Kakao.Link.createDefaultButton({
		
		  container: '.kakao-link-btn',
		  objectType: 'feed',
		  content: {
		    title: '${prj.project_title}',
		    description: '${prj.project_summary}',
		    imageUrl:
		      'http://localhost:8086/fund/resources/project/224.jpg',
		    link: {
		      mobileWebUrl: "http://localhost:8086/fund/discover/224",
		      androidExecParams: 'test',
		    },
		  },
		  social: {
		    likeCount: like,
		    commentCount: 20,
		    sharedCount: 30,
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

<c:set var="path" value="/fund/resources" />
<c:set var="mem" value="${memberInfo}"/>
<c:set var="prj" value="${projectInfo}" />
<c:set var="day" value="${dDayInfo}"/>


<h2>${prj.project_id}번 게시물 일수: ${day.chk}</h2>

<c:if test="${day.chk>='0'}">
	<h1>이건 진행중인 프로젝트 상세보기 첫화면</h1>
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
	남은 시간<br>${prj.project_deadline}
	
	<br>
	후원자${donatedMemberCnt}<br>
	<button id="pushPrj">프로젝트 밀어주기</button><br><!-- 비동기로 내려가서 선물선택 보도록. -->
	<button id="likeBtn">좋아요 버튼</button><br>
	
	<!--  
	
	<button id="modalBtn">공유 버튼</button>
	<div class="blackBg"></div>
	<div class="modalWrap">
			<div class="modalClose"><a herf="#">close</a></div>
			<div class="shredContent">
				
				뭐시기
				저시기
			</div>
	</div>
	<hr>
	-->	

	





	

	<a href="#스토리">스토리</a>
	<a href="#라이브">라이브</a>
	<a href="#펀딩안내">펀딩안내</a>
	
<hr>
	

<br>
여기는 프로젝트 내용...
	->배너 사진은 pj에서 뽑아온 picture로 해야한다.


1. 처음 상세정보 들어오면 주소값 ___/게시글번호/ref=discover,,,추천프로젝트..이런거 뜸.<br>
2. 스토리 /커뮤니티/ 펀딩안내 탭  -> 이때부터 주소값 바뀜<br>


결제창 넘어갈때의 파라미터 이름 => 이거 로그인 안해있으면 로그인창으로 넘겨야함
money=10000&project_id=5&project_title=%`




아래 푸터에는 해당 동일 대분류 뽑아냄.-> popular기준으로 할까싶음...<br>
</c:if>
${day.prelaunching_dat}
<c:if test="${day.chk<'0'}">
<h1>공개예정인 경우</h1>

</c:if>


<c:if test="${day.dead<'0'}">
<h1>펀딩 끝남!!</h1>
${prj.project_release_date}에 결제 진행됨
</c:if>


<!-- 공유 버튼은 둘다 있음~ -->
<button class="kakao-link-btn" onclick="sendLink()">카톡 공유</button>


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