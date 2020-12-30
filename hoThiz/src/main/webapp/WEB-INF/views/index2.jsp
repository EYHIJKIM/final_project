<!DOCTYPE HTML>
<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>hoTHiz :: 핫디즈</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="assets/css/main.css" />
		 <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<style type="text/css">
	
#bann {
		display:flex;
		
 
  display: -moz-flex;
  display: -webkit-flex;
  display: -ms-flex;
  display: flex;
  

  border-top: 0;
  display: -ms-flexbox;
  height: 35rem !important;
  min-height: 35rem;
  overflow: hidden;
  position: relative;
  text-align: center;
  width: 100%; }
 

 


  @media screen and (max-width: 736px) {
    #bann {
      height: auto !important;
      min-height: 0;
      padding: 4rem 2rem 4rem 2rem; }
      #bann .inner {
        width: 100%; }
      #bann h1 {
        font-size: 1.75rem;
        margin-bottom: 0.5rem;
        padding-bottom: 0; }
      #bann p {
        font-size: 1.25rem; }
      #bann br {
        display: none; }
      #bann .button {
        width: 100%; } }

    
    
    /*
		#bann{
			display:flex;
			

		}
		.slider img{
			display:block;
			width:70%;
			max-width:100%;
			height:auto;
			
		}
		#banTitle{
			height:auto;
			width:30%;
			backgorund:grey;
		
		}
		
		.container{
			width:100%;
			height:auto;
			max-width:1132px;
			margin:0 auto;
			
		
		}
		*/
	#wrap{
		width:100%;
		height:500px;
		margin: 0 auto;
	
	}

		</style>
	</head>
	<body>


<div id="wrap">

		


		<!-- Header -->
			<header id="header">
				
				<nav><a class="search" href="#search"><i class="fa fa-search"></i></a></nav>
				<nav><a class="login" href="#로그인">로그인</a></nav>
				
				<a class="logo" href="index.html">hoThiz</a>
				<nav>
					<a href="#menu">프로젝트 둘러보기</a>
				</nav>
			</header>


