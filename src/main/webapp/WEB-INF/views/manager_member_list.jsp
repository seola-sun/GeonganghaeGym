<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
</head>
<body>
	<form action="manager_member_list" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<td align="right">
					<select name="searchCondition">
					<c:forEach items="${conditionMap }" var="option">
						<option value="${option.value }">${option.key  }
					</c:forEach>
					<input name="searchKeyword" type="text"/>
					<input type="submit" value="검색"/>
					
					</select>
				</td>	
			</tr>
		</table>
	</form>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>이름(아이디)</td>
			<td>연락처</td>
			<td>수정 날짜</td>
			<td>등록 날짜</td>
			
		</tr>
		<c:forEach items="${manager_member_list}" var="dto">
		<tr>
			<td>
				<a href="manager_member_content_view?id=${dto.id}">${dto.name}(${dto.id })</a></td>
			<td>${dto.tel_number}</td>
			<td>${dto.moddate }</td>
			<td>${dto.regdate}</td>

		</tr>
		</c:forEach>
		<tr>
	</table>
	
</body>
</html>