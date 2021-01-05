<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<title>Example</title>



</head>
<body>

<c:set var="userId" value="1"/>
<c:set var="member_name" value="cc"/>
<c:set var="project_id" value="255"/>

<form id="writeForm" action="write" method="post">
	<input type="hidden" name="member_email" value="${userId}">
	<input type="hidden" name="member_name" value="${member_name}">
	<input type="hidden" name="project_id" value="${project_id}">
	<textarea name="content" id="contentForm">
	</textarea>
	
<input type="button" onclick="checkForm()" value="글 작성">

</form>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function checkForm(){
		var text=$("#contentForm").val();
		if(text.replace(/\s| /gi, "").length==0){
			
			console.log("이프문")
			alert("내용을 입력하세요.");
		} else{
			writeForm.submit();
		}
		
		
	}


</script>

</body>
</html>