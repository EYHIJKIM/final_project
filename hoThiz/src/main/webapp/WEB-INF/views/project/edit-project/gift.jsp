<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 만들기 : 핫디즈</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	
	
	
	
	function priceBtn(){
		$("#price_content").show();
		$("#price").hide();
	}
	function priceCencel(){
		$("#price").show();
		$("#price_content").hide();
	}
	function priceInsert(){
		var price = $("#userPrice").val()
		var projectId = $("#project_id").val();
		var form = {project_target_price:price,project_id:projectId}
		$.ajax({
			url : "insert_price",
			type : "POST",
			data : form,
			success : function(target){
				$("#targetPrice").html(target)
			},
			error : function(){
				alert("priceInsert문제발생")
			}
		})
		$("#price").show();
		$("#price_content").hide();
		
	}
	
	function prelaunchingBtn(){
		$("#prelaunching_content").show();
		$("#prelaunching").hide();
	}
	function prelaunchingCencel(){
		$("#prelaunching").show();
		$("#prelaunching_content").hide();
	}
	
	//var prelaunching_data = 0;
	$(document).ready(function() {
		$("input:checkbox").on('click', function() {
			if ($("#prelaunching_check").prop('checked')) {
				prelaunching_data = 1;
			} else {
				prelaunching_data = 0;
			}
		});
	});
	
	function prelaunchingInsert(){
		if ($("#prelaunching_check").prop('checked')) {
			var prelaunching = 1;
		} else {
			var prelaunching = 0;
		}
		
		var projectId = $("#project_id").val();
		var form = {project_prelaunching_check:prelaunching,project_id:projectId}
		$.ajax({
			url : "insert_prelaunching",
			type : "POST",
			data : form,
			success : function(cnt){
				
			},
			error : function(){
				alert("prelaunching문제"); 

			}
		})
		$("#prelaunching").show();
		$("#prelaunching_content").hide();
	}
	
	
	function release_dateBtn(){
		$("#release_date_content").show();
		$("#release_date").hide();
	}
	function release_dateCencel(){
		$("#release_date").show();
		$("#release_date_content").hide();
	}
	
	function release_dateInsert(){
		var release_date = $("#userRelease_date").val()
		var projectId = $("#project_id").val();
		var form = {date:release_date,id:projectId}
		$.ajax({
			url : "insert_release_date",
			type : "POST",
			data : form,
			success : function(cnt){
				$("#release").text(cnt)
			},
			error : function(request,status,error){
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 

			}
		})
		$("#release_date").show();
		$("#release_date_content").hide();
	}
	
	function deadlineBtn(){
		$("#deadline_content").show();
		$("#deadline").hide();
	}
	function deadlineCencel(){
		$("#deadline").show();
		$("#deadline_content").hide();
	}
	
	function deadlineInsert(){
		var deadline = $("#userDeadline").val()
		var projectId = $("#project_id").val();
		var form = {date:deadline,id:projectId}
		$.ajax({
			url : "insert_deadline",
			type : "POST",
			data : form,
			success : function(date){
				$("#dead").html(date)
			},
			error : function(){
				alert("날짜를 입력해주세요.")
			}
		})
		
		$("#deadline").show();
		$("#deadline_content").hide();
	}
	
	function gift_listBtn(){
		$("#gift_list_content").show();
		$("#gift_list").hide();
	}
	function gift_listCencel(){
		$("#gift_list").show();
		$("#gift_list_content").hide();
	}
	
	function giftInsert(){
		var price = $("#user_gift_price").val()
		var userGift = $("textarea#userGift").val()
		var projectId = $("#project_id").val();
		var form = {project_gift_price:price,project_gift:userGift,project_id:projectId}
		$.ajax({
			url : "insert_gift_list",
			type : "POST",
			data : form,
			success : function(list){
				alert('추가되었습니다.')
				let html = "<hr>"
			$.each(list,function(index, item){
				html += "<b>후원 금액 : </b>"+item.project_gift_price+"원<br>"
				html += "상품 설명<br> <textarea id='userGift' readonly rows='10' style='width: 20%;'>"
						+item.project_gift+"</textarea><br>"
				html += "<button type='button' onclick='gift_delete("+item.gift_id+")' class='btn btn-primary disabled'>삭제하기</button><hr>"
			});
			$("#test").html(html)
		},
			error : function(){
				alert("insert_gift_list문제발생")
			}
		})
	}
	
	function gift_delete(giftIds){
		var id = giftIds
		var projectId = $("#project_id").val();
		
		var form = {gift_id:id,project_id:projectId}
		$.ajax({
			url : "delete_gift",
			type : "POST",
			data : form,
			success : function(date){
				
			},
			error : function(){
				alert("gift_delete문제발생")
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
				alert("gift_list문제발생")
			}
		})
	}
	
	
	
	

	//날짜선택
	$(function() {
		
		$("#userRelease_date").datepicker(
				{
					//showOn: "both",
					changeMonth : true,
					dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
							'일요일' ],
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ]
				});
		$("#userDeadline").datepicker(
				{
					//showOn: "both",
					changeMonth : true,
					dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
							'일요일' ],
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ]
				});
		});
	
