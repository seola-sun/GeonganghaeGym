<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<link href="./resources/css/center_list02.css" rel="stylesheet" /> 


<body>
	<%
		String centerNameKeyword = request.getParameter("centerNameKeyword");
		String usageMinFeeKeyword = request.getParameter("usageMinFeeKeyword");
		String usageMaxFeeKeyword = request.getParameter("usageMaxFeeKeyword");
		String sportsNameKeyword[] = request.getParameterValues("sportsNameKeyword");
		String sidoKeyword = request.getParameter("sidoKeyword");
		String sigunguKeyword = request.getParameter("sigunguKeyword");
		String health="";
		String PT="";
		String pilates=""; 
		String yoga="";
		String swim="";
		String ballet="";
		
		if(sidoKeyword==null)
		{
			sidoKeyword="전체";
		}
		if(sigunguKeyword==null)
		{
			sigunguKeyword="전체";
		}
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
		<table class="type03" style="position:absolute; left:-5px; top:100px;" >
			<tr>
				<th>센터명</th>
				<td align="right">
					<input name="centerNameKeyword" type="text" value="<%=centerNameKeyword%>"/>
				</td>
				<th>종목</th>
				<td colspan="4">
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
				<td align="right" style="padding-top:25px;">
					<select id="sidoKeyword" name="sidoKeyword" onchange="categoryChange(this)">
						<option value="전체">전체</option>
						<option value="서울">서울특별시</option>
						<option value="부산">부산광역시</option>
						<option value="인천">인천광역시</option>
						<option value="대구">대구광역시</option>
						<option value="광주">광주광역시</option>
						<option value="대전">대전광역시</option>
						<option value="울산">울산광역시</option>
						<option value="세종특별자치시">세종특별자치시</option>
						<option value="경기">경기도</option>
						<option value="강원">강원도</option>
						<option value="충북">충청북도</option>
						<option value="충남">충청남도</option>
						<option value="경북">경상북도</option>
						<option value="경남">경상남도</option>
						<option value="전북">전라북도</option>
						<option value="전남">전라남도</option>
						<option value="제주특별자치도">제주특별자치도</option>
					</select>
					
					<select id="sigunguKeyword" name="sigunguKeyword">
					</select>
				</td>
				<th>금액</th>
				<td>최소금액<input type="text" name="usageMinFeeKeyword" value="<%=usageMinFeeKeyword%>"></td>
				<td>최대금액<input type="text" name="usageMaxFeeKeyword" value="<%=usageMaxFeeKeyword%>"></td>
				<td><input type="submit" value="검색" style="margin-top:10%;"/></td>
				<td><button type="button" class="myButton"
			onclick="location.href='manager_center_write_view' ">센터 등록하기</button></td>
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
		<c:forEach items="${manager_center_list}" var="dto">
			<tr>
				<td><a href="manager_center_content_view?centerCode=${dto.centerCode}"
				style="color: black; font-weight:bold; text-decoration: underline;">${dto.centerName}</a></td>
				<td>${dto.sportsName}</td>
				<td>${dto.usageFeeMin}</td> 
				<td>${dto.usageFeeMax}</td>
				<td>${dto.interestCnt}</td>
				<td>${dto.recommendCnt}</td>
			</tr>
		</c:forEach>
	</table>
