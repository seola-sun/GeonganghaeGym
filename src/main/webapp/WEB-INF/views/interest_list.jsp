<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 목록</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>업체명</td>
			<td>종목</td>
			<td><form>
					<select name="cost">
						<option value="none" hidden>한달 이용 금액</option>
						<option value="up_ten">10만원 이상</option>
						<option value="down_ten">10만원 이상</option>
					</select>
				</form></td>
			<td><form>
					<select>
						<option value="thumb" hidden>추천수</option>
						<option value="lot">많은 순</option>
						<option value="less">적은 순</option>
					</select>
				</form></td>
			<td>
				<form>
					<select>
						<option value="interest" hidden>관심등록수</option>
						<option value="many">많은 순</option>
						<option value="little">적은 순</option>
					</select>
				</form>
			</td>
			<td>날짜</td>

		</tr>
		<c:forEach items="${list}" var="dto">

			<tr>
				<td>${dto.id}</td>
				<td>${dto.centerCode}</td>
				<td>${dto.usage_fee_min}</td>
				<td>${dto.interest_cnt}</td>
				<td>interest</td>
				<td>${dto.regDate}</td>
				<td><a href="InterDelete?centerCode=${dto.centerCode}"> 삭제
				</a></td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>