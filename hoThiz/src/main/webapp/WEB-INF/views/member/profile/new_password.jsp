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
    <style>
       *{ box-sizing:border-box; }
        div.default { width:500px; height:500px; margin:0 auto; overflow: auto; text-align:center;}
        div.title{ height:20%; text-align:center; }
        div.login { height:40%; width:500px; }
        input.loginBT {}
        div.findPWD { height:20%; }
        h3{ text-align:center; }
    </style>
</head>
<body>
<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
<%@ include file="/WEB-INF/views/member/default/header.jsp" %>
<form action="new_password_commit" method="post">
   <div class="default">
      <div class="title"><h2>비밀번호 재설정 하기</h2><hr></div>
        <div class="login">
        <div>
           <span>새로운 비밀번호</span>
            <input type="password" name="member_pwd"><br>
        </div>
           <span>새로운 비밀번호 확인</span>
            <input type="password" name="pwdCh"><br>
            <input class="commit" type="submit" value="비밀번호 재설정">
            <input type="text" name="member_email" value="${param.member_email }">
            <hr>
        </div>
   </div>
</form>
<%@ include file="../default/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/donate/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/donate/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>