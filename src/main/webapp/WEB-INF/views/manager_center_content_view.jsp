<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="manager_center_modify_view?centerCode=${manager_center_content_view.centerCode}" method="post">
		<input type="hidden" name="centerCode" value="${ manager_center_content_view.centerCode}">
		<tr>
			<td>업체명</td>
			<td>${manager_center_content_view.centerName}</td>
		</tr>
		<tr>
			<td>상세 설명</td>
			<td>(이미지 등록 예정)${manager_center_content_view.detail}</td>
		</tr>
		<tr>
			<td>주요 종목</td>
			<td>${manager_center_content_view.sportsName}</td>
		</tr>
		<tr>
			<td>전화 번호</td>
			<td>${manager_center_content_view.telNumber}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${manager_center_content_view.address}</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>${manager_center_content_view.zipCode}</td>
		</tr>
		<tr>
			<td>위도</td>
			<td>${manager_center_content_view.latitude}</td>
		</tr>
		<tr>
			<td>경도</td>
			<td>${manager_center_content_view.longitude}</td>
		</tr>
		<tr>
			<td>썸네일</td>
			<td>${manager_center_content_view.thumbnail}</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>${manager_center_content_view.image}</td>
		</tr>
		<tr>
			<td>한달 이용 금액(최소)</td>
			<td>${manager_center_content_view.usageFeeMin}</td>
		</tr>
		<tr>
			<td>한달 이용 금액(최대)</td>
			<td>${manager_center_content_view.usageFeeMax}</td>
		</tr>
		<tr>
			<td>등록비</td>
			<td>${manager_center_content_view.regFee}</td>
		</tr>
		<tr>
			<td>휴무일</td>
			<td>${manager_center_content_view.dayoff}</td>
		</tr>
		<tr>
			<td>운영 시간</td>
			<td>${manager_center_content_view.operatingTime}</td>
		</tr>
		<tr>
			<td>관심등록수</td>
			<td>${manager_center_content_view.interestCnt}</td>
		</tr>
		<tr>
			<td>추천수</td>
			<td>${manager_center_content_view.recommendCnt}</td>
		</tr>
		<tr>
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp; <a href="manager_center_list">목록보기</a> &nbsp;&nbsp; <a href="manager_center_delete?centerCode=${manager_center_content_view.centerCode}">삭제</a> &nbsp;&nbsp;</td>
		</tr>
		</form>
	</table>
</body>
</html>