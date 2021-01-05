<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" />
<title>Example</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
</head>

<body>
<div style="width:500px; margin:auto;">
	<form id="articleForm" role="form" action="write" method="post">
		<br style="clear: both">
		<h3 style="margin-bottom: 25px;">Article Form</h3>
		<div class="form-group">
			<input type="text" class="form-control" id="title" name="title"
				placeholder="title" required>
		</div>
		<div class="form-group">
			<textarea class="form-control" id="summernote" name="content"
				placeholder="content" maxlength="140" rows="7"></textarea>
		</div>
		<button type="submit" id="submit" name="submit"
			class="btn btn-primary pull-right">Submit Form</button>
	</form>
</div>
	
	
	<script>
		
		$(document).ready(function() {
			$('#summernote').summernote({                                        
				height : 300,
				minHeight : null,
				maxHeight : null,
				focus : true,
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