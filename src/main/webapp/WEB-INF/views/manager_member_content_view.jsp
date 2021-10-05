<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link href="./resources/css/center_list02.css" rel="stylesheet" /> 

<body>
	<table class="type03" style="position:absolute; left:30%; top:100px;" >
			<form action="manager_member_modify_view?id=${manager_member_content_view.id}" method="post">
			<tr>
				<th> 이름 </th>
				<td> ${manager_member_content_view.name} </td>
			</tr>
			<tr>
				<th> 아이디 </th>
				<td> ${manager_member_content_view.id} </td>
			</tr>
			<tr>
				<th> 연락처 </th>
				<td> ${manager_member_content_view.tel_number}</td>
			</tr>
			<tr>
				<th> 이메일 </th>
				<td> ${manager_member_content_view.email}</td>
			</tr>
			<tr>
				<th> 등록 날짜 </th>
				<td> ${manager_member_content_view.regdate} </td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp; <a href="manager_member_list" style="color: black; font-weight:bold; text-decoration: underline;">목록보기</a> &nbsp;&nbsp; <a href="manager_member_delete?id=${manager_member_content_view.id}" style="color: black; font-weight:bold; text-decoration: underline;">삭제</a> &nbsp;&nbsp;</td>
			</tr>
		</form>
	</table>

	
</body>
</html>