<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>센터 목록</title>
</head>
<body>
	<form action="center_list.do" method="post">
		<table border="1">
			<tr>
				<th>센터명</th>
				<td align="right">
					<input name="centerName" type="text" />
				</td>
				<th>종목</th>
				<td colspan="3">
					<a href="">헬스</a>
					<a>PT</a>
					<a>필라테스</a>
					<a>요가</a>
					<a>수영</a>
					<a>발레</a>
				</td>
			</tr>
			<tr>
				<th>위치</th>
				<td align="right">
					<select name="city">
						<%-- <c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key}
						</c:forEach> --%>
						<option value="서울시">서울시
						<option value="경기도">경기도
					</select>
					<select name="gu">
						<option value="영등포구">영등포구
						<option value="금천구">금천구
					</select>
					<select name="ro">
						<option value="국회대로">국회대로
						<option value="가산디지털1로">가산디지털1로
					</select>
				</td>
				<th>금액</th>
				<td>min</td>
				<td>max</td>
				<td><input type="submit" value="검색" /></td>
			</tr>
		</table>
	</form>
	<table border="1">
		<tr>
			<td>업체명</td>
			<td>주요 종목</td>
			<td>한달 이용 금액(최소)</td>
			<td>한달 이용 금액(최대)</td>
			<td>관심등록수</td>
			<td>추천수</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><a href="center_view?centerCode=${dto.centerCode}">${dto.centerName}</a></td>
				<td>${dto.sportsName}</td>
				<td>${dto.usageFeeMin}</td>
				<td>${dto.usageFeeMax}</td>
				<td>${dto.interestCnt}</td>
				<td>${dto.recommendCnt}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>