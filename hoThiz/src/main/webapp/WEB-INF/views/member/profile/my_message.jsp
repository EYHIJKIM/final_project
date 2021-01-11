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

  <title>핫디즈 :: hoThiz</title>
  <style type="text/css">
     td{padding: 5px 25px 5px 25px;}
  </style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

function message_all(a){
   document.getElementById('card-header').innerHTML = '모든 메시지';
   console.log("a 값 = " + a);
   var sessionID = $("#sessionID").val();
   var form = {member_email:sessionID};
   var i = a;
   $.ajax({
      url : "message_all?num="+i,
      type : "GET",
      data : form,
      success : function(arr){
         var html='<table>';
         html +='<tr>';
         html +='<td>보낸사람</td><td>받은사람</td><td>문의 내용</td><td>날짜</td>';
         html +='</tr>';
         var pageLetter = 10; // 페이지당 들어올 글 수            
         var allCount = arr.length; //총글갯수      
         console.log("arr길이 = "+allCount);
         var all_repeat = $("#all_repeat").val();
         
         console.log("all_repeat = "+all_repeat);
         console.log("userId = "+$("#userId").val());
         
         if(allCount == 0){
            html += '<tr><th colspan="4">등록된 글이 없습니다.</th></tr>';
         }else{
            $.each(arr, function(index, item){                  
               html +='<tr>';               
               html +='<td>' + item.message_send_member + '</td>';
               html +='<td>'+item.message_receive_member+'</td>';
               html +='<td><a href="message_context?message_num='+item.message_num+'">'+item.message_type+'</a></td>';
               html +='<td>'+item.message_date+'</td>';               
               html +='</tr>';
            });
            
            html += '<tr>';
            html += '<td colspan="4" align="right">';
            html += '<div align="left">';
            
            console.log("all_repeat = "+all_repeat);
            
            for(i=1; i <= all_repeat; i++){
               console.log("i값 for문 = " + i);
               html += '<a href="#" onclick="message_all('+i+')">['+i+']</a>';
            }
            html += '</div>';
            html += '</td>';
            html += '</tr>';
         }
         html +='</table>';
         $("#message_list").empty(html);
         $("#message_list").append(html);
      },
      error : function(){            
         alert("문제가 발생했습니다.");
      }
   });
}

   function message_send(a){
      document.getElementById('card-header').innerHTML = '보낸 메시지';
      console.log("a 값 = " + a);
      var sessionID = $("#sessionID").val();
      var form = {member_email:sessionID};
      var i = a;
      $.ajax({
         url : "message_send?num="+i,
         type : "GET",
         data : form,
         success : function(arr){
            var html='<table>';
            html +='<tr>';
            html +='<td>받은사람</td><td>문의 내용</td><td>날짜</td>';
            html +='</tr>';
            var pageLetter = 10; // 페이지당 들어올 글 수            
            var allCount = arr.length; //총글갯수            
            var send_repeat = $("#send_repeat").val();
            console.log("sessionScope.send_repeat = " + send_repeat);
            if(allCount == 0){
               html += '<tr><th colspan="3">등록된 글이 없습니다.</th></tr>';
            }else{
               $.each(arr, function(index, item){                  
                  html +='<tr>';
                  html +='<td>'+item.message_receive_member+'</td>';
                  html +='<td><a href="message_context?message_num='+item.message_num+'">'+item.message_type+'</a></td>';
                  html +='<td>'+item.message_date+'</td>';                  
                  html +='</tr>';
               });
               
               console.log("repeat = " + send_repeat);
               console.log("userId = "+$("#userId").val());
               
               html += '<tr>';
               html += '<td colspan="3" align="right">';
               html += '<div align="left">';
               
               for(i=1; i <= send_repeat; i++){
                  console.log(i);
                  console.log("i값 for문 = " + i);
                  html += '<a href="#" onclick="message_send('+i+')">['+i+']</a>';
               }
               html += '</div>';
               html += '</td>';
               html += '</tr>';
            }
            html +='</table>';
            $("#message_list").empty(html);
            $("#message_list").append(html);
         },
         error : function(){            
            alert("문제가 발생했습니다.");
         }
      });
   }
   
   function message_receive(a){
      document.getElementById('card-header').innerHTML = '받은 메시지';
      console.log("a 값 = " + a);
      var sessionID = $("#sessionID").val();
      var form = {member_email:sessionID};
      var i = a;
      $.ajax({
         url : "message_receive?num="+i,
         type : "GET",
         data : form,
         success : function(arr){
            var html='<table>';
            html +='<tr>';
            html +='<td>보낸사람</td><td>문의 내용</td><td>날짜</td>';
            html +='</tr>';
            var pageLetter = 10; // 페이지당 들어올 글 수            
            var allCount = arr.length; //총글갯수      
            console.log("arr길이 = "+allCount);
            var receive_repeat = $("#receive_repeat").val();
            console.log("receive_repeat = "+receive_repeat);
            if(allCount == 0){
               html += '<tr><th colspan="3">등록된 글이 없습니다.</th></tr>';
            }else{
               $.each(arr, function(index, item){   
                  
                  html +='<tr>';
                  html +='<td>' + item.message_send_member + '</td>';
                  html +='<td><a href="message_context?message_num='+item.message_num+'">'+item.message_type+'</a></td>';
                  html +='<td>'+item.message_date+'</td>';
                  html +='</tr>';
               });
               
               html += '<tr>';
               html += '<td colspan="3" align="right">';
               html += '<div align="left">';
               
               console.log("receive_repeat123 = "+receive_repeat);
               console.log("userId = "+$("#userId").val());
               
               for(i=1; i <= receive_repeat; i++){
                  console.log("i값 for문 = " + i);
                  html += '<a href="#" onclick="message_receive('+i+')">['+i+']</a>';
               }
               html += '</div>';
               html += '</td>';
               html += '</tr>';
            }
            html +='</table>';
            $("#message_list").empty(html);
            $("#message_list").append(html);
         },
         error : function(){            
            alert("문제가 발생했습니다.");
         }
      });
   }
   
