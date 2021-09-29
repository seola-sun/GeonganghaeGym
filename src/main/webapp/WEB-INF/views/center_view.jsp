<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- by설아, jquery 사용하기 위한 링크 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- by설아, Font Awesome 아이콘 사용하기 위한 링크 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script>
	$(function() {
		// 추천버튼 클릭시(추천 추가 또는 추천 제거)
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
		;

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
						$("#recommend")
								.html("<i class=\"fas fa-heart fa-2x\">");

					} else {
						// 빈 하트 출력
						$("#recommend")
								.html("<i class=\"far fa-heart fa-2x\">");
					}
				}
			});
		}
		;
		recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
		recCheck();
	})
</script>
<title>센터 상세</title>
</head>
<body>
	<input type="hidden" name="centerCode"
		value="${center_view.centerCode}" readonly>
	<input type="hidden" id="latitude" value="${center_view.latitude}"
		readonly>
	<input type="hidden" id="longitude" value="${center_view.longitude}"
		readonly>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>업체명</td>
			<td id="centerName">${center_view.centerName}</td>
		</tr>
		<tr>
			<td>상세 설명</td>
			<td>(이미지 등록 예정)${center_view.detail}</td>
		</tr>
		<tr>
			<td>주요 종목</td>
			<td>${center_view.sportsName}</td>
		</tr>
		<tr>
			<td>전화 번호</td>
			<td>${center_view.telNumber}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${center_view.address}</td>
		</tr>
		<tr>
			<td>한달 이용 금액(최소)</td>
			<td>${center_view.usageFeeMin}</td>
		</tr>
		<tr>
			<td>한달 이용 금액(최대)</td>
			<td>${center_view.usageFeeMax}</td>
		</tr>
		<tr>
			<td>등록비</td>
			<td>${center_view.regFee}</td>
		</tr>
		<tr>
			<td>휴무일</td>
			<td>${center_view.dayoff}</td>
		</tr>
		<tr>
			<td>운영 시간</td>
			<td>${center_view.operatingTime}</td>
		</tr>
		<tr>
			<td>관심등록수</td>
			<td><span class="inter_cnt"></span></td>
		</tr>
		<tr>
			<td>추천수</td>
			<td><span class="rec_cnt"></span></td>
		</tr>
		<tr>
			<td colspan="2"><a href="center_list">목록보기</a>
			<!-- 로그인 상태일 때 관심등록, 추천기능 활성화 -->
				<c:if test="${userId!=null}">
					<!-- 추천(하트) 표시 -->
					<button id="rec_update"
						style="border: 0; outline: 0; background: none; cursor: pointer">
						<span id="recommend" style="color: red"></span>
					</button>
					<!-- 관심등록(별) 표시 -->
					<button id="inter_update"
						style="border: 0; outline: 0; background: none; cursor: pointer">
						<span id="interest" style="color: gold"></span> <span
							style="color: gold"><i class="far fa-star"></i></span> <span
							style="color: gold"><i class="fas fa-star"></i></span>
					</button>
				</c:if></td>
		</tr>
	</table>
	<div id="map" style="width: 40%; height: 250px;"></div>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb1f6c28607b26aa93fbe7eb6a7f3562&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById("map");
		var latitude = document.getElementById("latitude").value;
		var longitude = document.getElementById("longitude").value;
		var centerName = document.getElementById("centerName").innerHTML;
		var mapOption;
		var map;

		var coords = new daum.maps.LatLng(latitude, longitude);

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
</body>
</html>