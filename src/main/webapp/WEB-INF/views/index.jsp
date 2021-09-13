<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>건강해Gym HOME</title>
</head>
<body>
	<div>
		<header>
		<div>
			<c:choose>
				<c:when test="${not empty sessionScope.userName}">
					${userName}님, 환영합니다. <a href="logout">[Log-out]</a>
				</c:when>
				<c:otherwise>
					<a href="login">LOG-IN</a>
					<a href="write_view">회원가입</a>
				</c:otherwise>
			</c:choose>
		</div>

		<div>
			<li><a href="#">HOME</a></li>
			<li><a href="center_list">센터 찾기</a>
			<li><a href="#">입점 문의</a>
				<c:if test="${not empty sessionScope.userName}">
					<li><a href="#">마이페이지</a>
						<ul>
							<li><a href="#">내 정보</a>
							<li><a href="#">관심 목록</a>
						</ul>
				</c:if>
			<li><a href="#">고객 센터</a>
				<ul>
					<li><a href="#">공지 사항</a>
					<li><a href="#">QnA</a>
				</ul></li>
		</div>

		</header>

	</div>
</body>
</html>