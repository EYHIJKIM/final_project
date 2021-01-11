<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 만들기 : 핫디즈</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
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
<body onload="init()">

<div class="container">
   

<h4 align="center">커뮤니티</h4>
<hr>

<div id="story_content">
      
   <div style="width:500px; margin:auto;">
   <form id="articleForm" role="form" action="/fund/write" method="post">
   <input type="hidden" name="project_id" value="${param.project_id}">
   <input type="hidden" name="member_email" value="${memberInfo.member_email}">
   <input type="hidden" name="member_name" value="${memberInfo.member_name}">
      <br style="clear: both">
      <div class="form-group">
         <input type="text" class="form-control" id="title" name="title"
            placeholder="후원자들을 위해 경과를 보고해주세요" required readonly>
      </div>
      <div class="form-group">
         <textarea class="form-control" id="summernote" name="content"
            placeholder="content" maxlength="140" rows="7">
            <h2>후원자들을 위해 진행 사항을 알려주세요!</h2>
            사진, 동영상을 통해 자세하게 올려야 합니다.
            <div id="textStory"></div>
          </textarea>
      </div>
      <input type="submit" id="submit" name="submit" value="글쓰기"
         class="btn btn-primary pull-right">
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
            focus : true,
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
            url : '/fund/image?project_id='+'${param.project_id}',
            cache : false,
            contentType : false,
            enctype : 'multipart/form-data',                                  
            processData : false,
            success : function(url) {  //파일을 올리고, 그 경로를 받아오는 것.
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