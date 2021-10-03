<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String centerNameKeyword = request.getParameter("centerNameKeyword");
		String usageMinFeeKeyword = request.getParameter("usageMinFeeKeyword");
		String usageMaxFeeKeyword = request.getParameter("usageMaxFeeKeyword");
		String sportsNameKeyword[] = request.getParameterValues("sportsNameKeyword");
		String health="";
		String PT="";
		String pilates=""; 
		String yoga="";
		String swim="";
		String ballet="";
		
		if(centerNameKeyword==null)
		{
			centerNameKeyword="";
		}
		if(usageMinFeeKeyword==null)
		{
			usageMinFeeKeyword="";
		}
		if(usageMaxFeeKeyword==null)
		{
			usageMaxFeeKeyword="";
		}
		if(sportsNameKeyword!=null)
		{
			for(int i=0; i<sportsNameKeyword.length; i++)
			{
				if(sportsNameKeyword[i].equals("헬스"))
				{
					pageContext.setAttribute("health", sportsNameKeyword[i]);
				}
				if(sportsNameKeyword[i].equals("PT"))
				{
					pageContext.setAttribute("PT", sportsNameKeyword[i]);
				}
				if(sportsNameKeyword[i].equals("필라테스"))
				{
					pageContext.setAttribute("pilates", sportsNameKeyword[i]);
				}
				if(sportsNameKeyword[i].equals("요가"))
				{
					pageContext.setAttribute("yoga", sportsNameKeyword[i]);
				}
				if(sportsNameKeyword[i].equals("수영"))
				{
					pageContext.setAttribute("swim", sportsNameKeyword[i]);
				}
				if(sportsNameKeyword[i].equals("발레"))
				{
					pageContext.setAttribute("ballet", sportsNameKeyword[i]);
				}
			}
		}
	%>
	<form action="manager_center_list" method="post">
		<table border="1">
			<tr>
				<th>센터명</th>
				<td align="right">
					<input name="centerNameKeyword" type="text" value="<%=centerNameKeyword%>"/>
				</td>
				<th>종목</th>
				<td colspan="3">
				<c:set var="open" value="" />
					<c:if test="${health !=nullq}">
						<c:set var="health" value="checked" />
					</c:if>
					<c:if test="${PT !=null}">
						<c:set var="PT" value="checked" />
					</c:if>
					<c:if test="${pilates !=null}">
						<c:set var="pilates" value="checked" />
					</c:if>
					<c:if test="${yoga !=null}">
						<c:set var="yoga" value="checked" />
					</c:if>
					<c:if test="${swim !=null}">
						<c:set var="swim" value="checked" />
					</c:if>
					<c:if test="${ballet !=null}">
						<c:set var="ballet" value="checked" />
					</c:if>
					<input type="checkbox" name="sportsNameKeyword" ${health} value="헬스" />헬스
					<input type="checkbox" name="sportsNameKeyword" ${PT} value="PT" />PT
					<input type="checkbox" name="sportsNameKeyword" ${pilates} value="필라테스" />필라테스
					<input type="checkbox" name="sportsNameKeyword" ${yoga} value="요가" />요가
					<input type="checkbox" name="sportsNameKeyword" ${swim} value="수영" />수영
					<input type="checkbox" name="sportsNameKeyword" ${ballet} value="발레" />발레
				</td>
			</tr>
			<tr>
				<th>위치</th>
				<td align="right">
					<select name="sidoKeyword">
						<%-- <c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key}
						</c:forEach> --%>
						<option value="서울시">서울시
						<option value="경기도">경기도
					</select>
					<select name="sigunguKeyword">
						<option value="영등포구">영등포구
						<option value="금천구">금천구
					</select>
					<select name="roKeyword">
						<option value="국회대로">국회대로 
						<option value="가산디지털1로">가산디지털1로
					</select>
				</td>
				<th>금액</th>
				<td>최소금액<input type="text" name="usageMinFeeKeyword" value="<%=usageMinFeeKeyword%>"></td>
				<td>최대금액<input type="text" name="usageMaxFeeKeyword" value="<%=usageMaxFeeKeyword%>"></td>
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
		<c:forEach items="${manager_center_list}" var="dto">
			<tr>
				<td><a href="manager_center_content_view?centerCode=${dto.centerCode}">${dto.centerName}</a></td>
				<td>${dto.sportsName}</td>
				<td>${dto.usageFeeMin}</td> 
				<td>${dto.usageFeeMax}</td>
				<td>${dto.interestCnt}</td>
				<td>${dto.recommendCnt}</td>
			</tr>
		</c:forEach>
		<tr>
			<button type="button" onclick="location.href='manager_center_write_view' ">센터 등록하기</button>
		</tr>
	</table>
</body>
</html>