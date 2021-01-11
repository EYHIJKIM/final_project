<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 만들기 : 핫디즈</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
function videoBtn(){
   $("#video_content").show();
   $("#video").hide();
}
function videoCencel(){
   $("#video").show();
   $("#video_content").hide();
}
function videoInsert(){
   var video = $("#userVideo").val()
   var projectId = $("#project_id").val();
   var form = {project_video:video,project_id:projectId}
   $.ajax({
      url : "insert_video",
      type : "POST",
      data : form,
      success : function(cnt){
         $("#video_view").html(cnt)
         
      },
      error : function(){
         alert("video문제발생")
      }
   })
}


</script>





<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" />
<title>Example</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script   src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link   href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script   src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

<style type="text/css">

.containers {
   background-color: gray;
}
</style>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setCharacterEncoding("utf-8"); %>
<c:import url="header.jsp"></c:import>

<div class="container">
   
      <h4>프로젝트 소개 영상</h4>
   <hr>
      <label>프로젝트 소개 영상</label><br><br>
<div id="video">
<button type="button" onclick="videoBtn()" class="btn btn-secondary">프로젝트 영상을 등록해주세요</button>

</div>
<div id="video_content">
   아래 가이드에 따라 유튜브 동영상을 등록해주세요.<br><br>
   <img src="<%=request.getContextPath() %>/resources/guide/공유버튼.png"><br>
   업로드 하실 유튜브 동영상에서 공유 버튼을 눌러주세요<br>
   <img width="400" height="280" src="<%=request.getContextPath() %>/resources/guide/퍼가기버튼.png"><br>
   나타난 창에서 퍼가기 버튼을 눌러주세요<br>
   <img width="300" height="350" src="<%=request.getContextPath() %>/resources/guide/퍼가기.png"><br>
   해당 부분을 복사해 아래 입력창에 입력해주세요<br>
   <input type="text" id="userVideo"><input type="button" onclick="videoInsert()" value="저장하기"><br><br>
   <div id="video_view"></div>
   <input type="button" onclick="videoCencel()" value="닫기">
</div>
<hr>





<h4>프로젝트 스토리</h4>
<hr>
<label>프로젝트 스토리</label><br><br>
<div id="story">
프로젝트 스토리를 입력해주세요<br><br>
</div>
<div id="story_content">
      
   <div style="width:500px; margin:auto;">
   <form id="articleForm" role="form" action="write" method="post">
   <input type="hidden" name="project_id" id="project_id" value="${param.id}">
      <br style="clear: both">
      <div class="form-group">
         <input type="text" class="form-control" id="title" name="title"
            placeholder="스토리를 입력해주세요" required readonly>
      </div>
      <div class="form-group">
         <textarea class="form-control" id="summernote" name="content"
            placeholder="content" maxlength="140" rows="7">
            <div id="textStory">
             </div>
          </textarea>
      </div>
      <button type="submit" id="submit" name="submit"
         class="btn btn-primary pull-right">저장하기</button>
   </form>
</div>

   
</div>

</div>



   <script>
      
      $(document).ready(function() {
         $('#summernote').summernote({                                        
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : false,
            lang : "ko-KR",
            toolbar: [
                // [groupName, [list of button]]
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                ['color', ['forecolor','color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert',['picture','link','video']],
                ['view', ['fullscreen', 'help']]
              ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
            callbacks : {  
               onImageUpload : function(files, editor, welEditable) {       
                  for (var i = 0; i < files.length; i++) {
                     sendFile(files[i], this);
                     console.log(i)
                  }
               }
            }
         });
      });
      function sendFile(file, el) {
         var form_data = new FormData();
         form_data.append('file', file);
         $.ajax({                                                              
            data : form_data,
            type : "POST",
            url : 'image',
            cache : false,
            contentType : false,
            enctype : 'multipart/form-data',                                  
            processData : false,
            success : function(url) {  
               console.log('url : '+url.url)
               $(el).summernote('insertImage', url.url, function($image) {
                  $image.css('width', "25%");
               });
            },error: function(){
               console.log('실패')
            }
         });
      }
   </script>

</body>

</html>