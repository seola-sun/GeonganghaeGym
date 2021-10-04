<%@page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 글꼴을 링크에서 가져옴 -->
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
<head>
<title>센터 목록</title>
<!-- Core theme CSS (includes Bootstrap)-->

<%@ include file="header.jsp"%>



<link href="./resources/css/center_list.css" rel="stylesheet" />
<link href="./resources/css/center_list02.css" rel="stylesheet" /> 

	
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
				<form action="center_list" method="post">
		<table class="type03" style="position:absolute; left:0px; top:100px;" >
			<tr>
				<th>센터명</th>
				<td align="right">
					<input name="centerName" type="text" />
				</td>
				<th>종목</th>
				<td colspan="3">
					<a href="" style="color: black; font-weight:bold; text-decoration: underline;">헬스</a>
					<a>PT</a>
					<a>필라테스</a>
					<a>요가</a>
					<a>수영</a>
					<a>발레</a>
				</td>
			</tr>
			<tr>
				<th>위치</th><!-- 셀렉트박스 한줄로 나오게 하기 위해서 width값 지정 -->
				<td align="right" style="width:25%;">
				
					<select name="city"  >
						<%-- <c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key}
						</c:forEach> --%>
						<option value="서울시">서울시
						<option value="경기도">경기도
					</select>
				
				
					<select name="gu"  >
						<option value="영등포구">영등포구
						<option value="금천구">금천구
					</select>
			
				
					<select name="ro"  >
						<option value="국회대로">국회대로
						<option value="가산디지털1로">가산디지털1로
					</select>
				
				</td>
				<th>금액</th>
				<td>min</td>
				<td>max</td>
				<td><input type="submit" value="검색" /></td>
			</tr>
		</table>
	</form>
	<table class="type09" style="position:absolute; top:300px;">
	<thead>
		<tr>
			<td>업체명</td>
			<td>주요 종목</td>
			<td>한달 이용 금액(최소)</td>
			<td>한달 이용 금액(최대)</td>
			<td>관심등록수</td>
			<td>추천수</td>
		</tr>
		</thead>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><a href="center_view?centerCode=${dto.centerCode}" 
				style="color: black; font-weight:bold; text-decoration: underline;">${dto.centerName}</a></td>
				<td>${dto.sportsName}</td>
				<td>${dto.usageFeeMin}</td>
				<td>${dto.usageFeeMax}</td>
				<td>${dto.interestCnt}</td>
				<td>${dto.recommendCnt}</td>
			</tr>
		</c:forEach>
			<tr>
				<td>
					<div>
					
					<c:set var="page" value="${(empty param.p)?1:param.p}"/>
					<c:set var="startNum" value="${page-(page-1)%5}"/>
					<c:set var="LastNum" value="${fn:substringBefore(Math.ceil(centerTotal/10),'.')}"/>
		
						<span> ${(empty param.p)?1:param.p}&#47;${LastNum}pages</span>
					</div>
				</td>
			</tr>
		<tr><td>
			<div class="paging-num-list">
		
			 <c:if test="${startNum>1}">
			 	<a href="?p=${startNum-1}" >&lt</a></span>
			 </c:if>
			 
			 <c:if test="${startNum<=1}">
			 	<span onclick="alert('이전 페이지가 없습니다.);"><a href=""> &lt </a></span>
			  </c:if>
					<ul class="center-number-list">
						<c:forEach var="i" begin="0" end="4">
						<li><a class="center-number" href="?p=${startNum+i}">${startNum+i}</a></li>
						</c:forEach>
					</ul>
					<c:if test="${startNum+4 < LastNum}">
				 	<a href="?p=${startNum+5}&t=&q=" >&gt</a>
				  </c:if>
				  <c:if test="${startNum+4>= LastNum}">
				 <span onclick="alert('다음 페이지가 없습니다.)"><a href="" >&gt</a></span>
				  </c:if>

	</div>
		</td></tr>
	</table>
	
	
			</div>
		</div>
<!-- *******************PAGING*********************************************** -->	
		
<!-- ****************************************************************** -->	
	</section>
	
	<!-- Bootstrap core JS-->
	<!-- 창 축소할때 메뉴 네비게이션 출력 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./resources/js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	
	</body>
	</html>