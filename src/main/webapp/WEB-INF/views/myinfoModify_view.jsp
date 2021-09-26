<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보 수정</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="modify" method="post">
		<input type="hidden" name="id" value="${infoModify_view.id }" />
		<input type="hidden" name="name" value="${infoModify_view.name }" />
			<tr>
				<td> 아이디 </td>
				<td> ${infoModify_view.id} </td>
			</tr>
			<tr>
				<td> 비밀번호 </td>
				<td> <input type="text" name="password" value="${infoModify_view.password}" /> </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> ${infoModify_view.name} </td>
			</tr>
			<tr>
				<td> 연락처 </td>
				<td> <input type="text" name="tel_number" value="${infoModify_view.tel_number}" /> </td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td> <input type="text" name="email" value="${infoModify_view.email}" /> </td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="수정">&nbsp;&nbsp; <a href="deleteid=${infoModify_view.id}">회원탈퇴</a> &nbsp;&nbsp;</td>
			</tr>
		</form>
	</table>
</body>
</html>