<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>One Page Wonder - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/css/one-page-wonder.min.css" rel="stylesheet">

</head>

<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<%@ include file="../default/header.jsp" %>

	<br>
	<br>

 

  <section>
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6">
          <div class="p-5">
			<c:choose>
			<c:when test="${empty member_profile_pic }">
            <img class="img-fluid rounded-circle" src="${contextPath }/resources/profileImage/main_profPic.png" alt="">
          </c:when>
          <c:otherwise>
            <img class="img-fluid rounded-circle" src="${contextPath }/resources/img/${member_email}/${member_profile_pic}" alt=""> 
          </c:otherwise>
          </c:choose>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="p-5">
            <h2 class="display-4">${member_name }</h2>
            <p>${member_introduce }</p>
          </div>
        </div>
      </div>
    </div>
  </section>



  

<%@ include file="../default/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