</script>
  

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
<%@ include file="/WEB-INF/views/member/default/header.jsp" %>
   <input type="hidden" id="all_repeat" value="${sessionScope.all_repeat }">
   <input type="hidden" id="send_repeat" value="${sessionScope.send_repeat }">
   <input type="hidden" id="receive_repeat" value="${sessionScope.receive_repeat }">
   <input type="hidden" id="userId" value="${sessionScope.userId }">
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">
        <h1 class="my-4">메시지</h1>
        <div class="list-group">
        
          <a href="#" onclick="message_all(1)" id="message_all" class="list-group-item active">모든 메시지</a>
          <a href="#" onclick="message_send(1)" id="message_send" class="list-group-item">보낸 메시지</a>
          <a href="#" onclick="message_receive(1)" id="message_receive" class="list-group-item">받은 메시지</a>
        </div>
      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div class="card mt-4" style="align-content: center;">
          <img class="card-img-top img-fluid" src="<%=request.getContextPath()%>/resources/message/message_logo.png" alt="" style="height: 200px; width: 400px;">
          
        </div>
        <!-- /.card -->

        <div class="card card-outline-secondary my-4">
          <div class="card-header" id="card-header">
               모든 메시지
          </div>
          <div class="card-body">
            <div id="message_list" style="border:1px;">
            
         <table>
            <tr>
               <td>보낸사람</td><td>받은사람</td><td></td><td>문의 내용</td><td>날짜</td>
            </tr>
            <c:if test="${messageList.size() == 0}">
               <tr><th colspan="4">등록된 글이 없습니다.</th></tr>
            </c:if>
            <c:forEach items="${messageList}" var="dto">            
            <tr>
               <td>${dto.message_send_member}</td>
               <td colspan="2">${dto.message_receive_member}</td>
               <td><a href="message_context?message_num=${dto.message_num}">${dto.message_type}</a></td>
               <td>${dto.message_date}</td>               
            </tr>
            </c:forEach>
            <tr>
               <td colspan="5" align="right">
               <div align="left">
               <c:forEach var="num" begin="1" end="${repeat }">
                  <a href="my_message?num=${num }">[${num}]</a>
               </c:forEach>
               </div>
               </td>
            </tr>
         </table>
         
      </div>      
          </div>
        </div>
        <!-- /.card -->

      </div>
      <!-- /.col-lg-9 -->

    </div>

  </div>
  <!-- /.container -->

  <%@ include file="../default/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/message/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/message/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>