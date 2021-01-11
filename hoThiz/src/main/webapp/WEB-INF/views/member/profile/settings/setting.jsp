<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var kakaoAddr;
	function daumPost() {
		new daum.Postcode({
			oncomplete : function(data) {

				if (data.userSelectedType == 'R') {
					kakaoAddr = data.roadAddress;
				} else {
					kakaoAddr = data.jibunAddress;
				}

				console.log(kakaoAddr);

				$('#inAddr').val(kakaoAddr);

			}

		}).open();

	}

	//show에넣을값
	var showURL;
	var showPhnum;
	var showAddr;
	var showIntro;

	//URL처리 함수3개
	function url_change() {

		//만약 optionParent에있는값이 e의값과같다면 그냥패스
		// 같지않다면 id값들을저장해줌
		//if(optionParent == eParent && CheckFirst == 0){

		if ($('#divURL').html() == null || $('#divURL').html() == '') {

		} else {
			showURL = $('#divURL').html();
		}

		//editbtn
		$('#changeURL')
				.html(
						'<button id="canURL" onclick="url_cancel()" class="bttn">취소</button>');

		//saveUrl
		$("#saveURL").css("display", "block");

		//divUrl
		$('#divURL').html('<input type="text" id="inURL">');
	}

	function url_cancel() {

		$('#changeURL')
				.html(
						'<button id="btnURL" onclick="url_change()" class="bttn">변경</button>');
		$("#saveURL").css("display", "none");
		$('#divURL').html(showURL)
	}

	function url_save() {
		console.log($('#inURL').val());
		//바꿀값
		var chVal = $('#inURL').val();
		// 바꿀컬럼정보
		var chCol = 'member_URL';
		if (chVal == '' || chVal == null) {
			alert("url을 입력해주세요")
		} else {

			$.ajax({
						url : "rest/" + chVal + "/" + chCol,
						type : "GET",
						success : function(msg) {
							alert(msg);
							$('#changeURL')
									.html(
											'<button id="btnURL" onclick="url_change()" class="bttn">변경</button>');
							$("#saveURL").css("display", "none");
							$('#divURL').html(chVal);

						},
						error : function() {
							alert("URL문제 발생")
						}
					});
		}

	}//dd

	//phnum처리 함수3개
	function phnum_change() {

		//만약 optionParent에있는값이 e의값과같다면 그냥패스
		// 같지않다면 id값들을저장해줌
		//if(optionParent == eParent && CheckFirst == 0){

		if ($('#divPhnum').html() == null || $('#divPhnum').html() == '') {

		} else {
			showPhnum = $('#divPhnum').html();
		}

		//editbtn
		$('#changePhnum')
				.html(
						'<button id="canPhnum" onclick="phnum_cancel()" class="bttn">취소</button>');

		//saveUrl
		$("#savePhnum").css("display", "block");

		//divUrl
		$('#divPhnum').html('<input type="text" id="inPhnum">');
	}

	function phnum_cancel() {

		$('#changePhnum')
				.html(
						'<button id="btnPhnum" onclick="phnum_change()" class="bttn">변경</button>');
		$("#savePhnum").css("display", "none");
		$('#divPhnum').html(showPhnum)
	}

	function phnum_save() {
		console.log($('#inPhnum').val());
		//바꿀값
		var chVal = $('#inPhnum').val();
		// 바꿀컬럼정보
		var chCol = 'member_phnum';
		if (chVal == '' || chVal == null) {
			alert("전화번호를 입력해주세요")
		} else {

			$
					.ajax({
						url : "rest/" + chVal + "/" + chCol,
						type : "GET",
						success : function(msg) {
							alert(msg);
							$('#changePhnum')
									.html(
											'<button id="btnPhnum" onclick="phnum_change()" class="bttn">변경</button>');
							$("#savePhnum").css("display", "none");
							$('#divPhnum').html(chVal);

						},
						error : function() {
							alert("폰넘버문제 발생")
						}
					});
		}

	}//dd

	//addr처리 함수3개
	function addr_change() {

		//만약 optionParent에있는값이 e의값과같다면 그냥패스
		// 같지않다면 id값들을저장해줌
		//if(optionParent == eParent && CheckFirst == 0){

		if ($('#divAddr').html() == null || $('#divAddr').html() == '') {

		} else {
			showAddr = $('#divAddr').html();
		}

		//editbtn
		$('#changeAddr')
				.html(
						'<button id="canAddr" onclick="addr_cancel()" class="bttn">취소</button>');

		//saveUrl
		$("#saveAddr").css("display", "block");
		$("#divAddrDetail").css("display", "block");
		$("#daumAddr").css("display", "block");
		//divUrl
		$('#divAddr').html('<input type="text" id="inAddr" readonly>');
	}

	function addr_cancel() {

		$('#changeAddr')
				.html(
						'<button id="btnAddr" onclick="addr_change()" class="bttn">변경</button>');
		$("#saveAddr").css("display", "none");
		$("#divAddrDetail").css("display", "none");
		$("#daumAddr").css("display", "none");
		$('#divAddr').html(showAddr);
	}

	function addr_save() {
		console.log($('#inAddr').val());
		//바꿀값
		var chVal = $('#inAddr').val();
		var chValDetail = $('#inAddrDetail').val();
		// 바꿀컬럼정보
		var chCol = 'member_addr';
		if (chVal == '' || chVal == null) {
			alert("주소를 입력해주세요");
		} else if (chValDetail == '' || chValDetail == null) {
			alert("상세주소를 입력해주세요");
		} else {

			var fullAddr = chVal + " " + chValDetail;

			$
					.ajax({
						url : "rest/" + fullAddr + "/" + chCol,
						type : "GET",
						success : function() {

							$('#changeAddr')
									.html(
											'<button id="btnAddr" onclick="addr_change()" class="bttn">변경</button>');
							$("#saveAddr").css("display", "none");
							$("#divAddrDetail").css("display", "none");
							$("#inAddrDetail").val("");
							$("#daumAddr").css("display", "none");
							$('#divAddr').html(fullAddr);

						},
						error : function() {
							alert("addr문제 발생")
						}
					});
		}

	}//dd

	function email_verify() {

		console.log($('#divVerify').html());
		var vEmail = $('#divVerify').html();
		alert("인증메일을 전송했습니다.");
		location.href = 'auth?email=' + vEmail;

	}//dd	

	//--------------------------------

	//pwd처리 함수3개
	function pwd_change() {

		//만약 optionParent에있는값이 e의값과같다면 그냥패스
		// 같지않다면 id값들을저장해줌
		//if(optionParent == eParent && CheckFirst == 0){

		//if($('#divPwd').html()==null || $('#divPwd').html() == '' ){

		//}else{
		///showPwd = $('#divPwd').html();
		//}

		//editbtn
		$('#changePwd')
				.html(
						'<button id="canPwd" onclick="pwd_cancel()" class="bttn">취소</button>');

		//saveUrl
		$("#savePwd").css("display", "block");
		$("#divCurrentPwd").css("display", "block");
		$("#divChangePwd").css("display", "block");
		$("#divChangePwdCheck").css("display", "block");
		//divUrl
		//$('#divPwd').html('<input type="text" id="inURL">');
	}

	function pwd_cancel() {

		$('#changePwd')
				.html(
						'<button id="btnPwd" onclick="pwd_change()" class="bttn">변경</button>');
		$("#savePwd").css("display", "none");
		$("#divCurrentPwd").css("display", "none");
		$("#divChangePwd").css("display", "none");
		$("#divChangePwdCheck").css("display", "none");
		//$('#divPwd').html("");
	}

	function pwd_save() {
		var cuPwd = $("#inCurrentPwd").val();
		var chPwd = $("#inChangePwd").val();
		var chkPwd = $("#inChangePwdCheck").val();
		var chCol = 'member_pwd';
		if (cuPwd == '' || cuPwd == null) {
			alert("현재 비밀번호를 입력해주세요")
		} else if (chPwd == '' || chPwd == null) {
			alert("변경할 비밀번호를 입력해주세요")
		} else if (chkPwd == '' || chkPwd == null) {
			alert("변경할 비밀번호 확인을 입력해주세요")
		} else {

			$
					.ajax({
						url : "chpw/" + cuPwd + "/" + chPwd + "/" + chkPwd
								+ "/" + chCol,
						type : "GET",
						success : function(msg) {

							alert(msg);
							$("#savePwd").css("display", "none");
							$("#divCurrentPwd").css("display", "none");
							$("#divChangePwd").css("display", "none");
							$("#divChangePwdCheck").css("display", "none");
							$('#changePwd')
									.html(
											'<button id="btnPwd" onclick="pwd_change()" class="bttn">변경</button>');
							location.href = "setting";
						},
						error : function() {
							alert("pwd문제 발생")
						}
					});
		}
	}//dd

	//---------------------------------------
	//알람신청

	function alarm_agree() {

		// 현재 0이면 신청할수있음
		console.log($("#btnAlarm").val())

		var agree_sign = $("#btnAlarm").val();

		$.ajax({
			url : "alarm_agree_setting/" + agree_sign,
			type : "GET",
			success : function(msg) {

				if (agree_sign == 0) {
					alert("알람 수신동의");

				} else if (agree_sign == 1) {
					alert("알람 수신거부");
				}

				location.href = "setting";

			},
			error : function() {
				alert("알람문제 발생")
			}
		});

	}//dd

	function readURL(input) {
		console.log(input.files[0].name);
		var file = input.files[0] //파일에 대한 정보
		if (file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file); //읽고 
			reader.onload = function(e) { // 로드한 값을 표현한다
				$('#preview').attr('src', e.target.result);

			}
		}
	}

	function readURL(input) {
		var file = input.files[0] //파일에 대한 정보
		if (file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file); //읽고 
			reader.onload = function(e) { // 로드한 값을 표현한다
				$('#preview').attr('src', e.target.result);
			}
		}
	}

	//-------------------------------------------
	//프로필사진변경
	function pro_change() {

		//만약 optionParent에있는값이 e의값과같다면 그냥패스
		// 같지않다면 id값들을저장해줌
		//if(optionParent == eParent && CheckFirst == 0){

		//if($('#divPwd').html()==null || $('#divPwd').html() == '' ){

		//}else{
		///showPwd = $('#divPwd').html();
		//}

		//editbtn
		$('#changePro')
				.html(
						'<button id="canPro" onclick="pro_cancel()" class="bttn">취소</button>');

		//saveUrl

		$("#divPro").css("display", "block");

		//divUrl
		//$('#divPwd').html('<input type="text" id="inURL">');
	}

	function pro_cancel() {

		$('#changePro')
				.html(
						'<button id="btnPro" onclick="pro_change()" class="bttn">변경</button>');
		$("#divPro").css("display", "none");
		//	$("#divChangePwd").css("display","none");
		//	$("#divChangePwdCheck").css("display","none");
		//$('#divPwd').html("");
	}

	//------------------------------------------------------------------------------
	// 자기소개

	//phnum처리 함수3개
	function intro_change() {

		//만약 optionParent에있는값이 e의값과같다면 그냥패스
		// 같지않다면 id값들을저장해줌
		//if(optionParent == eParent && CheckFirst == 0){

		if ($('#divIntro').html() == null || $('#divIntro').html() == '') {

		} else {
			showIntro = $('#divIntro').html();
		}

		//editbtn
		$('#changeIntro')
				.html(
						'<button id="canIntro" onclick="intro_cancel()" class="bttn">취소</button>');

		//saveUrl
		$("#saveIntro").css("display", "block");

		//divUrl
		$('#divIntro').html('<textarea type="text" id="inIntro"/>');
	}

	function intro_cancel() {

		$('#changeIntro')
				.html(
						'<button id="btnIntro" onclick="intro_change()" class="bttn">변경</button>');
		$("#saveIntro").css("display", "none");
		$('#divIntro').html(showIntro)
	}

	function intro_save() {
		console.log($('#inIntro').val());
		//바꿀값
		var chVal = $('#inIntro').val();
		// 바꿀컬럼정보
		var chCol = 'member_introduce';
		if (chVal == '' || chVal == null) {
			alert("공백임")
		} else {

			$
					.ajax({
						url : "rest/" + chVal + "/" + chCol,
						type : "GET",
						success : function(msg) {
							alert(msg);
							$('#changeIntro')
									.html(
											'<button id="btnIntro" onclick="intro_change()" class="bttn">변경</button>');
							$("#saveIntro").css("display", "none");
							$('#divIntro').html(chVal);

						},
						error : function() {
							alert("폰넘버문제 발생")
						}
					});
		}

	}//dd
