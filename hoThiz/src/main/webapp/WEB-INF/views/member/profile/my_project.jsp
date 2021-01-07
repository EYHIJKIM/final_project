<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Heroic Features - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/css/heroic-features.css" rel="stylesheet">

</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
<%@ include file="../default/header.jsp" %>

  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      <h1 class="display-3">내프로젝트목록</h1>
      <p class="lead">
      ${fn:length(myProjectList)}개가 있습니다
      </p>
     
    </header>

    <!-- Page Features -->
    <div class="row text-center">

<c:choose>
<c:when test="${fn:length(myProjectList) < 0 }">
<h2>좋아요한 프로젝트가 없습니다</h2>
</c:when>
<c:otherwise>
<c:forEach var="dto"  items="${myProjectList }">
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="${contextPath }/resources/img/project/title/${dto.member_email}/${dto.project_id}/${dto.project_main_image}" alt="">
          <div class="card-body">
            <h4 class="card-title">${dto.project_title }</h4>
            <p class="card-text">
            <c:choose>
            <c:when test="${dto.project_check eq -1}">
         	작성중인상태
            </c:when>
            <c:when test="${dto.project_check eq 0}">
            검토대기중
            </c:when>
            <c:otherwise>
            프로젝트 검토완료
            </c:otherwise>
            </c:choose>
            </p>
          </div>
          <div class="card-footer">
           
                   <c:choose>
            <c:when test="${dto.project_check eq -1}">
         	 <a href="#" class="btn btn-primary">수정</a>
            </c:when>
            <c:when test="${dto.project_check eq 0}">
           <a href="#" class="btn btn-primary">수정</a>
            </c:when>
            <c:otherwise>
             <a href="#" class="btn btn-primary">프로젝트 바로가기</a>
            </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>

</c:forEach>
</c:otherwise>
</c:choose>




     

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

<%@ include file="../default/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>