<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>

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

<link href="./resources/css/center_view.css" rel="stylesheet" />
<link href="./resources/css/center_view02.css" rel="stylesheet" />


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
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b1e3e0136f0fc88ecaeba5b03e78531&libraries=services"></script>
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