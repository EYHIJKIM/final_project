<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>핫디즈 :: hoThiz</title>

  <!-- Bootstrap core CSS -->
  

  <!-- Custom styles for this template   -->
  
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--     <link href="resources/css/heroic-features.css" rel="stylesheet">
   <link href="resources/css/shop-homepage.css" rel="stylesheet"> -->


   
   <!-- 목록 카드 css -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
  
  
   
<style type="text/css">


i {color:#bfbdb3;padding-right:5px;}
h4 {font-weight:600;color:#696969;}
a{color:#dd0000;}
a:hover {text-decoration:none;}

/******************** CARD CSS *******************/
.card{box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 100%;
    border-radius: 0px;
    text-transform:Capitalize;
}
.card:hover {box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);}
.card-block {padding:15px;}
.card-footer {border-top: 1px solid #e2e2e2; padding-top:1px;}
.card-img {
	border-radius: 0px 0px 0 0;max-height:150px;overflow: hidden;
			}
.margin-t-10 {margin-top:8px;}


/*******************카드 css 긁어옴***********************/


.img-responsive,.thumbnail>img,.thumbnail a>img,.carousel-inner>.item>img,.carousel-inner>.item>a>img{display:block;max-width:100%;height:auto}.img-rounded{border-radius:6px}.img-thumbnail{display:inline-block;max-width:100%;height:auto;padding:4px;line-height:1.42857143;background-color:#fff;border:1px solid #ddd;border-radius:4px;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;transition:all .2s ease-in-out}.img-circle{border-radius:50%}hr{margin-top:20px;margin-bottom:20px;border:0;border-top:1px solid #eee}

.nav>li>a>img{max-width:none}
.navbar-brand>img{display:block}
.thumbnail>img,.thumbnail a>img{margin-right:auto;margin-left:auto}a.thumbnail:hover,a.thumbnail:focus,a.thumbnail.active{border-color:#428bca}.thumbnail .caption{padding:9px;color:#333}.alert{padding:15px;margin-bottom:20px;border:1px solid transparent;border-radius:4px}
.carousel-inner>.item>img,.carousel-inner>.item>a>img{line-height:1}



.likeBtn{
    border: none;
    outline:none;
    background-color: white;

}


.img-fluid {
  max-width: 100%;
  height: auto;
  object-fit: fill;
  margin:0 auto;
}

.bannerTitle{
	height: 20%;
	width:100%;
	background-color: #17a2b8;
	position: relative;
	margin:0 auto;
	line-height: 50%;
	
}
#banner{
	width:100%;
	/*flex-flow:column;*/
	text-align: center;
	line-height: 50%;
}



.jumbotron {
  width : 100%;
  padding: 0 0 0 0;
  background-color: white;
  border-radius: 0.3rem;
  margin:0 0 0 0;
}


.img-likeBtn{
	 background: url( "resources/img/blankHeart.png" ) no-repeat;
	 border: none;
        width: 35px;
        height: 35px;
        cursor: pointer;
        position : absolute;
        
 
}
.img-cancelLikeBtn{
	 background: url( "resources/img/fullHeart.png" ) no-repeat;
	 border: none;
        width: 35px;
        height: 35px;
        cursor: pointer;
         position : absolute;
  
}

img{
 cursor: pointer;
}

/*********드롭다운***********/

.dropdown-submenu {
    position: relative;
}

.dropdown-submenu>.dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: -6px;
    margin-left: -1px;
    -webkit-border-radius: 0 6px 6px 6px;
    -moz-border-radius: 0 6px 6px;
    border-radius: 0 6px 6px 6px;
    
    position:absolute;
}

.dropdown-submenu:hover>.dropdown-menu {
    display: block;
    position:absolute;
}

.dropdown-submenu>a:after {
    display: block;
    content: " ";
    float: right;
    width: 0;
    height: 0;
    border-color: transparent;
    border-style: solid;
    border-width: 5px 0 5px 5px;
    border-left-color: #ccc;
    margin-top: 5px;
    margin-right: -10px;

}

.dropdown-submenu:hover>a:after {
    border-left-color: #fff;
}

.dropdown-submenu.pull-left {
    float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
    left: -100%;
    margin-left: 10px;
    -webkit-border-radius: 6px 0 6px 6px;
    -moz-border-radius: 6px 0 6px 6px;
    border-radius: 6px 0 6px 6px;
}
body{
    padding:10px;
}

.show-on-hover:hover > ul.dropdown-menu {
    display: block;    
}


.conForm > input[type=text] {
width: 30%; 

}


.dropdown-item{
 list-style:none;

}





@media (min-width: 768px) {








	#banner{
		display:flex;
		
	}
	
	.bannerTitle{
	width:40%;
	background-color: pink;
	height:auto;
	position: relative;
	
}
.img-fluid {
  max-width: 60%;
  height: auto;
  object-fit: fill;
  cursor:pointer;
}
.jumbotron {
  width : 100%;
  padding: 0 0 0 0;
  background-color: white;
  border-radius: 0.3rem;
  margin:0 0 0 0;
}


	
	
}




</style>
</head>


<body>




<%-- 
{userId} 세션 없으면 -> 좋아요 누르면 로그인창으로 보낸다.
--%>



  <!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="">hoThiz</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor02">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">로그인
          <span class="sr-only">(current)</span>
        </a>
      </li>
      
   <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
        프로젝트 둘러보기</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="/fund/discover">모든 프로젝트</a>
          <a class="dropdown-item" href="/fund/discover?sort=popular">인기 프로젝트</a>
          <a class="dropdown-item" href="/fund/discover?ongoing=ongoing&maxAchieveRate=99&minAchieveRate=80">성공 임박 프로젝트</a>
          <a class="dropdown-item" href="/fund/discover?sort=publishedAt&ongoing=ongoing">신규 추천 프로젝트</a>
          <a class="dropdown-item" href="/fund/discover?ongoing=prelaunching">공개예정 프로젝트</a>
          
          
          <div class="dropdown-divider"></div>

     <ul class="dropdown-item" role="menu"> 
	    <li id="game" class="dropdown-submenu"> 
	      <a class="dropdown-item">게임</a>
	      
	       <ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=game">모든 게임</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=mobile-game">모바일 게임</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=video-game">비디오 게임</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=board-game">보드 게임</a></li>
	       </ul>       
    	
    	
    	</li>
   
    </ul>
      
          
		<ul class="dropdown-item" role="menu">
		  <li id="show" class="dropdown-submenu">
			<a class="dropdown-item">공연</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=show">모든 공연</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=dance">무용</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=musical">뮤지컬</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=theater">공연</a></li>
	       </ul>   
		</li>
		</ul>

          
       		
       		  
		<ul class="dropdown-item" role="menu">
		  <li id="design" class="dropdown-submenu">
			<a class="dropdown-item">디자인</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=design">모든 디자인</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=architecture">건축, 공간</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=graphic-design">그래픽 디자인</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=product-design">제품 디자인</a></li>
	       </ul>   
		</li>
		</ul>
  

          <ul class="dropdown-item" role="menu">
		  <li id="comics" class="dropdown-submenu">
			<a class="dropdown-item">만화</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=comics">모든 만화</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=web-comics">웹툰</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=comic-books">만화책</a></li>
	       		
	       </ul>   
		  </li>
		</ul>
          
          
          <ul class="dropdown-item" role="menu">
		  <li id="art" class="dropdown-submenu">
			<a class="dropdown-item">예술</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=art">모든 예술</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=exhibitions">전시</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=sculpture-and-action-figures">조소&피규어</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=illustration">일러스트레이션</a></li>
	       </ul>   
		  </li>
		</ul>
          
          
          
          
          
              <ul class="dropdown-item" role="menu">
		  <li id="crafts" class="dropdown-submenu">
			<a class="dropdown-item">공예</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=crafts">모든 공예</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=ecandles-and-diffusers-and-soaps">캔들&조향&비누</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=leather-and-metal-and-woodworking">가죽&금속&목 공예</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=pottery">도예</a></li>
	       </ul>   
		  </li>
		</ul>
          
          
              <ul class="dropdown-item" role="menu">
		  <li class="dropdown-submenu">
			<a class="dropdown-item">사진</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=photography">모든 사진</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=people-photography">인물</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=space-and-urban-photography">배경</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=animals-photography">동물</a></li>
	       </ul>   
		  </li>
		</ul>
		
		
		   <ul class="dropdown-item" role="menu">
		  <li class="dropdown-submenu">
			<a class="dropdown-item">영상</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=video">모든 영상</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=film">영화</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=documentary">다큐멘터리</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=animation">애니메이션</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=music-videos">뮤직비디오</a></li>
	       </ul>   
		  </li>
		</ul>
		
		
		   <ul class="dropdown-item" role="menu">
		  <li class="dropdown-submenu">
			<a class="dropdown-item">음식</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=food">모든 음식</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=appetizer">에피타이저</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=main-dish">메인디쉬</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=dessert">디저트</a></li>
	       </ul>   
		  </li>
		</ul>
		
		
             <ul class="dropdown-item" role="menu">
		  <li class="dropdown-submenu">
			<a class="dropdown-item">음악</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=music">모든 음악</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=classical-music">클래식</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=popular-music">대중음악</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=independent-music">인디음악</a></li>
	       </ul>   
		  </li>
		</ul>
          
 
 			   <ul class="dropdown-item" role="menu">
		  <li class="dropdown-submenu">
			<a class="dropdown-item">출판</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=publication">모든 출판</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=zines">잡지</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=literature-and-essay">문학&에세이</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=picture-books">그림책</a></li>
	       </ul>   
		  </li>
		</ul>
 
 
 
 	   <ul class="dropdown-item" role="menu">
		  <li class="dropdown-submenu">
			<a class="dropdown-item">테크</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=technology">모든 테크</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=software">소프트웨어</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=hardware">하드웨어</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=apps">앱</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=web">웹</a></li>
	       </ul>   
		  </li>
		</ul>
 
 
 		 <ul class="dropdown-item" role="menu">
		  <li class="dropdown-submenu">
			<a class="dropdown-item">패션</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=fashion">모든 테크</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=apparels">소프트웨어</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=accessories">하드웨어</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=beauty">앱</a></li>

	       </ul>   
		  </li>
		</ul>
		
		
		
		 		 <ul class="dropdown-item" role="menu">
		  <li class="dropdown-submenu">
			<a class="dropdown-item">저널</a>
			
			<ul class="dropdown-menu">
	       		<li><a class="dropdown-item" href="/fund/discover?category=journalism">모든 테크</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=audio-journals">오디오 저널</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=video-journals">비디오 저널</a></li>
	       		<li><a class="dropdown-item" href="/fund/discover?category=web-journals">웹 저널</a></li>

	       </ul>   
		  </li>
		</ul>
		
		
 
 
 
 
          
        </div>
 
   
  
    </ul>

    
    
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>











  <%--------------------------------배너----------------------------------------------%>

  <!-- Page Content -->
  <div class="container">

    <!-- 배너요 -->
    <header class="jumbotron my-4">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">


				
		            <div class="carousel-item active">
		            	<div id="banner">

				              <img class="d-block img-fluid" src="resources/banner/${bannerMap.banner0.project_main_image}" alt="First slide" onclick="goProject('${bannerMap.banner0.project_id}')">
			            	  	<div class="bannerTitle">
			            	  		
			        				<h1>${bannerMap.banner0.project_title }</h1>
			        				<h3>${bannerMap.banner0.project_summary }</h3>
		        				</div>
		        		
	        			</div>
			 		</div>
	            
	            
	            <div class="carousel-item">
		           <div id="banner">

			              <img class="d-block img-fluid" src="resources/banner/${bannerMap.banner1.project_main_image}" alt="Second slide" onclick="goProject('${bannerMap.banner1.project_id}')">
			            		<div class="bannerTitle">
		        					<h1>${bannerMap.banner1.project_title }</h1>
		        					<h3>${bannerMap.banner1.project_summary }</h3>
		        				</div>
		        
	        		</div>
	            </div>


				 <div class="carousel-item">
		           <div id="banner">
			
			              <img class="d-block img-fluid" src="resources/banner/${bannerMap.banner2.project_main_image}" alt="Second slide" onclick="goProject('${bannerMap.banner2.project_id}')">
			            		<div class="bannerTitle">
		        					<h1>${bannerMap.banner2.project_title }</h1>
		        					<h3>${bannerMap.banner2.project_summary }</h3>
		        				</div>
		        		
	        		</div>
	            </div>

          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        
        
</div>

    </header>
	
	
	
	
	

  <%--------------------------------리스트---------------------------------------%>


<c:set var="path" value="resources/project" />




<h3><a href="/fund/discover?sort=popular">인기 프로젝트</a></h3>

 <div class="row text-center">


 <c:set var="loop" value="false"/>
<c:forEach var="popular" items="${popularList}" varStatus="var">

	<c:if test="${not loop}">
	    <div class="col-md-3">
	        <div class="card">
	            <div class="card-img">
	                <img class="img-responsive" src="${path}/${popular.project_main_image}" onclick="goProject('${popular.project_id}')">
	            </div>
	            
	            
	            <%--좋아요  --%>
	           	 <c:set var="flag" value="false" />
	                <c:forEach var="likeId" items="${likeList}">
						<c:if test="${likeId eq popular.project_id}">
							<c:set var="flag" value="true" />
						</c:if>		
					</c:forEach>
					
					
		<c:if test="${flag}">
			<button id="likeBtn${popular.project_id}" class="likeBtn" onClick="MyFavoritProject('${popular.project_id}')">
				<img class="likeImg" src="resources/img/fullHeart.png">
			</button>
				
		</c:if>
		<c:if test="${not flag}">
			<button id="likeBtn${popular.project_id}" class="likeBtn" onClick="MyFavoritProject('${popular.project_id}')">
				<img class="likeImg" src="resources/img/blankHeart.png">
			</button>		
		</c:if>
		
		
		
	            <div class="card-block">
	               <div class="card-title">
	                    <small><a href="/fund/discover?category=${popular.project_sub_category}">${popular.project_sub_category}</a> | <a href="fund/u?member_url=${memberMap[popular.project_id].member_URL}">${memberMap[popular.project_id].member_name}</a></small>
	                    <h4><a href="/fund/discover/${popular.project_id}">${popular.project_title}</a></h4>
	                    <p>${popular.project_summary}<br>
	                    ${popular.project_current_percent}% 달성</p>
	                </div>
				
				
				</div>
				
				
			</div>
		</div>
	</c:if>
	
			<c:if test="${var.index eq 3 }">
		  	  <c:set var="loop" value="true"/>
		   </c:if>


</c:forEach>





</div>   

<div style="width:100%;margin:1em;"></div>


 <div class="row text-center">			
 <c:set var="loop" value="true"/>
<c:forEach var="popular" items="${popularList}" varStatus="var">
		 <c:if test="${var.index > 3}">
		  	  <c:set var="loop" value="false"/>
		 </c:if>

		<c:if test="${not loop}">
		
		    <div class="col-md-3">
	        <div class="card">
	            <div class="card-img">
	                <img class="img-responsive" src="${path}/${popular.project_main_image}" onclick="goProject('${popular.project_id}')">
	            </div>
	                 <%--좋아요  --%>
	           	 <c:set var="flag" value="false" />
	                <c:forEach var="likeId" items="${likeList}">
						<c:if test="${likeId eq popular.project_id}">
							<c:set var="flag" value="true" />
						</c:if>		
					</c:forEach>
					
					
		<c:if test="${flag}">
			<button id="likeBtn${popular.project_id}" class="likeBtn" onClick="MyFavoritProject('${popular.project_id}')">
				<img class="likeImg" src="resources/img/fullHeart.png">
			</button>
				
		</c:if>
		<c:if test="${not flag}">
			<button id="likeBtn${popular.project_id}" class="likeBtn" onClick="MyFavoritProject('${popular.project_id}')">
				<img class="likeImg" src="resources/img/blankHeart.png">
			</button>		
		</c:if>
		
	               
	               
	            <div class="card-block">
	                <div class="card-title">
	                    <small><a href="/fund/discover?category=${popular.project_sub_category}">${popular.project_sub_category}</a> | <a href="fund/u?member_url=${memberMap[popular.project_id].member_URL}">${memberMap[popular.project_id].member_name}</a></small>
	                    <h4><a href="/fund/discover/${popular.project_id}">${popular.project_title}</a></h4>
	                    <p>${popular.project_summary}<br>
	                    ${popular.project_current_percent}% 달성</p>
	                </div>
				</div>
			</div>
		</div>
	      
	      
	      
	      
	      
	    </c:if>
		  
</c:forEach>
</div>  <%--인기 프로젝트끝 --%>



	               
<div style="width:100%;margin:3em;"></div>




<h3><a href="/fund/discover?ongoing=prelaunching">공개예정 프로젝트</a></h3>

 <div class="row text-center">


 <c:set var="loop" value="false"/>
<c:forEach var="pre" items="${prelaunchingList}" varStatus="var">

	<c:if test="${not loop}">
	    <div class="col-md-3">
	        <div class="card">
	            <div class="card-img">
	                <img class="img-responsive" src="${path}/${pre.project_main_image}" onclick="goProject('${pre.project_id}')">
	            </div>
	            <div class="card-block">
	                <div class="card-title">
	                
	                    <small>
	                    <a href="/fund/discover?category=${pre.project_sub_category}">
	                    	<span id="subCategory" onload="setTag(this,'${pre.project_sub_category}')">${pre.project_sub_category}</span> </a> 
	                    | <a href="fund/u?member_url=${memberMap[pre.project_id].member_URL}">${memberMap[pre.project_id].member_name}</a></small>
	                    <h4><a href="/fund/discover/${pre.project_id}">${pre.project_title}</a></h4>
	                    <p>${pre.project_summary}</p>
	                    <p class="percent" >${pre.project_current_percent}% 달성</p>
	                </div>
				</div>
			</div>
			
					<div class="card-footer">   
			
	                   <c:set var="msg" value="알림신청" />
	                   <ul class="list-inline">
	                   <li>${alarmCntMap[pre.project_id]} 명 알람 신청중</li>
			</ul>
				
	    </div>
			
			
		</div>
	</c:if>
	
			<c:if test="${var.index eq 3 }">
		  	  <c:set var="loop" value="true"/>
		   </c:if>


</c:forEach>

</div>   

<div style="width:100%;margin:1em;"></div>


 <div class="row text-center">			
 <c:set var="loop" value="true"/>
<c:forEach var="pre" items="${prelaunchingList}" varStatus="var">
		 <c:if test="${var.index>3}">
		  	  <c:set var="loop" value="flase"/>
		 </c:if>

		<c:if test="${not loop}">
		
		    <div class="col-md-3">
	        <div class="card">
	            <div class="card-img">
	                <img class="img-responsive" src="${path}/${pre.project_main_image}" onclick="goProject('${pre.project_id}')">
	            </div>

	            <div class="card-block">
	                <div class="card-title">
	                    <small><a href="/fund/discover?category=${pre.project_sub_category}">${pre.project_sub_category}</a> | <a href="fund/u?member_url=${memberMap[pre.project_id].member_URL}">${memberMap[pre.project_id].member_name}</a></small>
	                    <h4><a href="/fund/discover/${pre.project_id}">${pre.project_title}</a></h4>
	                    <p>${pre.project_summary}<br>
	                    ${pre.project_current_percent}% 달성</p>
	                </div>
				</div>
		<div class="card-footer">   

	                   <c:set var="msg" value="알림신청" />
	                   
				<c:forEach var="alarmId" items="${alarmList}"> 
					<c:if test="${alarmId eq pre.project_id}">
						<c:set var="msg" value="알림신청완료" />
					</c:if>
				</c:forEach>
	
				<button class="btn btn-secondary my-2 my-sm-0" id="notificationBtn" onClick="MyAlarmProject('${pre.project_id}')">
					<p id="notiBtn${pre.project_id}">${msg}</p>
				</button>
			
				
	    </div>
	               
	           
	            
	        </div>
	    </div>
	      
	      
	      
	      
	      
	    </c:if>
		  
</c:forEach>

</div> <%-------------공개예정 끝-------- --%> 


<div style="width:100%;margin:3em;"></div>




<h3><a href="/fund/discover?sort=publishedAt">최신 프로젝트</a></h3>

<div class="row text-center">


 <c:set var="loop" value="false"/>
<c:forEach var="pub" items="${publishedAtList}" varStatus="var">

	<c:if test="${not loop}">
	    <div class="col-md-3">
	        <div class="card">
	            <div class="card-img">
	                <img class="img-responsive" src="${path}/${pub.project_main_image}" onclick="goProject('${pub.project_id}')">
	            </div>
	            
	            
	            <%--좋아요  --%>
	           	 <c:set var="flag" value="false" />
	                <c:forEach var="likeId" items="${likeList}">
						<c:if test="${likeId eq pub.project_id}">
							<c:set var="flag" value="true" />
						</c:if>		
					</c:forEach>
					
					
		<c:if test="${flag}">
			<button id="likeBtn${pub.project_id}" class="likeBtn" onClick="MyFavoritProject('${pub.project_id}')">
				<img class="likeImg" src="resources/img/fullHeart.png">
			</button>
				
		</c:if>
		<c:if test="${not flag}">
			<button id="likeBtn${pub.project_id}" class="likeBtn" onClick="MyFavoritProject('${pub.project_id}')">
				<img class="likeImg" src="resources/img/blankHeart.png">
			</button>		
		</c:if>
		
		
		
	            <div class="card-block">
	               <div class="card-title">
	                    <small><a href="/fund/discover?category=${pub.project_sub_category}">${pub.project_sub_category}</a> | <a href="fund/u?member_url=${memberMap[pub.project_id].member_URL}">${memberMap[pub.project_id].member_name}</a></small>
	                    <h4><a href="/fund/discover/${pub.project_id}">${pub.project_title}</a></h4>
	                    <p>${pub.project_summary}<br>
	                    ${pub.project_current_percent}% 달성</p>
	                </div>
				
				
				</div>
				
				
			</div>
		</div>
	</c:if>
	
			<c:if test="${var.index eq 3 }">
		  	  <c:set var="loop" value="true"/>
		   </c:if>


</c:forEach>
</div>




<div style="width:100%;margin:1em;"></div>


 <div class="row text-center">			
 <c:set var="loop" value="true"/>
<c:forEach var="pub" items="${publishedAtList}" varStatus="var">
		 <c:if test="${var.index > 3}">
		  	  <c:set var="loop" value="false"/>
		 </c:if>

		<c:if test="${not loop}">
		
		    <div class="col-md-3">
	        <div class="card">
	            <div class="card-img">
	                <img class="img-responsive" src="${path}/${pub.project_main_image}" onclick="goProject('${pub.project_id}')">
	            </div>
	                 <%--좋아요  --%>
	           	 <c:set var="flag" value="false" />
	                <c:forEach var="likeId" items="${likeList}">
						<c:if test="${likeId eq pub.project_id}">
							<c:set var="flag" value="true" />
						</c:if>		
					</c:forEach>
					
					
		<c:if test="${flag}">
			<button id="likeBtn${pub.project_id}" class="likeBtn" onClick="MyFavoritProject('${pub.project_id}')">
				<img class="likeImg" src="resources/img/fullHeart.png">
			</button>
				
		</c:if>
		<c:if test="${not flag}">
			<button id="likeBtn${pub.project_id}" class="likeBtn" onClick="MyFavoritProject('${pub.project_id}')">
				<img class="likeImg" src="resources/img/blankHeart.png">
			</button>		
		</c:if>
		
	               
	               
	            <div class="card-block">
	                <div class="card-title">
	                    <small><a href="/fund/discover?category=${pub.project_sub_category}">${pub.project_sub_category}</a> | <a href="fund/u?member_url=${memberMap[pub.project_id].member_URL}">${memberMap[pub.project_id].member_name}</a></small>
	                    <h4><a href="/fund/discover/${popular.project_id}">${popular.project_title}</a></h4>
	                    <p>${pub.project_summary}<br>
	                    ${pub.project_current_percent}% 달성</p>
	                </div>
				</div>
			</div>
		</div>
	      
	      
	      
	      
	      
	    </c:if>
		  
</c:forEach>
</div>  <%--최신 프로젝트끝 --%>


	               
<div style="width:100%;margin:3em;"></div>






<h3><a href="/fund/discover?minAchieveRate=80&maxAchieveRate=99&sort=endedAt&ongoing=ongoing">성공임박 프로젝트</a></h3>

<div class="row text-center">


 <c:set var="loop" value="false"/>
<c:forEach var="end" items="${endedAtList}" varStatus="var">

	<c:if test="${not loop}">
	    <div class="col-md-3">
	        <div class="card">
	            <div class="card-img">
	                <img class="img-responsive" src="${path}/${end.project_main_image}" onclick="goProject('${end.project_id}')">
	            </div>
	            
	            
	            <%--좋아요  --%>
	           	 <c:set var="flag" value="false" />
	                <c:forEach var="likeId" items="${likeList}">
						<c:if test="${likeId eq end.project_id}">
							<c:set var="flag" value="true" />
						</c:if>		
					</c:forEach>
					
					
		<c:if test="${flag}">
			<button id="likeBtn${end.project_id}" class="likeBtn" onClick="MyFavoritProject('${end.project_id}')">
				<img class="likeImg" src="resources/img/fullHeart.png">
			</button>
				
		</c:if>
		<c:if test="${not flag}">
			<button id="likeBtn${end.project_id}" class="likeBtn" onClick="MyFavoritProject('${end.project_id}')">
				<img class="likeImg" src="resources/img/blankHeart.png">
			</button>		
		</c:if>
		
		
		
	            <div class="card-block">
	               <div class="card-title">
	                    <small><a href="/fund/discover?category=${end.project_sub_category}">${end.project_sub_category}</a> | <a href="fund/u?member_url=${memberMap[end.project_id].member_URL}">${memberMap[end.project_id].member_name}</a></small>
	                    <h4><a href="/fund/discover/${end.project_id}">${end.project_title}</a></h4>
	                    <p>${end.project_summary}<br>
	                    ${end.project_current_percent}% 달성</p>
	                </div>
				
				
				</div>
				
				
			</div>
		</div>
	</c:if>
	
			<c:if test="${var.index eq 3 }">
		  	  <c:set var="loop" value="true"/>
		   </c:if>


</c:forEach>





</div>   

<div style="width:100%;margin:1em;"></div>


 <div class="row text-center">			
 <c:set var="loop" value="true"/>
<c:forEach var="pub" items="${publishedAtList}" varStatus="var">
		 <c:if test="${var.index > 3}">
		  	  <c:set var="loop" value="false"/>
		 </c:if>

		<c:if test="${not loop}">
		
		    <div class="col-md-3">
	        <div class="card">
	            <div class="card-img">
	                <img class="img-responsive" src="${path}/${end.project_main_image}" onclick="goProject('${end.project_id}')">
	            </div>
	                 <%--좋아요  --%>
	           	 <c:set var="flag" value="false" />
	                <c:forEach var="likeId" items="${likeList}">
						<c:if test="${likeId eq end.project_id}">
							<c:set var="flag" value="true" />
						</c:if>		
					</c:forEach>
					
					
		<c:if test="${flag}">
			<button id="likeBtn${end.project_id}" class="likeBtn" onClick="MyFavoritProject('${end.project_id}')">
				<img class="likeImg" src="resources/img/fullHeart.png">
			</button>
				
		</c:if>
		<c:if test="${not flag}">
			<button id="likeBtn${end.project_id}" class="likeBtn" onClick="MyFavoritProject('${end.project_id}')">
				<img class="likeImg" src="resources/img/blankHeart.png">
			</button>		
		</c:if>
		
	               
	               
	            <div class="card-block">
	                <div class="card-title">
	                    <small><a href="/fund/discover?category=${end.project_sub_category}">${end.project_sub_category}</a> | <a href="fund/u?member_url=${memberMap[end.project_id].member_URL}">${memberMap[end.project_id].member_name}</a></small>
	                    <h4><a href="/fund/discover/${end.project_id}">${end.project_title}</a></h4>
	                    <p>${end.project_summary}<br>
	                    ${end.project_current_percent}% 달성</p>
	                </div>
				</div>
			</div>
		</div>
	      
	      
	      
	      
	      
	    </c:if>
		  
</c:forEach>
</div>  <%--성공임박 프로젝트끝 --%>




	    
	    
	    
	    <%-- 
	    
	      <div class="col-md-3">
	        <div class="card">
	            <div class="card-img">
	                <img class="img-responsive" src="resources/project/134.jpg">
	            </div>
	            <div class="card-block">
	                <div class="card-title">
	                    <small><a href="#">Categories</a></small>
	                    <h4>Frank Ericsson Midway Electrics co. </h4>
	                    <p>David Miles & Sons Carpentry</p>
	                </div>
	                <div class="card-footer">
	                   
	                <ul class="list-inline">
	                    <li class="margin-t-10"><a href="#"> <i class="fa fa-map-marker"></i> Chicago, IL </a></li>
	                    <li class="pull-right margin-t-10"><a href="#">Add to Wishlist </a></li>
	                </ul>
	            </div>
	               
	            </div>
	            
	        </div>
	    </div>
	    --%>
	   
	    
	    
</div>	    
	    
	    
</div>
  
  
  
  

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/fund/resources/myjsFunction/projectFunction.js"></script>
  
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script type="text/javascript">
  function goProject(id){
	  location.href='/fund/discover/'+id;
	   
  }

  function setTag(th,sub){
	  alert("태그셋하자")
	  var subC = sub;
	  console.log(subC);

	  
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
				if(value==subC){
					$(th).html(key);
				}
				
			})
		})

		
		
	}







</script>

</body>

</html>

