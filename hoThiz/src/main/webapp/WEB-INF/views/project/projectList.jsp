<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>mysite</title>
    
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
</head>
<body>
<c:forEach var="pj" items="${firstList}">

${pj.project_title }<br>
${pj.project_summary }<br>
${pj.project_current_donated }/${project_current_percent}
${pj.project_main_category }
${pj.project_sub_category }
<hr>
</c:forEach>
<div>
    <ul id="list-guestbook">
    </ul>

</div>

<script type="text/javascript">
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
        let page =  1;
        $.ajax({
            url:"/fund/discover/getData?page=" + page ,
            type: "GET",
            dataType: "json",
            success: function(result){
                // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
                // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
                let length = Object.keys(result).length;
                console.log(length)
                if( length < 5 ){
                    isEnd = true;
                }
                $.each(result.data, function(index, vo){
                    renderList(false, vo);
                })
            }
        });
    }
    
    let renderList = function(mode, vo){
        // 리스트 html을 정의
        let html = "<li data-no='"+ vo.project_id +"'>" +
            "<strong>"+ vo.project_title +"</strong>" +
            "<p>"+ vo.content.replace(/\n/gi, "<br>") +"</p>" +
            "<strong></strong>" +

            "</li>"
        
        if( mode ){
            $("#list-guestbook").prepend(html);
        }
        else{
            $("#list-guestbook").append(html);
        }
    }
</script>
</html>