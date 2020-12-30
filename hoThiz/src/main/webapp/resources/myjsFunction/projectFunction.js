

function MyFavoritProject(project_id) {
			console.log("좋아요 자바스크립트 실행")
			var sessionData = "userId";
			sessionStorage.setItem("userId","1");//이거 합치면 지워라잉/////////////////
			var userId = sessionStorage.getItem(sessionData);
			var id = project_id;
			 
			if ( userId == null) {
				location.href = "/fund" //이거 합치면 로그인창으로 바꾸셈**//////////////////////
			}


			//console.log($("#btn224").val());

			var likeDto = {
				project_id : project_id,
				member_email :userId
			};



			$.ajax({
				type : 'POST',
				url : '/fund/discover/like',
				data : likeDto,
				success : function(data) { //통신 성공시 호출됨,,msg를 담자.
					//data.msg = like 혹은 cancelLike 들음.

					console.log("성공요");

					var like_img = '';

					alert(data);
					console.log(data);

					if (data == '"cancelLike"') { //좋아요 취소함
						//like_img = "images/cancelLike.png"
						$("#likeBtn" + id).html("좋아요 누르기!")

					} else { //좋아요 함
						//like_img = "images/like.png"
						$("#likeBtn" + id).html("좋아요 이미 누름")
					}

				},
				error : function() {
					alert("실패!");
				}

			});

		}

function MyAlarmProject(project_id) {
		alert("알림신청 할거임");
		alert('${alarmMemberCnt}');
			var sessionData = "userId";
			var userId = sessionStorage.getItem(sessionData);
			var id = project_id;
			
			var alarmCnt = '('+'${alarmMemberCnt}'+'명 신청중)';
			console.log("알람:"+alarmCnt);
			 
			if ( userId == null) {
				location.href = "/fund" //이거 로그인창으로 바꾸셈**//////////////////////
			}

	
			var alarmDto = {
				project_id : project_id,
				member_email : userId
		     };

			console.log(alarmDto.project_id);
			console.log(alarmDto.member_email);

			$.ajax({
				type : 'POST',
				url : '/fund/discover/alarm',
				data : alarmDto,
				success : function(data) { //통신 성공시 호출됨,,msg를 담자.
					//data = alarm / cancelAlarm

					console.log("성공요");

					//var like_img = '';

					alert(data);
					console.log(data);

					if (data == '"cancelAlarm"') { //좋아요 취소함
						//like_img = "images/cancelLike.png"
						$("#notiBtn" + id).html("알림신청"+'${alarmMemberCnt}');

					} else { //좋아요 함
						//like_img = "images/like.png"
						$("#notiBtn" + id).html("알림신청완료"+alarmCnt);
					}

				},
				error : function() {
					alert("실패!");
				}

			});

		}
		
		
		//파라미터 가져오는 함수

function urlParam(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return 0;
    }
}



//글자 제한 + 텍스트입력 막기
function numberMaxLength(e){
	e.value = e.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');	
	if(e.value.length > e.maxLength){
		e.value = e.value.slice(0, e.maxLength);
	}
}





