<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>핫디즈 :: hoThiz</title>
<script type="text/javascript">
   function type_check(){
      if(document.getElementById('message_type').value == "문의유형"){
         alert("문의유형을 선택해 주세요.");
      }else{
         fo.submit();
      }
   }
</script>
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
<h1 align="center">답글쓰기</h1>
<form action="message_reply" method="post" id="fo">
   <input type="hidden" value="${boardReplyView.message_num }" name="message_num">
   <input type="hidden" value="${userId }" name="message_send_member">
   <input type="hidden" value="${boardReplyView.message_send_member }" name="message_receive_member">
   <input type="hidden" value="${boardReplyView.message_date }" name="message_date">
   <table border="0" align="center">
      <tr>
         <td>
            <hr> <b>작성자</b> <br> 
            <input type="text" size="60" name="member_email" value="${userId }" readonly>
         </td>
      </tr>
      <tr>
         <td>
            <hr> <b>문의내용</b> <br> 
            <select name="message_type" id="message_type">
               <option value="문의유형" selected disabled>문의유형</option>
               <option value="선물/후원">선물/후원</option>
               <option value="프로젝트">프로젝트</option>
               <option value="수령자 정보">수령자 정보</option>
               <option value="교환/환불">교환/환불</option>
               <option value="배송">배송</option>
               <option value="기타">기타</option>
            </select>
         </td>
      </tr>
      <tr>
         <td>
            <hr> <b>내용</b> <br>
            <textarea name="message_content" rows="10" cols="63" maxlength="300"></textarea>
         </td>
      </tr>
      <tr>
         <td>
            <input type=button value="답글쓰기" onclick="type_check()"/> 
            <input type=button value="취소" onClick = "location.href='my_message'">
         </td>
      </tr>
   </table>
</form>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/message/message_context/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/message/message_context/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<%@ include file="../default/footer.jsp" %>
</body>
</html>