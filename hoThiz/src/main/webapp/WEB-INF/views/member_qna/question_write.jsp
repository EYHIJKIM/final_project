<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table.table{
border-collapse: collapse;
text-align: left;
line-height: 1.5;
border-top: 1px solid #ccc;
border-left: 3px solid #369;
margin: 20px 10px;
}

table.table th{
width: 147px;
padding: 10px;
font-weight: bold;
vertical-align: top;
color: #153d73;
border-right: 1px solid #ccc;
border-bottom: 1px solid #ccc;
}

table.table td{
width: 349px;
padding: 10px;
vertical-align: top;
border-right: 1px solid #ccc;
border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--<c:import url="../default/main_header.jsp"/><hr>-->
 <form method="post" action="write_save" align="center">
 <h1>문의사항 작성</h1>
      <table class="table" align="center">
         <tr>
         	<th>아이디</th>
         		<td>
         		<input type="text" size="20" maxlength="20" name="member_email" value="${userId}" disabled/><br>
         		</td>
         </tr>
             
         <tr>
            <th>제목</th>
            <td> 
               <input type="text" size="48" maxlength="100" name="qna_board_title" />
            </td>
         </tr>
         
         <tr>
            <th>내용</th>
            <td>
               <textarea name="qna_board_content" rows="10" cols="50" maxlength="100"></textarea>
            </td>
         </tr>
         
         <tr>
            <td colspan="2" align="right">
               <input type="submit" value="글쓰기" />
               <input type=button value="목록보기" 
                        onClick="location.href='question_list'" >
            </td>
         </tr>
      </table>
   </form>
<!--<c:import url="../default/main_footer.jsp"/>-->
</body>
</html>