</script>
</head>
<body>
<c:import url="header.jsp"></c:import>
<input type="hidden" id="project_id" value="${param.id}">
<div class="container">
<br>
<h4>펀딩 목표 설정</h4>
<hr>
<label>목표 금액</label><br>
<h3><span id="targetPrice"></span></h3>
<div id="price">
	<button type="button" class="btn btn-secondary" onclick="priceBtn()">목표 금액을 입력해주세요</button>

</div>
<div id="price_content">
	이번 프로젝트를 통해 모으고자 하는 펀딩 목표 금액이 얼마인가요?<br>
마감일 자정까지 목표 금액을 100% 이상 달성하셔야만 모인 후원금이 결제 됩니다.<br>
막판에 후원을 취소하는 후원자들도 있는 점을 감안해 10% 이상 초과 달성을 목표로 하시는게 안전합니다.<br>
(목표 금액은 제작비, 선물 배송비, 창작자의 인건비, 예비 비용 등을 고려하시기 바랍니다.)<br>
<input type="text" id="userPrice" 
	oninput="this.value = 
	this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value=0>원
<br><br>
	<button type="button" onclick="priceCencel()" class="btn btn-primary disabled">취소하기</button>
	<button type="button" onclick="priceInsert()" class="btn btn-primary disabled">저장하기</button>
	
</div>
<hr>
<h4>공개 예정</h4><hr>
<label>공개예정 프로젝트(선택)</label><br><br>
<div id="prelaunching">
<button type="button" class="btn btn-secondary" onclick="prelaunchingBtn()">공개예정 프로젝트를 진행해보세요</button>

</div>
<div id="prelaunching_content">
		공개예정 프로젝트를 개설해 프로젝트 관심도를 미리 알아보세요. 프로젝트 알림신청 기능을 통해 프로젝트 수요를 사전에 파악할 수 있습니다.<br> 
		공개예정 기간이 끝난 후 프로젝트가 공개되면 알림신청한 분들께 알림이 제공됩니다. 개설한 프로젝트는 공개예정 기간(최대 15일) 동안 <br>
		핫디즈 홈과 둘러보기 페이지에서 확인할 수 있습니다.<br><br>
		<input type="checkbox" id="prelaunching_check">공개예정 프로젝트 진행하기
	<br>
	<br>	
	<button type="button" onclick="prelaunchingCencel()" class="btn btn-primary disabled">취소하기</button>
	<button type="button" onclick="prelaunchingInsert()" class="btn btn-primary disabled">저장하기</button>
	
</div>
<hr>

<h4>펀딩 기간 설정</h4><hr>
<label>프로젝트 공개일시</label><br>
<h3><span id="release"></span></h3>
<div id="release_date">
<button type="button" class="btn btn-secondary" onclick="release_dateBtn()">프로젝트의 공개일시를 정해주세요</button>

</div>
<div id="release_date_content">
	심사 승인 후, 설정하신 일시에 프로젝트가 자동으로 공개되니 신중하게 정해주세요. 
	설정하신 공개일시와 관계없이 프로젝트를 직접 공개하실 수도 있습니다.
	<br><br>
	<input type="text" id="userRelease_date" readonly> <br><br>
	<button type="button" onclick="release_dateCencel()" class="btn btn-primary disabled">취소하기</button>
	<button type="button" onclick="release_dateInsert()" class="btn btn-primary disabled">저장하기</button>
	
</div>
<hr>

<label>프로젝트 마감일</label><br>
<h3><span id="dead"></span></h3>
<div id="deadline">
<button type="button" class="btn btn-secondary" onclick="deadlineBtn()">프로젝트의 마감일을 정해주세요</button>

</div>
<div id="deadline_content">
	공개일로부터 최소 2일 이후로 설정하셔야 하며 이를 어길 시 승인되지 않을 수 있습니다.
	<br><br>
	<input type="text" id="userDeadline" readonly> <br><br>
	<button type="button" onclick="deadlineCencel()" class="btn btn-primary disabled">취소하기</button>
	<button type="button" onclick="deadlineInsert()" class="btn btn-primary disabled">저장하기</button>
	
</div>
<hr>

<h4>선물 구성</h4><hr>
<label>선물 추가하기</label><br><br>
후원자분들에게 드릴 새로운 선물을 만듭니다.
<div id="gift_list">
<button type="button" class="btn btn-secondary" onclick="gift_listBtn()">추가하기</button>

</div>
<div id="gift_list_content">
	인기 금액대인 1만원대 선물부터 특별한 의미를 담은 10만원 이상 선물까지, 다양한 금액대로 구성하면 성공률이 더욱 높아집니다. 
	<br>배송이 필요한 선물의 경우, 배송비 포함된 금액으로 작성해주세요.
	<br><br>
	후원금액 : <input type="text" id="user_gift_price"
	oninput="this.value = 
	this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value=0>원<br>
	상품 설명<br>
	<textarea id="userGift" rows="10"
	style="width: 50%;"></textarea><br>
	
	
	<button type="button" onclick="giftInsert()" class="btn btn-primary disabled">추가하기</button>
	
	<br><br>
	
	<button type="button" onclick="gift_listCencel()" class="btn btn-primary disabled">닫기</button>
	
</div>
<hr>

<div>
<h4>선물 리스트</h4>
<span id="test"></span>
</div>
</div>
</body>

</html>