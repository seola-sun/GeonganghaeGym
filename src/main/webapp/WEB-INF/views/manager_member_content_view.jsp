<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
			<form action="manager_member_modify_view?id=${manager_member_content_view.id}" method="post">
			<tr>
				<td> 이름 </td>
				<td> ${manager_member_content_view.name} </td>
			</tr>
			<tr>
				<td> 아이디 </td>
				<td> ${manager_member_content_view.id} </td>
			</tr>
			<tr>
				<td> 연락처 </td>
				<td> ${manager_member_content_view.tel_number}</td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td> ${manager_member_content_view.email}</td>
			</tr>
			<tr>
				<td> 등록 날짜 </td>
				<td> ${manager_member_content_view.regdate} </td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp; <a href="manager_member_list">목록보기</a> &nbsp;&nbsp; <a href="manager_member_delete?id=${manager_member_content_view.id}">삭제</a> &nbsp;&nbsp;</td>
			</tr>
		</form>
	</table>

	
</body>
</html>