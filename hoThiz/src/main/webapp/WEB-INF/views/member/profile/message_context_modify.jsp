<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>핫디즈 :: hoThiz</title>
  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/message/message_context/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
<%@ include file="../default/header.jsp" %>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h1 class="mt-5">메시지</h1>
        <p class="lead">

<form action="message_modify_update" method="POST">
<c:forEach var="msg" items="${message_context}">
   <table border=1 align="center">
      <tr>
         <td width=150 align="center" class="trb">글번호</td>
         <td>
            <input type="text" name="message_num" value="${msg.message_num }" style="width: 100%;" disabled>
            <input type="hidden" name="message_num" value="${msg.message_num}">
         </td>
      </tr>
      <tr>
         <td align="center" class="trb">작성자 아이디</td>
         <td> <input type=text value="${msg.message_send_member }" name="message_send_member" style="width: 100%;" disabled> </td>
      </tr>
      <tr>
         <td align="center"  class="trb">제목</td>
         <td><input type=text value="${msg.message_type }" name="message_type" id="message_type" style="width: 100%;"/></td>
      </tr>
      <tr>
         <td align="center"  class="trb">내용</td>
         <td><textarea rows="20" cols="60" name="message_content" 
               id="message_content">${msg.message_content }</textarea>
            <div id="reply"></div>
         </td>
      </tr>         
      <tr>
         <td align="center"  class="trb">등록일자</td>
         <td><input type=text value="${msg.message_date}" style="width: 100%;" disabled></td>
      </tr>
      <tr>
         <td colspan="2" align="center"><!-- 로그인 유저와 글 작성 아이디가 같다면 수정 삭제 보여줌  -->
            <input type="submit" value="저장">            
            <input type=button value="리스트로 돌아가기" onClick="location.href='my_message'"> 
         </td>
      </tr>
   </table>
</c:forEach>
</form>
        </p>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/message/message_context/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/message/message_context/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<%@ include file="../default/footer.jsp" %>
</body>
</html>