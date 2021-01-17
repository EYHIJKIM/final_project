<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>프로젝트 만들기 : 핫디즈</title>
<link href="<%=request.getContextPath() %>/resources/boost/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/boost/bootstrap.css">
<script type="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23019901-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-23019901-1');
    </script>
<style type="text/css">
#title_name { 
	text-align: center; 
	padding-top: 80px;
	padding-bottom: 80px;
}

</style>
<script>
	function init(){
		$("#title_content").hide();
		$("#image_content").hide();
		$("#imageDiv").hide();
		$("#summary_content").hide();
		$("#category_content").hide();
		$("#tag_content").hide();
		
		$("#prelaunching_content").hide();
		$("#price_content").hide();
		$("#release_date_content").hide();
		$("#release_date_select").hide();
		$("#deadline_content").hide();
		$("#gift_list_content").hide();
		
		$("#video_content").hide();
		
		var projectId = $("#project_id").val();
		
		var form = {project_id:projectId}
		$.ajax({
			url : "getTitle",
			type : "POST",
			data : form,
			success : function(cnt){
				if(cnt!=""){
					$("#headerTitle").text(cnt)
				}
			},
			error : function(){
				alert("getTitle헤더 문제발생")
			}
		})
		
		$.ajax({
			url : "getImage",
			type : "POST",
			data : form,
			success : function(cnt){
				if(cnt!=""){
					$("#imageDiv").show();
					$('#preview').attr('src', cnt);
				}
			},
			error : function(){
				alert("getImage헤더 문제발생")
			}
		})
		
		$.ajax({
			url : "get_summary",
			type : "POST",
			data : form,
			success : function(cnt){
				if(cnt!=""){
					$("#userSummary").text(cnt)
				}
			},
			error : function(){
				alert("get_summary헤더 문제발생")
			}
		})
		
		$.ajax({
			url : "get_category",
			type : "POST",
			data : form,
			success : function(cnt){
				if(cnt!=""){
					$("#selectCategory").html("<h3>"+cnt+"</h3>")
				}
			},
			error : function(){
				alert("get_category헤더 문제발생")
			}
		})
		
		$.ajax({
			url : "get_tag",
			type : "POST",
			data : form,
			success : function(cnt){
				if(cnt!=""){
					$("#tags").html("<h3>"+cnt+"</h3>")
				}
			},
			error : function(){
				alert("get_tag헤더 문제발생")
			}
		})
		
		
		$.ajax({
			url : "gift_list",
			type : "POST",
			data : form,
			success : function(list){
				let html = ""
			$.each(list,function(index, item){
				html += "<b>후원 금액 : </b>"+item.project_gift_price+"원<br>"
				html += "상품 설명<br> <textarea id='userGift' readonly rows='10' style='width: 20%;'>"
						+item.project_gift+"</textarea><br>"
				html += "<button type='button' onclick='gift_delete("+item.gift_id+")' class='btn btn-primary disabled'>삭제하기</button><hr>"
			});
			$("#test").html(html)
		},
			error : function(){
				alert("gift_list헤더 문제발생")
			}
		})

		$.ajax({
			url : "get_price",
			type : "POST",
			data : form,
			success : function(target){
				$("#targetPrice").html(target)
			},
			error : function(){
				alert("get_price헤더 문제발생")
			}
		})
		
		
		var dateForm = {id:projectId}
		
		$.ajax({
			url : "get_release_date",
			type : "POST",
			data : dateForm,
			success : function(date){
				$("#release").html(date)
			},
			error : function(){
				alert("get_release헤더 문제발생")
			}
		})
		
		$.ajax({
			url : "get_deadline",
			type : "POST",
			data : dateForm,
			success : function(date){
				$("#dead").html(date)
			},
			error : function(){
				alert("get_deadline헤더 문제발생")
			}
		})
		
		
		$.ajax({
			url : "header_project_check",
			type : "POST",
			data : form,
			success : function(check){
				if(check==0){
					$("#chkBtn").html("<button onclick='project_checkBtn()' class='btn btn-secondary my-2 my-sm-0' type='button'>검토 요청하기</button>")
				}else{
					$("#chkBtn").html("<button onclick='project_checkBtn()' class='btn btn-secondary my-2 my-sm-0' type='button'>검토 취소하기</button>")
				}
			},
			error : function(){
				alert("header_project_check헤더 문제발생")
			}
		})
		
		
		
		$.ajax({
		url : "get_story",
		type : "POST",
		data : form,
		success : function(storys){
			
			if(storys==''){
				$("#textStory").html("<h2>창작자 소개</h2><p>- 창작자님은 누구이고, 왜 이번 프로젝트를 시작하게 되셨나요?<br>- 이전 창작 내역이나 활동 SNS 등 이번 프로젝트를 잘 완수할 수 있다고 믿음을 줄 수 있는 내용이 좋습니다.</p><h2>프로젝트 소개</h2><p>- 무엇을 만들기 위한 프로젝트인가요? 이 프로젝트의 특별한 점은 무엇인가요?<br>- 만들고자 하는 제품이나 창작물 샘플, 콘텐츠 미리보기 등을 공유해 주세요. 매력적인 사진과 그림은 후원자 참여에 중요한 역할을 합니다.</p><h2>프로젝트 예산</h2><p>- 텀블벅 프로젝트의 목적은 창작에 필요한 금액을 후원자들의 참여로 모으는 것입니다.<br>- 왜 목표 금액이 필요한지 알고 후원할 수 있도록 창작에 필요한 예산을 공유해 주세요.</p><h2>제작 일정</h2><p>- 프로젝트가 어디까지 준비가 되었나요? 구상 단계인지, 시제품이나 파일럿 등 가안 제작 단계인지, 제작이 완료된 단계인지 정확히 알려주세요.<br>- 펀딩에 성공한다면 어떤 일정으로 완수할 계획인가요? 일정은 중간 단계를 가늠할 수 있도록 구체적으로 적어주세요.</p><h2>후원자 안내</h2><p>&nbsp;</p><p>- 후원자 선물 전달 방법에 대해 조금 더 구체적인 설명이 필요한가요? 손상되기 쉬운 선물의 포장·전달 방법이나 행사 일정/장소, 디지털 파일 전달할 방법 등을 짚어 주세요.<br>- 문의 방법(창작자에게 문의하기)이나 환불 교환 정책, 상품 정보 고시는 별도의 기능이 있으므로 스토리에 또 기재하지 않아도 됩니다.<br>- 그 밖에 후원자들에게 전하고 싶은 말이 있나요?</p>")
			}else{
				console.log(storys)
				$("#textStory").html(storys)
			}
			
			
		},
		error : function(){
			alert("get_story 헤더 문제발생")
		}
	})
		
			$.ajax({
			url : "get_video",
			type : "POST",
			data : form,
			success : function(cnt){
				if(cnt!=""){
					$("#video_view").html(cnt)
				}
			},
			error : function(){
				alert("get_video헤더 문제발생")
			}
		})
		
		
	}
	
	
	function project_checkBtn(){
		
		var projectId = $("#project_id").val();
		
		var form = {project_id:projectId}
		
		$.ajax({
			url : "project_check",
			type : "POST",
			data : form,
			success : function(check){
				if(check==0){
					alert("검토 취소 하였습니다.")
					$("#chkBtn").html("<button onclick='project_checkBtn()' class='btn btn-secondary my-2 my-sm-0' type='button'>검토 요청하기</button>")
				}else{
					alert("검토 요청 되었습니다.")
					$("#chkBtn").html("<button onclick='project_checkBtn()' class='btn btn-secondary my-2 my-sm-0' type='button'>검토 취소하기</button>")
				}
			},
			error : function(){
				alert("check헤더 문제발생")
			}
		})
	}
</script>
</head>
<body onload="init()">
    <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
      <div class="container">
        <a href="/fund" class="navbar-brand">hoThiz</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link" href="/fund/my_project">내 프로젝트</a>
              
            </li>
          </ul>
        </div>
      </div>
    </div>
    
    
    
  <div class="container">  
<br><br><br><br><br>
<div class="bs-docs-section">
        <div class="page-header">
          <div class="row">
            <div class="col-lg-12">
              <h1 id="title_name"><font id="headerTitle" size="10">신박한 제목</font></h1>
            </div>
          </div>
        </div>
</div>

<div class="bs-component">
              <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarColor02">
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                      <a class="nav-link" href="outline?id=${param.id}">프로젝트 개요
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="gift?id=${param.id}">펀딩 및 선물 구성</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="story?id=${param.id}">스토리텔링</a>
                    </li>
                    
                    
                  </ul>
                  
                </div>
                	<div id="chkBtn">
                    	<button onclick="project_checkBtn()" class="btn btn-secondary my-2 my-sm-0" type="button">검토 요청하기</button>
                  	</div>
              </nav>
            </div>






</div>
</body>
</html>