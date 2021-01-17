<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자가 ID검색해서 찾은 목록</title>
</head>
<body align="center">
<h1>아이디 검색으로 출력</h1>
		<c:if test="${idSelect.size() == 0 }">
      <div>등록된 글이 없습니다.</div>
   		</c:if>
	<c:forEach items="${idSelect}" var="dto">
	
		작성자 아이디 : ${dto.member_email}<br>
		작성 시간 : ${dto.qna_board_date }<br>
		조회수 : ${dto.qna_board_hit }<br>
		제목 : <a href="question_View?qna_board_id=${dto.qna_board_id}">${dto.qna_board_title }</a><br>
		내용 : ${dto.qna_board_content }<br>	
		<hr>
	</c:forEach>
	<div align="center">
	<c:forEach var="num" begin="1" end="${repeat }">
	<a href="questionAd_list?num=${num }">[${num }]</a>
	</c:forEach>
	</div>
</body>
</html>