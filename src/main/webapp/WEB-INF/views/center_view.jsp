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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- by설아, jquery 사용하기 위한 링크 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- by설아, Font Awesome 아이콘 사용하기 위한 링크 (추천 하트, 관심 등록 별표) -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- by설아, 센터 추천 기능 -->
<script>
	$(function() {
		// 추천 버튼 클릭시(추천 추가 또는 추천 제거)
		$("#rec_update").click(function() {
			$.ajax({
				url : "RecUpdate",
				type : "POST",
				data : {
					center : '${center_view.centerCode}',
					member : '${userId}'
				},
				success : function() {
					recCount();
					recCheck();
				},
			})
		})

		// 센터 추천수 표시
		function recCount() {
			$.ajax({
				url : "RecCount",
				type : "POST",
				data : {
					center : "${center_view.centerCode}"
				},
				success : function(count) {
					$(".rec_cnt").html(count);
				}
			});
		}

		// 로그인 유저의 해당 센터 추천 체크
		function recCheck() {
			$.ajax({
				url : "RecCheck",
				type : "POST",
				data : {
					center : "${center_view.centerCode}",
					member : "${userId}"
				},
				success : function(count) {
					if (count == 1) {
						// 꽉 찬 하트 출력
						$("#recommend").html(
								"<i class=\"fas fa-heart fa-lg\"></i>그만추천하기");
					} else {
						// 빈 하트 출력
						$("#recommend").html(
								"<i class=\"far fa-heart fa-lg\"></i>추천하기");
					}
				}
			});
		}
		// 처음 시작했을 때 실행되도록 해당 함수 호출
		recCount();
		recCheck();
	})
</script>
<!-- by설아, 센터 관심등록 기능 -->
<script>
	$(function() {
		// 관심등록 버튼 클릭시(관심 등록 또는 관심 취소)
		$("#inter_update").click(function() {
			$.ajax({
				url : "InterUpdate",
				type : "POST",
				data : {
					center : '${center_view.centerCode}',
					member : '${userId}'
				},
				success : function() {
					interCount();
					interCheck();
				},
			})
		})

		// 센터 관심등록수 표시
		function interCount() {
			$.ajax({
				url : "InterCount",
				type : "POST",
				data : {
					center : "${center_view.centerCode}"
				},
				success : function(count) {
					$(".inter_cnt").html(count);
				}
			});

		}

		// 로그인 유저의 해당 센터 관심 등록 체크
		function interCheck() {
			$.ajax({
				url : "InterCheck",
				type : "POST",
				data : {
					center : "${center_view.centerCode}",
					member : "${userId}"
				},
				success : function(count) {
					if (count == 1) {
						// 꽉 찬 별 출력
						$("#interest").html(
								"<i class=\"fas fa-star fa-lg\"></i>관심목록삭제");

					} else {
						// 빈 별 출력
						$("#interest").html(
								"<i class=\"far fa-star fa-lg\"></i>관심목록추가");
					}
				}
			});
		}
		// 처음 시작했을 때 실행되도록 해당 함수 호출
		interCount();
		interCheck();
	})
</script>
<title>센터 상세</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="./resources/js/all.min.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link rel="stylesheet" href="./resources/css/heading.css">
<link rel="stylesheet" href="./resources/css/body.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/center_view.css" rel="stylesheet" />
<link href="./resources/css/center_view02.css" rel="stylesheet" />
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

					</head>
					<body>
						<input type="hidden" name="centerCode"
							value="${center_view.centerCode}" readonly>
						<input type="hidden" id="latitude" value="${center_view.latitude}"
							readonly>
						<input type="hidden" id="longitude"
							value="${center_view.longitude}" readonly>
						<table class="type03">
							<tr>
								<th>업체명</th>
								<td id="centerName">${center_view.centerName}</td>
							</tr>
							<tr>
								<th>상세 설명</th>
								<td>(이미지 등록 예정)${center_view.detail}</td>
							</tr>
							<tr>
								<th>주요 종목</th>
								<td>${center_view.sportsName}</td>
							</tr>
							<tr>
								<th>전화 번호</th>
								<td>${center_view.telNumber}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${center_view.address}</td>
							</tr>
							<tr>
								<th>한달 이용 금액(최소)</th>
								<td>${center_view.usageFeeMin}</td>
							</tr>
							<tr>
								<th>한달 이용 금액(최대)</th>
								<td>${center_view.usageFeeMax}</td>
							</tr>
							<tr>
								<th>등록비</th>
								<td>${center_view.regFee}</td>
							</tr>
							<tr>
								<th>휴무일</th>
								<td>${center_view.dayoff}</td>
							</tr>
							<tr>
								<th>운영 시간</th>
								<td>${center_view.operatingTime}</td>
							</tr>
							<tr>
								<td style="color: red">관심등록수</td>
								<td><span class="inter_cnt"></span></td>
							</tr>
							<tr>
								<td style="color: red">추천수</td>
								<td><span class="rec_cnt"></span></td>
							</tr>
							<tr>
								<td colspan="2"><a href="center_list"
									style="color: black; font-weight: bold; text-decoration: underline;">목록보기</a>
									<!-- 로그인 상태일 때 관심등록, 추천기능 활성화 --> <c:if test="${userId!=null}">
										<!-- 추천(하트) 표시 -->
										<button id="rec_update"
											style="border: 0; outline: 0; background: none; cursor: pointer">
											<span id="recommend" style="color: red"></span>
										</button>
										<!-- 관심등록(별) 표시 -->
										<button id="inter_update"
											style="border: 0; outline: 0; background: none; cursor: pointer">
											<span id="interest" style="color: gold"></span>
										</button>
									</c:if></td>
							</tr>
						</table>
						<!-- Map글자 스타일 적용 -->
						<h2 style="position: absolute; left: 800px; top: 115px;">Map</h2>
						<!-- 지도 크기 설정 -->
						<div id="map"
							style="width: 35%; height: 400px; position: absolute; left: 800px; top: 170px"></div>
						<script
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb1f6c28607b26aa93fbe7eb6a7f3562&libraries=services"></script>
						<script>
							var mapContainer = document.getElementById("map");
							var latitude = document.getElementById("latitude").value;
							var longitude = document
									.getElementById("longitude").value;
							var centerName = document
									.getElementById("centerName").innerHTML;
							var mapOption;
							var map;

							var coords = new daum.maps.LatLng(latitude,
									longitude);

							mapOption = {
								center : coords,
								level : 4
							// 지도의 확대 레벨
							};

							// 지도 생성
							map = new daum.maps.Map(mapContainer, mapOption);

							// 결과값으로 받은 위치를 마커로 표시합니다.
							var marker = new daum.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명표시
							var infowindow = new daum.maps.InfoWindow(
									{
										content : '<div style="width:150px; text-align:center; padding:5px 0;">'
												+ centerName + '</div>'
									});

							infowindow.open(map, marker);

							// 지도 중심을 이동
							map.setCenter(coords);
						</script>
				</div>
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