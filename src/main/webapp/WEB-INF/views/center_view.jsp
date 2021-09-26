<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>센터 상세</title>
<script>
	// 브라우저 뒤로가기 클릭 시, 센터 목록 페이지로 이동
	// 관심 등록 or 해제, 추천 or 추천 해제 버튼 클릭 시, 상세페이지가 그 횟수만큼 리다이렉트 되어,
	// 뒤로가기 버튼 클릭 시, 센터 목록 페이지로 이동되지 않았기 
	window.onpageshow = function(event) {
		if (event.persisted
				|| (window.performance && window.performance.navigation.type == 2)) {
			window.location = "center_list";
		}
	}
</script>
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
			<td>${center_view.interestCnt}</td>
		</tr>
		<tr>
			<td>추천수</td>
			<td>${center_view.recommendCnt}</td>
		</tr>
		<tr>
			<td colspan="2"><a href="center_list">목록보기</a> 
				<c:if test="${not empty sessionScope.userName}">
					<c:choose>
						<c:when test="${chkRecommend}">
							<a href="delRecommend?centerCode=${center_view.centerCode}">추천안할래요</a>
						</c:when>
						<c:otherwise>
							<a href="addRecommend?centerCode=${center_view.centerCode}">추천할래요</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${chkInterest}">
							<a href="delInterest?centerCode=${center_view.centerCode}">관심등록해제</a>
						</c:when>
						<c:otherwise>
							<a href="addInterest?centerCode=${center_view.centerCode}">관심등록</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</td>
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
			level : 4 // 지도의 확대 레벨
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
					content : '<div style="width:150px; text-align:center; padding:5px 0;">'+ centerName +'</div>'
				});

		infowindow.open(map, marker);

		// 지도 중심을 이동
		map.setCenter(coords);
	</script>
</body>
</html>