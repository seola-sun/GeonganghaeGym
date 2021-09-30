<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<title>관심 목록</title>
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg bg-secondary  fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="index">건강해Gym</a>

			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="index"> HOME
					</a></li>
					<c:choose>
						<c:when test="${admin == 'Y'&& userId != null }"></c:when>
						<c:otherwise>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="center_list">
									센터찾기 </a></li>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="openstore">
									입점문의 </a></li>
						</c:otherwise>
					</c:choose>
					<c:if test="${not empty sessionScope.userName}">
						<c:if test="${admin == 'N' }">
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="myinfo_view">
									마이페이지 </a>
								<ul id="sub-menu">
									<li><a href="myinfo_view" aria-label="subemnu">내 정보</a></li>
									<li><a href="interest_list" aria-label="subemnu">관심목록</a></li>
								</ul></li>
						</c:if>
						<c:if test="${admin == 'Y' }">
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="#">서비스통계</a></li>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="#">센터관리</a></li>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="#">회원관리</a></li>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="#"> 고객센터 </a>
								<ul id="sub-menu">
									<li><a href="#" aria-label="subemnu">공지관리</a></li>
									<li><a href="#" aria-label="subemnu">문의관리</a></li>
								</ul></li>
						</c:if>
					</c:if>
					<c:choose>
						<c:when test="${admin == 'Y'&& userId != null }"></c:when>
						<c:otherwise>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="#"> 고객센터 </a>
								<ul id="sub-menu">
									<li><a href="#" aria-label="subemnu">공지사항</a></li>
									<li><a href="#" aria-label="subemnu">QnA</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<c:choose>
				<c:when test="${not empty sessionScope.userName}">
					<span style="font-family: nanumgothic; color: white;">
						${userName}님 </span>
					<a href="logout">[Logout]</a>
				</c:when>
				<c:otherwise>
					<div>
						<a href="login">로그인</a> <a href="write_view">회원가입</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<table id="index">
		<thead>
			<tr>
				<th>업체명</th>
				<th>주요 종목</th>
				<th>한달 등록비</th>
				<th>관심등록 수</th>
				<th>추천 수</th>
				<th>등록일</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.centerName}</td>
					<td>${dto.sportsCode}</td>
					<td>${dto.usage_fee_min}</td>
					<td>${dto.interest_cnt}</td>
					<td>thumbnail</td>
					<td>${dto.regDate}</td>
					<td><a href="InterDelete?centerCode=${dto.centerCode}"> 삭제
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>