<div id="bann"  style="background-image: url('resources/banner/20.jpg')">
		<%-- 
			<article class="slider">
				<img src="resources/banner/10.jpg">
			</article> --%>
				<div id="banTitle">
					타이틀이다
				</div>
		</div>



		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
		
					<li>
					
						<a href="/fund/discover">모든 프로젝트</a>
						<a href="/fund/discover?sort=popular&ongoing=onGoing">인기 추천 프로젝트</a>
						<a href="/fund/discover?maxAchieveRate=99&minAchieveRate=80&sort=endedAt&ongoing=onGoing">성공 임박 프로젝트</a>
						<a href="/fund/discover?sort=publishedAt&ongoing=onGoing">신규 추천 프로젝트</a>
						<a href="/fund/discover?ongoing=prelaunching">공개예정 프로젝트</a>
					
					</li>
					<li>
						<li class="more">
							<a href="#">게임</a>
							<ul class="sub" style="display:none; text-decoration: none;">
								<li><a href="/fund/discover?category=games">게임 전체</a></li>
								<li><a href="/fund/discover?category=mobile-games">모바일 게임</a></li>
								<li><a href="/fund/discover?category=video-games">비디오 게임</a></li>
								<li><a href="/fund/discover?category=board-games">보드게임</a></li>
							</ul>
							
						</li>
						<li class="more"><a href="#">공연</a>
							<ul class="sub" style="display:none; text-decoration: none;">
								<li><a href="/fund/discover?category=show">모든 공연</a></li>
								<li><a href="/fund/discover?category=dance">무용</a></li>
								<li><a href="/fund/discover?category=musical">뮤지컬</a></li>
								<li><a href="/fund/discover?category=theater">연극</a></li>
							</ul>
					
						</li>
						
						</li>

					
					
					
					
					<li><a href="generic.html">Generic</a></li>
				</ul>
			</nav>


			
			
			
			
			
			
			
			
		<!-- Highlights -->
			<section class="wrapper">
				<div class="inner">
					<header class="special">
						<h2>Sem turpis amet semper</h2>
						<p>In arcu accumsan arcu adipiscing accumsan orci ac. Felis id enim aliquet. Accumsan ac integer lobortis commodo ornare aliquet accumsan erat tempus amet porttitor.</p>
					</header>
					<div class="highlights">
						<section>
							<div class="content">
								<header>
									<a href="#" class="icon fa-vcard-o"><span class="label">Icon</span></a>
									<h3>Feugiat consequat</h3>
								</header>
								<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<a href="#" class="icon fa-files-o"><span class="label">Icon</span></a>
									<h3>Ante sem integer</h3>
								</header>
								<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<a href="#" class="icon fa-floppy-o"><span class="label">Icon</span></a>
									<h3>Ipsum consequat</h3>
								</header>
								<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<a href="#" class="icon fa-line-chart"><span class="label">Icon</span></a>
									<h3>Interdum gravida</h3>
								</header>
								<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<a href="#" class="icon fa-paper-plane-o"><span class="label">Icon</span></a>
									<h3>Faucibus consequat</h3>
								</header>
								<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<a href="#" class="icon fa-qrcode"><span class="label">Icon</span></a>
									<h3>Accumsan viverra</h3>
								</header>
								<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
							</div>
						</section>
					</div>
				</div>
			</section>

		<!-- CTA -->
			<section id="cta" class="wrapper">
				<div class="inner">
					<h2>Curabitur ullamcorper ultricies</h2>
					<p>Nunc lacinia ante nunc ac lobortis. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus ornare mi ut ante amet placerat aliquet. Volutpat eu sed ante lacinia sapien lorem accumsan varius montes viverra nibh in adipiscing. Lorem ipsum dolor vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing sed feugiat eu faucibus. Integer ac sed amet praesent. Nunc lacinia ante nunc ac gravida.</p>
				</div>
			</section>

		<!-- Testimonials -->
			<section class="wrapper">
				<div class="inner">
					<header class="special">
						<h2>Faucibus consequat lorem</h2>
						<p>In arcu accumsan arcu adipiscing accumsan orci ac. Felis id enim aliquet. Accumsan ac integer lobortis commodo ornare aliquet accumsan erat tempus amet porttitor.</p>
					</header>
					<div class="testimonials">
						<section>
							<div class="content">
								<blockquote>
									<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
								</blockquote>
								<div class="author">
									<div class="image">
										<img src="images/pic01.jpg" alt="" />
									</div>
									<p class="credit">- <strong>Jane Doe</strong> <span>CEO - ABC Inc.</span></p>
								</div>
							</div>
						</section>
						<section>
							<div class="content">
								<blockquote>
									<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
								</blockquote>
								<div class="author">
									<div class="image">
										<img src="images/pic03.jpg" alt="" />
									</div>
									<p class="credit">- <strong>John Doe</strong> <span>CEO - ABC Inc.</span></p>
								</div>
							</div>
						</section>
						<section>
							<div class="content">
								<blockquote>
									<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
								</blockquote>
								<div class="author">
									<div class="image">
										<img src="images/pic02.jpg" alt="" />
									</div>
									<p class="credit">- <strong>Janet Smith</strong> <span>CEO - ABC Inc.</span></p>
								</div>
							</div>
						</section>
					</div>
				</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<div class="content">
						<section>
							<h3>Accumsan montes viverra</h3>
							<p>Nunc lacinia ante nunc ac lobortis. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus ornare mi ut ante amet placerat aliquet. Volutpat eu sed ante lacinia sapien lorem accumsan varius montes viverra nibh in adipiscing. Lorem ipsum dolor vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing sed feugiat eu faucibus. Integer ac sed amet praesent. Nunc lacinia ante nunc ac gravida.</p>
						</section>
						<section>
							<h4>Sem turpis amet semper</h4>
							<ul class="alt">
								<li><a href="#">Dolor pulvinar sed etiam.</a></li>
								<li><a href="#">Etiam vel lorem sed amet.</a></li>
								<li><a href="#">Felis enim feugiat viverra.</a></li>
								<li><a href="#">Dolor pulvinar magna etiam.</a></li>
							</ul>
						</section>
						<section>
							<h4>Magna sed ipsum</h4>
							<ul class="plain">
								<li><a href="#"><i class="icon fa-twitter">&nbsp;</i>Twitter</a></li>
								<li><a href="#"><i class="icon fa-facebook">&nbsp;</i>Facebook</a></li>
								<li><a href="#"><i class="icon fa-instagram">&nbsp;</i>Instagram</a></li>
								<li><a href="#"><i class="icon fa-github">&nbsp;</i>Github</a></li>
							</ul>
						</section>
					</div>
					<div class="copyright">
						&copy; Untitled. Photos <a href="https://unsplash.co">Unsplash</a>, Video <a href="https://coverr.co">Coverr</a>.
					</div>
				</div>
			</footer>
</div>
		<!-- Scripts -->

  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

<script>


	/*------- Swiper Slider -------*/
	       var swiper = new Swiper('.swiper-container', {
	        pagination: '.swiper-pagination',
	        nextButton: '.swiper-button-next',
	        prevButton: '.swiper-button-prev',
	        paginationClickable: true,
	        centeredSlides: true,
	        autoplay: 3500,
	           speed: 1500,
	           loop: true,
	        autoplayDisableOnInteraction: false
	    });








$(".more").click(function(){
	if($(this).find(".sub").is(":visible")){
		$(this).find(".sub").slideUp();
	} 
	else{
		$(this).find(".sub").slideDown();
	}
	
	
});	

</script>
	</body>
</html>