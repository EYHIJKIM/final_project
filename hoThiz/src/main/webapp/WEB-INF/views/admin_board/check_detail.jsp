<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table.table{
 border-collapse: sollapse;
line-height: 1.5;
}

table.table thead th{
padding: 10px;
font-weight: bold;
vertical-align: top;
color: #369;
border-bottom: 3px solid #036;
}

table.table tbody th {
width: 150px;
padding: 10px;
font-weight: bold;
vertical-align: top;
border-bottom: 1px solid #ccc;
background: #f3f6f7;
}

table.table td{
width: 350px;
padding: 10px;
vertical-align: top;
border-bottom: 1px solid #ccc;
}


</style>
</head>
<body >
<h1 align="center">프로젝트 상세보기</h1>
<table  align="center" class="table">
<tr>
<th scope="row">
프로젝트 번호</th>
<td>
${list.project_id }
</td>
</tr>

<tr>
<th scope="row">
등록자아이디
</th>
<td>
${list.member_email}
</td>
</tr>

<tr>
<th scope="row">
제목
</th>
<td>
${list.project_title }
</td>
</tr>

<tr>
<th scope="row">
이미지
</th>
<td>
<div>
${list.project_main_image }
</div>
</td>
</tr>

<tr>
<th scope="row">
프로젝트 요약
</th>
<td>
${list.project_summary }
</td>
</tr>

<tr>
<th scope="row">
프로젝트 테그
</th>
<td>
${list.project_tag }
</td>
</tr>

<tr>
<th scope="row">
프로젝트 최종일
</th>
<td>
${list.project_deadline }
</td>
</tr>

<tr>
<th scope="row">
대분류
</th>
<td>
${list.project_main_category }
</td>
</tr>

<tr>
<th scope="row">
소분류
</th>
<td>
<p>${list.project_sub_category }</p>
</td>
</tr>

<tr>
<th scope="row">
스토리
</th>
<td>
<!-- 프로젝트스토리 --><!-- 일단보류 컬럼추가해야됨 -->
${list.project_story }
</td>
</tr>

<tr >
<th colspan="2">
<!-- 승인버튼 -->
<button onclick="location.href='agree?project_id=${list.project_id}&member_email=${list.member_email }'">승인</button>&nbsp;
<!-- 거부버튼 -->
<button onclick="location.href='disagree?project_id=${list.project_id}&member_email=${list.member_email }'">거부</button>&nbsp;
<button onclick="location.href='project_check'">승인대기 리스트</button>
</th>
</tr>
</table>

</body>
</html>