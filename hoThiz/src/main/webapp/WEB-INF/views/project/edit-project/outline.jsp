<%@page import="com.hothiz.fund.project.controller.ProjectUploadController"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>프로젝트 만들기 : 핫디즈</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function titleBtn(){
		$("#title_content").show();
		$("#title").hide();
	}
	function titleCencel(){
		$("#title").show();
		$("#title_content").hide();
	}
	function titleInsert(){
		var title = $("#userTitle").val()
		var projectId = $("#project_id").val();
		var form = {project_title:title,project_id:projectId}
		$.ajax({
			url : "insert_title",
			type : "POST",
			data : form,
			success : function(cnt){
				
				$("#headerTitle").text(cnt)
			},
			error : function(){
				alert("문제발생")
			}
		})
		$("#title").show();
		$("#title_content").hide();
	}
	
	
	function imageBtn(){
		$("#image_content").show();
		$("#image").hide();
	}
	function imageCencel(){
		$("#image").show();
		$("#image_content").hide();
	}
	function imageInsert(){
		var image = $("#userImage").val()
		var projectId = $("#project_id").val();
		var form = {project_image:image,project_id:projectId}
		$.ajax({
			url : "intert_title",
			type : "POST",
			data : form,
			success : function(cnt){
				
				console.log("성공")
			},
			error : function(){
				alert("문제발생")
			}
		})
	}
	
	function summaryBtn(){
		$("#summary_content").show();
		$("#summary").hide();
	}
	function summaryCencel(){
		$("#summary").show();
		$("#summary_content").hide();
	}
	function summaryInsert(){
		var summary = $("textarea#userSummary").val()
		var projectId = $("#project_id").val();
		var form = {project_summary:summary,project_id:projectId}
		$.ajax({
			url : "insert_summary",
			type : "POST",
			data : form,
			success : function(cnt){
				console.log("성공")
			},
			error : function(){
				alert("문제발생")
			}
		})
		$("#summary").show();
		$("#summary_content").hide();
	}
	
	
	
	function categoryBtn(){
		$("#category_content").show();
		$("#category").hide();
	}
	function categoryCencel(){
		$("#category").show();
		$("#category_content").hide();
	}
	function tagBtn(){
		$("#tag_content").show();
		$("#tag").hide();
	}
	function tagCencel(){
		$("#tag").show();
		$("#tag_content").hide();
	}
	function categoryInsert(){
		//var sel = document.getElementById("#userCategrory")
		var projectId = $("#project_id").val();
		//var categrory = sel.options[sel.selectedIndex].value;
		var category = $("#userCategory option:selected").val();
		var form = {project_sub_category:category,project_id:projectId}
		$.ajax({
			url : "insert_category",
			type : "POST",
			data : form,
			success : function(cnt){
				console.log("성공")
			},
			error : function(){
				alert("문제발생")
			}
		})
		$("#category").show();
		$("#category_content").hide();
	}
	function tagInsert(){
		var tag = $("#userTag").val()
		var projectId = $("#project_id").val();
		var form = {project_tag:tag,project_id:projectId}
		$.ajax({
			url : "insert_tag",
			type : "POST",
			data : form,
			success : function(cnt){
				//console.log("성공")
			},
			error : function(){
				alert("문제발생")
			}
		})
		$("#tag").show();
		$("#tag_content").hide();
	}
	
	
	
	
	
	function readURL(input,stype) {
		var fileObj, pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;
		var file = input.files[0] //파일에 대한 정보
		if(input == "[object HTMLInputElement]") {
	        fileObj = input.value
	    } else {
	        fileObj = document.getElementById(obj).value;
	    }
		if (file != '') {
			$("#imageDiv").show();
			var reader = new FileReader();
			reader.readAsDataURL(file); //읽고
			reader.onload = function(e) { // 로드한 값을 표현한다
				$('#preview').attr('src', e.target.result);
			}
			
			
		pathHeader = fileObj.lastIndexOf("\\");
		pathMiddle = fileObj.lastIndexOf(".");
		pathEnd = fileObj.length;
		fileName = fileObj.substring(pathHeader+1, pathMiddle);
		extName = fileObj.substring(pathMiddle+1, pathEnd);
		allFilename = fileName+"."+extName;
		
		var projectId = $("#project_id").val();
		var forms = {project_main_image:allFilename,project_id:projectId}
		
		//alert(allFilename)
			$.ajax({
				url : "insert_image",
				type : "POST",
				data : forms,
				success : function(cnt){
					//console.log("성공")
				},
				error : function(){
					alert("문제발생")
				}
			})
			
		var formData = new FormData($("#FILE_FORM")[0]); 
		// 아래 주석은 위와 같은데 표현만 다름 
		// var formData = new FormData(document.getElementById("form")); 
		// var formData = new FormData($("form")[0]); 
		// 원하는 것만 넘겨주는 방식 
		var formData = new FormData(); 
		formData.append("file", $("#userImage")[0].files[0]); 
		$.ajax({ 
			type: 'POST', 
			url: 'java_save_image', 
			processData: false, 
			// 필수 
			contentType: false, 
			// 필수 
			data: formData, 
			success: function(data) { } 
		});

		}
	}
