<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/login/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index">hoThiz</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="my_message">메시지</a>
            
          </li>
          <li class="nav-item">
            <a class="nav-link" href="my_donate">후원현황</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="notification">알림</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="setting">설정</a>
          </li>
          
          <li class="nav-item">
             <c:choose>
             <c:when test="${empty sessionScope.userId && sessionScope.userId == null}"><a class="nav-link" href="logout">로그인</a></c:when>
             <c:otherwise><a class="nav-link" href="logout">로그아웃</a></c:otherwise>
             </c:choose>
            
          </li>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>