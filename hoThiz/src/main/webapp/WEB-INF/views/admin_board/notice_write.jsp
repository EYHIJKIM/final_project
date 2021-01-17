<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>

table.table thead th{
padding: 10px;
font-weight: bold;
vertical-align: top;
color: #369;

}

input{
border: 1px solid #036;
border-radius: 0px;
}

textarea{
border: 1px solid #036;
border-radius: 0px;
}
</style>
</head>
<body align="center">
	<h1>공지사항작성</h1>
	<form action="notice_save">
	<table class="table" align="center">
	<thead>
	<tr>
	<th>
	제목
	</th>
	</tr>
	</thead>
	
	<tr>
	<td>
	<input type="text" row="2" size="48" maxlength="100" name="notice_board_title"><br><br>
	</td>
	</tr>
	
	<thead>
	<tr>
	<th>
	내용
	</th>
	</tr>
	</thead>
	
	<tr>
	<td>
	<textarea name="notice_board_content" rows="10" cols="50" maxlength="100"></textarea><br>
	</td>
	</tr>
	
	<tr>
	<td>
	<input type="submit" value="저장">
	<input type="button" value="취소" onclick="location.href='admin'">
	</td>
	</tr>
	</table>
	</form>
</body>
</html>