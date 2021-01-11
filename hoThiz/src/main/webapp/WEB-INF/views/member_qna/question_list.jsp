<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
text-decoration: none;
color: blue;
}

table.table{
border-collapse: collapse;
line-height: 1.5;
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
}

</style>
<script>
   function loginCheck(isLogOn){
      if(isLogOn == ""){
         alert("로그인 후 글쓰기가 가능합니다")
         location.href="${contextPath }/member/login"
      }else{
         location.href="question_write"
      }
   }
</script>
</head>
<body align="center">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<h1 align="center">문의사항</h1>

 <c:import url="../default/main_header"/>
   
   <c:if test="${question_list.size() == 0 }">
      <div>등록된 글이 없습니다.</div>
   </c:if>
   <table class="table" align="center">
   <thead>
   <tr>
   <th>작성자 아이디</th><th>제목</th><th>조회수</th>
   </tr>
   </thead>
   <c:forEach items="${question_list}" var="dto">
         <c:choose>
      <c:when test="${dto.member_email eq sessionScope.userId }">
      
      <tr>
      <td>${dto.member_email}</td>
      <td>
      <a href="question_View?qna_board_id=${dto.qna_board_id}">${dto.qna_board_title }</a>
      </td>
      <td>
      ${dto.qna_board_hit }
      </td>
      </tr>
      <tr>
      <td colspan="3">
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <c:forEach var="num" begin="1" end="${repeat }">
      
         <a href="question_list?num=${num }">[${num}]</a>
      </c:forEach>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="javascript:loginCheck('${userId}',
            '${contextPath }/memberf_qna/question_write','${contextPath }/member/login')">글작성</a>
       </td>
       </tr>
      
      </c:when>
      <c:otherwise>

      </c:otherwise>
      </c:choose>
      </c:forEach>
   
       </table>
 <c:import url="../default/main_footer"/>
</body>
</html>