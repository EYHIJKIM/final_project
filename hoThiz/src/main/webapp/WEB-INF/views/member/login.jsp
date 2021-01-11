<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    
    <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/login/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>핫디즈 :: hoThiz</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    <style type="text/css">
    @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
   html {
      height: 100%;
   }
   
   body {
       width:100%;
       height:100%;
        padding-top: 80px;
        padding-bottom: 40px;
        font-family: "Nanum Gothic", arial, helvetica, sans-serif;
        background-repeat: no-repeat;
        
   }
   
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   }
   
   .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
            box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
   }
    </style>
</head>
<body>
<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
<%@ include file="/WEB-INF/views/member/default/header.jsp" %>
<div class="card align-middle" style="width:20rem; border-radius:20px;">
<div class="card-title" style="margin-top:30px;">
         <h2 class="card-title text-center" style="color:#113366;">로그인</h2>
      </div>
<div class="card-body">

<form class="form-signin" action="user_check" method="post" onSubmit="logincall();return false">
   <div class="default">
      <div class="kakao" align="center">
      <a href="https://kauth.kakao.com/oauth/authorize?client_id=f9121565cb147ac1c75a51c127f3a84f&redirect_uri=http://localhost:8086/fund/success&response_type=code">
            <img width="180px" src="resources/kakao/kakao_login.png">
      </a>
      </div>
      
      <hr>
        <div class="login">
             <label for="inputEmail" class="sr-only">Your ID</label>
            <input type="text" class="form-control" name="member_email" placeholder="이메일 입력"><br>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" class="form-control" name="member_pwd" placeholder="비밀번호 입력"><br><br>
            <hr>
            <div class="checkbox">
             <label>
               <input type="checkbox" value="remember-me"> 기억하기
             </label>
           </div>
            <input class="btn btn-lg btn-primary btn-block" type="submit" value="로그인">
        </div>
        <div class="findPWD" align="center">
           <a href="new_membership">회원가입</a>&nbsp;|&nbsp;
           <a href="forgot_password">비밀번호 찾기</a>
        </div>
   </div>
</form>


</div>
</div>
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