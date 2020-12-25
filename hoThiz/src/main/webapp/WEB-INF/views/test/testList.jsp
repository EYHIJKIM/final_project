<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무한스크롤 페이징</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
	<form action="/fund/discover" method="GET">
		<input type="search" name="search"> <input type="submit" />
	</form>
	<br>
<c:forEach var="prj" items="${firstList}">
				<h3>${prj.project_title }</h3>
				${prj.project_id}
				${prj.project_summary}<br>
				d_day : ${dDayMap[prj.project_id].d_day}<br>
				chk : ${dDayMap[prj.project_id].chk}<br>

	<hr>
</c:forEach>



</body>
</html>