</script>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>핫디즈 :: hoThiz</title>

<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/resources/css/shop-item.css"
	rel="stylesheet">

</head>

<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/member/default/header.jsp" %>

	<!-- Page Content -->
	<div class="container">

		<div class="row">



			<div class="col-lg-9">



				<div class="card card-outline-secondary my-4">
					<div class="card-header">
						<h2>회원정보</h2>
					</div>
					<div class="card-body">
						<p>
						<div id="pro">
							<hr>
							<div>
								<div id="changePro" style="float: right;">
									<button id="btnPro" onclick="pro_change()" class="bttn">변경</button>
								</div>
								<h2>프로필사진</h2>
							</div>
							<hr>
							<c:choose>
								<c:when test="${empty list.member_profile_pic }">
									<img id="preview"
										src="${contextPath }/resources/profileImage/main_profPic.png"
										width=200 height=200 />
									<br>
								</c:when>
								<c:otherwise>
									<img id="preview"
										src="${contextPath }/resources/img/${list.member_email}/${list.member_profile_pic}"
										width=200 height=200 />
									<br>
								</c:otherwise>
							</c:choose>
							<div id="divPro" style="display: none;">
								<form action="${contextPath}/saveProfile" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="originalFileName"
										value="${list.member_profile_pic }"> <input
										type="hidden" name="user_email" value="${list.member_email}">
									<input type="file" name="image_file_name"
										onchange="readURL(this);" /><br> <input type="submit"
										value="저장" class="btnsave">
								</form>
							</div>
						</div>
						<hr>

						<div id="intro">
							<hr>
							<div>
								<div id="changeIntro" style="float: right;">
									<button id="btnIntro" onclick="intro_change()" class="bttn">변경</button>
								</div>
								<h2>자기소개</h2>
							</div>
							<hr>
							<div id="divIntro">${list.member_introduce }</div>
							<div id="saveIntro" style="display: none;">
								<button id="member_intro" onclick="intro_save()" class="btnsave">저장</button>
							</div>

							<hr>
						</div>







						<hr>
						<div id="id">
							<hr>
							<h2>아이디</h2>
							<hr>
							${list.member_email }
							<hr>
						</div>

						<hr>

						<div id="pw">
							<div>
								<div id="changePwd" style="float: right;">
									<button id="btnPwd" onclick="pwd_change()" class="bttn">변경</button>
								</div>
								<h2>비밀번호</h2>
							</div>
							<hr>
							<div id="divPwd"></div>
							<div id="divCurrentPwd" style="display: none;">
								<input type="password" id="inCurrentPwd" placeholder="현 재 비 밀 번 호">
							</div>
							<div id="divChangePwd" style="display: none;">
								<input type="password" id="inChangePwd" placeholder="변 경 할 비 밀 번 호">
							</div>
							<div id="divChangePwdCheck" style="display: none;">
								<input type="password" id="inChangePwdCheck"
									placeholder="변 경 할 비 밀 번 호 확 인">
							</div>
							<div id="savePwd" style="display: none;">
								<button id="member_pwd" onclick="pwd_save()" class="btnsave">저장</button>
							</div>


						</div>

						<div id="name">
							<hr>
							<h2>이름</h2>
							<hr>
							${list.member_name }

						</div>

						<hr>

						<div id="url">
							<hr>
							<div>
								<div id="changeURL" style="float: right;">
									<button id="btnURL" onclick="url_change()" class="bttn">변경</button>
								</div>
								<h2>사용자URL</h2>
							</div>
							<hr>
							<c:choose>
								<c:when test="${empty list.member_URL }">
									<div id="divURL">등록된 url이 없습니다</div>
								</c:when>
								<c:otherwise>
									<div id="divURL">${list.member_URL }</div>
								</c:otherwise>
							</c:choose>
							<div id="saveURL" style="display: none;">
								<button id="member_URL" onclick="url_save()" class="btnsave">저장</button>
							</div>

							<hr>
						</div>

						<div id="phnum">
							<hr>
							<div>
								<div id="changePhnum" style="float: right;">
									<button id="btnPhnum" onclick="phnum_change()" class="bttn">변경</button>
								</div>
								<h2>전화번호</h2>
							</div>
							<hr>
							<div id="divPhnum">${list.member_phnum }</div>
							<div id="savePhnum" style="display: none;">
								<button id="member_phnum" onclick="phnum_save()" class="btnsave">저장</button>
							</div>

							<hr>
						</div>


						<div id="addr">
							<hr>
							<div>
								<div id="changeAddr" style="float: right;">
									<button id="btnAddr" onclick="addr_change()" class="bttn">변경</button>
								</div>
								<h2>주소</h2>
							</div>
							<hr>
							<div id="daumAddr" style="display: none; float: right;">
								<button id="daum_addr" onclick="daumPost()" class="btnelse">주소찾기</button>
							</div>
							<c:choose>
								<c:when test="${empty list.member_addr }">
									<div id="divAddr">등록된 주소가 없습니다</div>
								</c:when>
								<c:otherwise>
									<div id="divAddr">${list.member_addr }</div>
								</c:otherwise>
							</c:choose>
							<div id="divAddrDetail" style="display: none;">
								<input type="text" id="inAddrDetail" placeholder="상 세 주 소">
							</div>

							<div id="saveAddr" style="display: none;">
								<button id="member_addr" onclick="addr_save()" class="btnsave">저장</button>
							</div>


							<hr>
						</div>


						<div id="email_verify_full" >
							<hr>
							<c:choose>
								<c:when test="${list.member_email_verify eq 0 }">
									<div id="email_verify" style="float: right;">
										<button onclick="email_verify()" class="bttn">이메일
											인증하기</button>
									</div>
								</c:when>
							</c:choose>
							<h2>이메일 인증여부</h2>
							<hr>
							<c:choose>
								<c:when test="${list.member_email_verify eq 0 }">
									<div id="divVerify">${list.member_email}</div>
									<div id="divVerifyState">미인증 이메일</div>
								</c:when>
								<c:otherwise>
									<div id="divVerify">${list.member_email}</div>
									<div id="divVerifyState">인증이 완료된 이메일입니다.</div>
								</c:otherwise>
							</c:choose>
							<hr>
						</div>


						<div id="alarm_agree_full">
							<hr>
							<div>
								<c:choose>
									<c:when test="${list.member_alarm_agree eq 0 }">

										<div id="alarm_agree" style="float: right;">
											<button id="btnAlarm" onclick="alarm_agree()" value="0"
												class="bttn">알림 신청</button>
										</div>
									</c:when>
									<c:otherwise>

										<div id="alarm_agree" style="float: right;">
											<button id="btnAlarm" onclick="alarm_agree()" value="1"
												class="bttn">알림 취소</button>
										</div>
									</c:otherwise>
								</c:choose>
								<h2>알람 수신 동의여부</h2>
							</div>
							<hr>
							<c:choose>
								<c:when test="${list.member_alarm_agree eq 0 }">
									<div id="divAlarmState">알람 수신 거부 상태</div>

								</c:when>
								<c:otherwise>
									<div id="divAlarmState">알람 수신 동의 상태</div>

								</c:otherwise>
							</c:choose>
							<hr>
						</div>




						<div id="alarm_agree_full"></div>







					</div>
				</div>
				<!-- /.card -->

			</div>
			<!-- /.col-lg-9 -->

		</div>

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/member/default/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery2/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap2/js/bootstrap.bundle.min.js"></script>

</body>

</html>