</script>
</head>
<body>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<%
 	ProjectUploadController.fdId = (String)request.getParameter("id");
 %>
<c:import url="header.jsp"></c:import>
<div class="container">
<input type="hidden" id="project_id" value="${param.id}">
<br>

<h4>프로젝트 개요</h4>
<hr>
<label>프로젝트 제목</label><br><br>
<div id="title">

	<button type="button" onclick="titleBtn()" class="btn btn-secondary">프로젝트 제목을 입력해주세요</button>

</div>
<div id="title_content">
<div></div>
	프로젝트에 멋진 제목을 붙여주세요. 감정에 호소하는 제목보다는 <br>
	만드시려는 창작물, 작품명, 혹은 프로젝트의 주제가 드러나게 써주시는 것이 좋습니다.
	<br><br>
	프로젝트 제목<br>
	<input class="form-control mr-sm-2" id="userTitle" type="text" placeholder="프로젝트 제목을 입력해주세요">

<br>
	<button type="button" onclick="titleCencel()" class="btn btn-primary disabled">취소하기</button>
	<button type="button" onclick="titleInsert()" class="btn btn-primary disabled">저장하기</button>

</div>
<hr>
<label>프로젝트 대표 이미지</label><br><br>
<div id="image">
<button type="button" class="btn btn-secondary" onclick="imageBtn()">프로젝트 대표 이미지를 등록해주세요</button>

</div>
<div id="image_content">
	대표 이미지는 프로젝트의 가장 중요한 시각적 요소입니다.<br>
	후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있게 하기 위해 개성있게 디자인해 주세요.
	<br><br>
	<form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
		<div id="imageDiv">
			<img id="preview" src="#" width=300 height=300 alt="이미지를 선택해주세요"/><br>
		</div>
		<input type="file" id ="userImage" name="userImage" onchange="readURL(this,'name');" />
	</form><br>
	<button type="button" onclick="imageCencel()" class="btn btn-primary disabled">닫기</button>
	
</div>
<hr>

<label>프로젝트 요약</label><br><br>
<div id="summary">
<button type="button" class="btn btn-secondary" onclick="summaryBtn()">프로젝트 요약을 입력해주세요</button>
</div>
<div id="summary_content">
	후원자 분들에게 본 프로젝트를 간략하게 소개해 봅시다.<br><br>
	<textarea id="userSummary" placeholder="프로젝트 요약을 입력해주세요" rows="2"
	style="width: 100%;"></textarea><br>
	<button type="button" onclick="summaryCencel()" class="btn btn-primary disabled">취소하기</button>
	<button type="button" onclick="summaryInsert()" class="btn btn-primary disabled">저장하기</button>
	
</div>
<hr>

<label>프로젝트 카테고리</label><br><br>
<div id="category">
<button type="button" class="btn btn-secondary" onclick="categoryBtn()">프로젝트 카테고리를 입력해주세요</button>

