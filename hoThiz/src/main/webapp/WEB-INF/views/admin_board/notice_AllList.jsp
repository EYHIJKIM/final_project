<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
a {
text-decoration: none;
}
table.table thead th{
padding: 10px;
font-weight: bold;
vertical-align: top;
color: #369;
border-bottom: 3px solid #036;
}

table.table td{
width: 350px;
padding: 10px;
vertical-align: top;
border-bottom: 1px solid #ccc;
}
</style>
</head>
<body align="center">
<h1>공지사항</h1>
<c:choose>
<c:when test="${adminList.size() == 0 }">
<h1>등록된 글이 없습니다.</h1>
</c:when>
<c:otherwise>
<table align="center" class="table">
<thead>
<tr>
<th>
제목
</th>
<th>
&nbsp;&nbsp;&nbsp;내용&nbsp;&nbsp;&nbsp;
</th>
<th>
작성시간
</th>
</tr>
</thead>
<c:forEach items="${adminList }" var="dto">
<!--  해당 프로젝트 상세페이지로감 -->
<tr>
<td>
${dto.notice_board_title }
</td>
<td>
&nbsp;&nbsp;&nbsp;<a href="notice_detail?notice_board_id=${dto.notice_board_id}">${dto.notice_board_content }</a>&nbsp;&nbsp;&nbsp;
</td>
<td>
	${dto.notice_board_date }	
</td>
</tr>			
</c:forEach>
<tr>

<td colspan="3">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<c:forEach var="num" begin="1" end="${repeat }">
	<a href="notice_AllList?num=${num }">[${num }]</a>
</c:forEach>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<button onclick="location.href='notice_write'">글쓰기</button>
</td>
</tr>
</table>
</c:otherwise>
</c:choose>
</body>
</html>