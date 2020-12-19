/**
 * 
 */

var page = 0;
	//document의 height : 전체 스크롤 길이
	//window의 height: 스크롤 바의 길이
	//window의 scrollTop: 내려온 스크롤 길이(스크롤 바 기준으로 위쪽 공간)
	function infiniteScroll(){
		console.log("인피니트 진입")
		//만약 전체 스크롤-10보다 내려온 스크롤이 크면(밑바닥에 거의 닿으면)
		if($(document).height()-50<=$(window).height()+$(window).scrollTop()){
			console.log(page);
			page +=1;
			//list객체에서 page값을 1 올려준다.
			
			//비동기 실행
			$.ajax({
				type: 'GET',
				url : 'getData?locatedPage='+page,
				contentType : "application/json",
				success : function(data){
					console.log("성공");
					console.log(data);
					let html=""
						$.each(data, function(index, item){
							html += "<b>프로젝트넘버 : </b>"+item.project_id+"<br>";
							html += "<b>아이디 : </b>" +item.member_name+"<br>";
							html += "<b>제목 : </b>" +item.project_title+"<br>";
						});
						$("#scrollContent").append(html);
						
				}//success func
				
				
			});//ajax 실행
			

			
		}
	}//infiniteScroll함수
	
	$(document).ready(function(){
		$(window).scroll(infiniteScroll)
	});
	
	
	
	
	

    let isEnd = false;
    
    $(function(){
        $(window).scroll(function(){
            let $window = $(this);
            let scrollTop = $window.scrollTop();
            let windowHeight = $window.height();
            let documentHeight = $(document).height();
            
            console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
            
            // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
            if( scrollTop + windowHeight + 30 > documentHeight ){
                fetchList();
            }
        })
        fetchList();
    })
    
    let fetchList = function(){
        if(isEnd == true){
            return;
        }
        
        // 방명록 리스트를 가져올 때 시작 번호
        // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
        // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
        var page = 0;
        page +=1;
        $.ajax({
            url:"/fund/discover/getProjectList?page=" + startNo ,
            type: "GET",
            contentType : "application/json",
            success: function(result){
                // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
                // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
                let length = result.data.length;
                if( length < 5 ){
                    isEnd = true;
                }
                $.each(result, function(index, vo){
                    renderList(false, vo);
                })
            }
        });
    }
    
    let renderList = function(mode, vo){
        // 리스트 html을 정의
        let html = "<li data-no='"+ vo.no +"'>" +
            "<strong>"+ vo.name +"</strong>" +
            "<p>"+ vo.content.replace(/\n/gi, "<br>") +"</p>" +
            "<strong></strong>" +
            "<a href='#' data-no='"+ vo.no +"'>삭제</a>" +
            "</li>"
        
        if( mode ){
            $("#list-guestbook").prepend(html);
        }
        else{
            $("#list-guestbook").append(html);
        }
    }

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	