<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link href="./resources/css/center_view02.css" rel="stylesheet" />

<body>
	<table class= "type03" style="position:absolute; left:30%;">
		<form action="manager_center_modify_view?centerCode=${manager_center_content_view.centerCode}" method="post">
		<input type="hidden" name="centerCode" value="${ manager_center_content_view.centerCode}">
		<tr>
			<th>업체명</th>
			<td>${manager_center_content_view.centerName}</td>
		</tr>
		<tr>
			<th>상세 설명</th>
			<td>(이미지 등록 예정)${manager_center_content_view.detail}</td>
		</tr>
		<tr>
			<th>주요 종목</th>
			<td>${manager_center_content_view.sportsName}</td>
		</tr>
		<tr>
			<th>전화 번호</th>
			<td>${manager_center_content_view.telNumber}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${manager_center_content_view.address}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>${manager_center_content_view.zipCode}</td>
		</tr>
		<tr>
			<th>위도</th>
			<td>${manager_center_content_view.latitude}</td>
		</tr>
		<tr>
			<th>경도</th>
			<td>${manager_center_content_view.longitude}</td>
		</tr>
		<tr>
			<th>썸네일</th>
			<td>${manager_center_content_view.thumbnail}</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>${manager_center_content_view.image}</td>
		</tr>
		<tr>
			<th>한달 이용 금액(최소)</th>
			<td>${manager_center_content_view.usageFeeMin}</td>
		</tr>
		<tr>
			<th>한달 이용 금액(최대)</th>
			<td>${manager_center_content_view.usageFeeMax}</td>
		</tr>
		<tr>
			<th>등록비</th>
			<td>${manager_center_content_view.regFee}</td>
		</tr>
		<tr>
			<th>휴무일</th>
			<td>${manager_center_content_view.dayoff}</td>
		</tr>
		<tr>
			<th>운영 시간</th>
			<td>${manager_center_content_view.operatingTime}</td>
		</tr>
		<tr>
			<th>관심등록수</th>
			<td>${manager_center_content_view.interestCnt}</td>
		</tr>
		<tr>
			<th>추천수</th>
			<td>${manager_center_content_view.recommendCnt}</td>
		</tr>
		<tr>
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp; <a href="manager_center_list" style="color: black; font-weight:bold; text-decoration: underline;">목록보기</a> &nbsp;&nbsp; <a href="manager_center_delete?centerCode=${manager_center_content_view.centerCode}" style="color: black; font-weight:bold; text-decoration: underline;">삭제</a> &nbsp;&nbsp;</td>
		</tr>
		</form>
	</table>
</body>
</html>