</div>
<div id="category_content">
	프로젝트의 성격에 맞는 카테고리를 선택해 주세요.<br>
	(프로젝트 성격과 맞지 않는 카테고리를 선택하실 시 후원자가 해당 프로젝트를 찾기 어려워지기에<br>
	에디터에 의해 조정될 수 있습니다.)
	<br><br>
	<select id="userCategory" name="">
		<option value="game" selected>게임</option>
		<option value="mobile-game">-모바일게임</option>
		<option value="video-game">-비디오게임</option>
		<option value="board-game">-보드게임</option>
		<option value="show">공연</option>
		<option value="dance">-무용</option>
		<option value="musical">-뮤지컬</option>
		<option value="theater">-연극</option>
		<option value="design">디자인</option>
		<option value="architecture">-건축, 공간</option>
		<option value="graphic-design">-그래픽 디자인</option>
		<option value="product-design">-제품 디자인</option>
		<option value="comics">만화</option>
		<option value="web-comics">-웹툰</option>
		<option value="comic-books">-만화책</option>
		<option value="art">예술</option>
		<option value="exhibitions">-전시</option>
		<option value="sculpture-and-action-figures">-조소, 피규어</option>
		<option value="illustration">-일러스트레이션</option>
		<option value="crafts">공예</option>
		<option value="candles-and-diffusers-and-soaps">-캔들,조향,비누</option>
		<option value="leather-and-metal-and-woodworking">-가죽,금속,목공예</option>
		<option value="pottery">-도예</option>
		<option value="photography">사진</option>
		<option value="people-photography">-인물</option>
		<option value="space-and-urban-photography">-배경</option>
		<option value="animals-photography">-동물</option>
		<option value="video">영상</option>
		<option value="film">-영화</option>
		<option value="documentary">-다큐</option>
		<option value="animation">-애니메이션</option>
		<option value="music-videos">-뮤직비디오</option>
		<option value="food">푸드</option>
		<option value="appetizer">-에피타이저</option>
		<option value="main-dish">-메인</option>
		<option value="dessert">-디저트</option>
		<option value="music">음악</option>
		<option value="classical-music">-클래식</option>
		<option value="popular-music">-대중음악</option>
		<option value="Independent-music">-인디음악</option>
		<option value="publication">출판</option>
		<option value="zines">-잡지</option>
		<option value="literature-and-essay">-문학,에세이</option>
		<option value="picture-books">-그림책</option>
		<option value="technology">테크</option>
		<option value="software">-소프트웨어</option>
		<option value="hardware">-하드웨어</option>
		<option value="apps">-앱</option>
		<option value="web">-웹</option>
		<option value="fashion">패션</option>
		<option value="apparels">-의류</option>
		<option value="accessories">-악세서리</option>
		<option value="beauty">-뷰티</option>
		<option value="journalism">저널리즘</option>
		<option value="audio-journals">-오디오</option>
		<option value="video-journals">-비디오</option>
		<option value="web-journals">-웹(개인방송)</option>
	</select><br><br>
	<button type="button" onclick="categoryCencel()" class="btn btn-primary disabled">취소하기</button>
	<button type="button" onclick="categoryInsert()" class="btn btn-primary disabled">저장하기</button>
	
</div>
<hr>

<label>검색용 태그</label><br><br>
<div id="tag">
<button type="button" class="btn btn-secondary" onclick="tagBtn()">예시: rpg,강아지,고양이,웹툰</button>

</div>
<div id="tag_content">
	내외부 검색 엔진에서 프로젝트가 잘 검색될 수 있도록, 사람들이 검색할만한 프로젝트의 핵심 단어를 입력해주세요.<br>
	여러 개의 태그를 입력하시는 경우 쉼표(,)로 구분하여 작성하실 수 있습니다.<br>
	프로젝트와 관련 없거나 검색에 불리한 키워드는 운영진에 의해 조정될 수 있습니다.<br>
	쉼표를 제외한 특수문자는 입력하실 수 없습니다.<br>
	
	<input class="form-control mr-sm-2" id="userTag" type="text" placeholder="예시: 로그라이크,강아지,웹툰,유기견">
	<br><br>
	<button type="button" onclick="tagCencel()" class="btn btn-primary disabled">취소하기</button>
	<button type="button" onclick="tagInsert()" class="btn btn-primary disabled">저장하기</button>
	
</div>
<hr>
<br><br>
</div>
</body>
</html>