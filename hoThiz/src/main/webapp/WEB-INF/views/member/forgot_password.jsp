<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫디즈 :: hoThiz</title>
    <style>
       *{ box-sizing:border-box; }
        div.default { width:500px; height:500px; margin:0 auto; overflow: auto; text-align:center;}
        div.findPwd{ height:20%; text-align:center; }
        div.msg { height:40%; width:500px; }
        div.sendEmail { height:20%; }
        h3{ text-align:center; }
    </style>
</head>
<body>
<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
<%@ include file="default/header.jsp" %>
<form action="find_pwd" method="post">
   <div class="default">
      <div class="findPwd"><h1>비밀번호 찾기</h1></div>
      <div><hr></div>
        <div class="msg">
           <br><br>
         <span>핫디즈 가입 시 사용하신 이메일을 입력하시면 새 비밀번호를 생성할 수 있는 링크를 보내드립니다.</span><br><br>
         <span>카카오톡으로 가입하신 경우, 카카오톡 계정에 쓰이는 이메일을 입력해주세요.</span>
        </div>
        <div><hr></div>
        <div class="sendEmail">
           <input type="text" name="findPwd" placeholder="가입하신 이메일을 입력해 주세요."><br>
           <input type="submit" value="비밀번호 재설정 링크 받기">
        </div>
   </div>
</form>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/message/message_context/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/message/message_context/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<%@ include file="default/footer.jsp" %>
</body>
</html>