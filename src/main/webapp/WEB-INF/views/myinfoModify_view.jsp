<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 글꼴을 링크에서 가져옴 -->
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>내 정보 수정</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="./resources/js/all.min.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link rel="stylesheet" href="./resources/css/heading.css">
<link rel="stylesheet" href="./resources/css/body.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/myinfo_view.css" rel="stylesheet" />

<!-- 상단 메뉴바 하위 목록들 CSS, css파일로 옮기면 적용이 안됨 -->
<style>
a {
	text-decoration: none;
}

ul li {
	list-style: none;
}

#navbarResponsive>ul>li>ul {
	width: 130px;
	display: none;
	position: absolute;
	font-size: 15px;
	background: #182952;
}

#navbarResponsive>ul>li:hover>ul {
	display: block;
}

.masthead-avatar {
	padding-top: 35px;
	transform: scale(2.0);
	transition: .5s;
}
</style>
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
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0"></h2>

			<!-- Portfolio Grid Items-->
			<div class="row justify-content-center">
				<!-- Portfolio Item 1-->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item-caption-content text-center text-white">
						<i class="fas fa-plus fa-3x"></i>
					</div>
				</div>

				<!-- 내 정보 수정하기 코드 -->
				<center>
					<form action="modify" method="post">
						<input type="hidden" name="id" value="${infoModify_view.id }" />
						<input type="hidden" name="name" value="${infoModify_view.name }" />
						<table width="800">
							<tr height="40">
								<td align="center"><b>[내 정보 수정]</b></td>
							</tr>
						</table>
						<table width="700" height="400" cellpadding="0"
							style="border-collapse: collapse; font-size: 9pt;">
							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">회원 ID</td>
								<td>${infoModify_view.id}
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>
							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">비밀번호</td>
								<td><input type="text" name="password"
									value="${infoModify_view.password}" /></td>
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>


							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">이 름</td>
								<td>${infoModify_view.name}</td>
							</tr>

							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>

							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">연락처</td>
								<td><input type="text" name="tel_number"
									value="${infoModify_view.tel_number}" /></td>
							</tr>

							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>

							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">이메일</td>
								<td><input type="text" name="email"
									value="${infoModify_view.email}" /></td>
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>
						</table>
						<br />
						<div class="submit">
							<input type="submit" style="width: 120pt; height: 40pt;"
								value="수정" onclick="alert('회원정보가 수정되었습니다.');">
							&nbsp;&nbsp; <a href="delete?id=${infoModify_view.id}"
								style="color: black;onclick=" alert('회원탈퇴완료되었습니다.');"> 회원탈퇴</a>
							&nbsp;&nbsp;

						</div>
					</form>
				</center>
			</div>
		</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>

