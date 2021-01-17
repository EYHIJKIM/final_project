<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글쓰기</title>
<style>
<style>
table.table{
border-collapse: collapse;
text-align: left;
line-height: 1.5;
border-top: 1px solid #ccc;
border-left: 3px solid #369;


}

table.table th{
width: 70px;
padding: 10px;
font-weight: bold;
vertical-align: top;
color: #153d73;
border-right: 1px solid #ccc;
border-left: 3px solid #036;
}

table.table td{
width: 349px;
padding: 10px;
vertical-align: top;
border-right: none;
border-bottom: none;
}



</style>
</style>
</head>
<body>
<h1 align="center">문의사항 답글쓰기</h1>
<form method="get" action="questionReply" > 
   <table class="table" align="center">
   <input type="hidden" value="${qna_board_id}" name="qna_board_id">
      <tr>
         <th scope="row">작성자</th>
         <td>
            <input class="input" type="text" size="60" value="${sessionScope.userId}" name="reply_id"  readonly>
         </td>
      </tr>
      
      <tr>
         <th scope="row">제목</th>
         <td>
          <input class="input" type="text" size="60" name="reply_title">
         </td>
      </tr>
      
      <tr>
         <th scope="row">내용</th>
         <td>
            <textarea name="reply_content" rows="10" cols="63" maxlength="300"></textarea>
         </td>
      </tr>
      <tr>
         <td   colspan="2" align="right">
            <input type=submit value="답글쓰기" /> 
            <input type=button value="취소" onClick = 
                        "location.href='question_list'">
         </td>
      </tr>
   </table>
</form>
</body>
</html>