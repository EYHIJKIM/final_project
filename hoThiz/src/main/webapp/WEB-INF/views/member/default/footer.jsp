<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style tyle="text/css">

footer {

   

    bottom:0;

    width:100%;

    height:5%;   

    background:#ccc;

}


</style>
<!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/message/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/message/css/shop-item.css" rel="stylesheet">
</head>
<body>
<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <a href="notice_AllList" style="color: white;">공지사항</a><br>
    
      <c:choose>
             <c:when test="${empty sessionScope.userId && sessionScope.userId == null}"></c:when>
             <c:otherwise><a href="question_list" style="color: white;">문의사항</a></c:otherwise>
             </c:choose>
    
  
    <div class="container">
      <p class="m-0 text-center text-white">hoThiz &copy; Your 2020</p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>