</body>
<script type="text/javascript">
	document.getElementById('sidoKeyword').value = "<%=sidoKeyword %>";
	
	<%--document.getElementById('sigunguKeyword').value = "<%=sigunguKeyword %>";--%>
	var Seoul = ["전체", "종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", 
		"노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", 
		"관악구", "서초구", "강남구", "송파구", "강동구"];
	var Busan = ["전체", "중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "강서구", "해운대구", 
		"사하구", "금정구", "연제구", "수영구", "사상구", "기장군"];
	var Incheon = ["전체", "중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"];
	var Daegu = ["중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"];
	var Gwangju = ["전체", "동구", "서구", "남구", "북구", "광산구"];
	var Daejeon = ["전체", "동구", "중구", "서구", "유성구", "대덕구"];
	var Ulsan = ["전체", "중구", "남구", "동구", "북구", "울주군"];
	var Saejong = ["전체", ""];
	var Gyeonggi = ["전체", "가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", 
		"부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", 
		"연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", 
		"화성시"];
	var Gangwon = ["전체", "원주시", "춘천시", "강릉시", "동해시", "속초시", "삼척시", "홍천군", "태백시", "철원군", "횡성군", 
		"평창군", "영월군", "정선군", "인제군", "고성군", "양양군", "화천군", "양구군"];
	var Chungbuk = ["전체", "청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군"];
	var Chungnam = ["전체", "천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", 
		"청양군", "홍성군", "예산군", "태안군"];
	var Gyeongbuk = ["전체", "포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", 
		"의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군"];
	var Gyeongnam = ["전체", "창원시", "김해시", "진주시", "양산시", "거제시", "통영시", "사천시", "밀양시", "함안군", "거창군", "창녕군", 
		"고성군", "하동군", "합천군", "남해군", "함양군", "산청군", "의령군"];
	var Jeonbuk = ["전체", "전주시", "익산시", "군산시", "정읍시", "완주군", "김제시", "남원시", "고창군", "부안군", "임실군", "순창군", 
		"진안군", "장수군", "무주군"];
	var Jeonnam = ["전체", "여수시", "순천시", "목포시", "광양시", "나주시", "무안군", "해남군", "고흥군", "화순군", "영암군", "영광군", 
		"완도군", "담양군", "장성군", "보성군", "신안군", "장흥군", "강진군", "함평군", "진도군", "곡성군", "구례군"];
	var Jeju = ["전체", "제주시", "서귀포시"];
	
	var target = document.getElementById("sigunguKeyword");

window.onload = function(){
	 	var e = "<%=sidoKeyword %>";
		console.log(e);
		if(e == "전체") var d = Seoul;
		else if(e == "서울") var d = Seoul;
		else if(e == "부산") var d = Busan;
		else if(e == "인천") var d = Incheon;
		else if(e == "대구") var d = Daegu;
		else if(e == "광주") var d = Gwangju;
		else if(e == "대전") var d = Daejeon;
		else if(e == "울산") var d = Ulsan;
		else if(e == "세종특별자치시") var d = Saejong;
		else if(e == "경기") var d = Gyeonggi;
		else if(e == "강원") var d = Gangwon;
		else if(e == "충북") var d = Chungbuk;
		else if(e == "충남") var d = Chungnam;
		else if(e == "경북") var d = Gyeongbuk;
		else if(e == "경남") var d = Gyeongnam;
		else if(e == "전북") var d = Jeonbuk;
		else if(e == "전남") var d = Jeonnam;
		else if(e == "제주특별자치도") var d = Jeju;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			if(opt.value == "<%=sigunguKeyword %>")
			{
				opt.setAttribute ("selected", true);
			}
			target.appendChild(opt);
		}
	  }
function categoryChange(e){
	
	if(e.value == "전체") var d = Seoul;
	else if(e.value == "서울") var d = Seoul;
	else if(e.value == "부산") var d = Busan;
	else if(e.value == "인천") var d = Incheon;
	else if(e.value == "대구") var d = Daegu;
	else if(e.value == "광주") var d = Gwangju;
	else if(e.value == "대전") var d = Daejeon;
	else if(e.value == "울산") var d = Ulsan;
	else if(e.value == "세종특별자치시") var d = Saejong;
	else if(e.value == "경기") var d = Gyeonggi;
	else if(e.value == "강원") var d = Gangwon;
	else if(e.value == "충북") var d = Chungbuk;
	else if(e.value == "충남") var d = Chungnam;
	else if(e.value == "경북") var d = Gyeongbuk;
	else if(e.value == "경남") var d = Gyeongnam;
	else if(e.value == "전북") var d = Jeonbuk;
	else if(e.value == "전남") var d = Jeonnam;
	else if(e.value == "제주특별자치도") var d = Jeju;

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}

}

</script>
</html>