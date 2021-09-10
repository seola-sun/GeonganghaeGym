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
		<form action="write" method="post">
			<tr>
				<td> 아이디 </td>
				<td> <input type="text" name="id" size = "50"> </td>
			</tr>
			<tr>
				<td> 비밀번호 </td>
				<td> <input type="text" name="password" size = "50"> </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="name" size = "50"> </td>
			</tr>
			<tr>
				<td> 연락처 </td>
				<td> <input type="text" name="tel_number" size = "50"> </td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td> <input type="text" name="email" size = "50"> </td>
			</tr>
			<tr>
				<td> 우편주소 </td>
				<td> <input type="text" name="zipcode" size = "50"> </td>
			</tr>
			<tr>
				<td> 주소 </td>
				<td> <input type="text" name="address" size = "50"> </td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="입력"></td>
			</tr>
		</form>
	</table>
	
</body>
</html>