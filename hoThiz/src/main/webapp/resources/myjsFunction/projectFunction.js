





//좋아요 프로젝트
function MyFavoritProject(project_id) {

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
					
					var like_img = '';


					if (data == '"cancelLike"') { //좋아요 취소함
						$("#likeBtn" + id).children(".likeImg").attr('src','/fund/resources/img/blankHeart.png');
						$("#likeBtn" + id).css('background-color','white');
						$("#likeBtn" + id).css('outline','none');
						$("#likeBtn" + id).css('border','none');
					

						

					} else { //좋아요 함
						
					$("#likeBtn" + id).children(".likeImg").attr('src','/fund/resources/img/fullHeart.png');
						$("#likeBtn" + id).css('background-color','white');
						$("#likeBtn" + id).css('outline','none');
						$("#likeBtn" + id).css('border','none');
					}
					
					$("#likeBtn" + id).attr('class',like_img);

				},
				error : function() {
					alert("실패!");
				}

			});

		}

function MyAlarmProject(project_id,alarmMemberCnt) {
		
			var sessionData = "userId";
			var userId = sessionStorage.getItem(sessionData);
			var id = project_id;
			sessionStorage.setItem("userId","1");//이거 합치면 지워라잉/////////////////
			var cnt = alarmMemberCnt;
			var msg='';


			console.log(cnt);
	
			 
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

	
					if (data == '"cancelAlarm"') { //좋아요 취소함

						$("#notiBtn" + id).html('알림신청');

					} else { //좋아요 함
						$("#notiBtn" + id).html("알림신청완료");
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






  
  
  



