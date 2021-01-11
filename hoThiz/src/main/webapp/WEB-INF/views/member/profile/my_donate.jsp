<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Hothiz :: 핫디즈</title>

 
  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/donate/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/donate/css/heroic-features.css" rel="stylesheet">

</head>

<body>

<%@ include file="/WEB-INF/views/member/default/header.jsp" %>

  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      <h1>후원현황</h1>
      <p class="lead"><font size="5" color="red">${total_donate }</font>건의 후원 내역이 있습니다.</p>
    </header>

    <!-- Page Features -->
    <div class="row text-center">      
      
      
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:forEach items="${my_donate}" var="dto" varStatus="status">
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" id="my_donate_project" src="<%=request.getContextPath()%>/resources/img/project/title/${dto.member_email}/${dto.project_id}/${dto.project_main_image}" style="height: 240px;">
          <div class="card-body">
            <h4 class="card-title"><a href="discover/${dto.project_id }" style="color: black;">${dto.project_title }</a></font></h4>
            <p class="card-text">
               <div><a href="discover?category=${dto.project_sub_category }" style="size: 2; color: grey;">${dto.project_sub_category }</a>&nbsp;|&nbsp;<a href="search?member_email=${dto.member_email }" style="size: 2; color: grey;">${dto.member_name }</a></div>
               <div><font size="3" color="#FF3636">${dto.project_current_percent }%</font>&nbsp;|&nbsp;${donate_price[status.index].member_donate_price }</div>
            </p>
          </div>
          <div class="card-footer">
            <a href="discover/${project_id }" class="btn btn-primary">프로젝트 보러가기</a>
          </div>
        </div>
      </div>
</c:forEach>





    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

<%@ include file="../default/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/donate/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/donate/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>