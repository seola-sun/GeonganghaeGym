<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link href="./resources/css/center_list02.css" rel="stylesheet" /> 

<body>
	<% 
		String searchKeyword = request.getParameter("searchKeyword");
		String searchCondition = request.getParameter("searchCondition");
		if(searchKeyword == null)
		{
			searchKeyword = "";
		}
		if(searchCondition == null)
		{
			searchCondition = "name";
		}
	%>
	<form action="manager_member_list" method="post">
		<table class="type03" style="position:absolute; top:100px; width:50%;">
			<tr>
				<td align="right">
					<select id="searchCondition" name="searchCondition">
					<c:forEach items="${conditionMap }" var="option">
						<option value="${option.value }">${option.key  }
					</c:forEach>
					<input name="searchKeyword" type="text" value=<%=searchKeyword %>>
					<input type="submit" value="검색"/>
					
					</select>
				</td>	
			</tr>
		</table>
	</form>
	<table class="type09" style="position:absolute; top:250px;">
	<thead>
		<tr>
			<td>이름(아이디)</td>
			<td>연락처</td>
			<td>수정 날짜</td>
			<td>등록 날짜</td>
			
		</tr>
		</thead>
		<c:forEach items="${manager_member_list}" var="dto">
		<tr>
			<td>
				<a href="manager_member_content_view?id=${dto.id}"style="color: black; font-weight: bold; text-decoration: underline;">${dto.name}(${dto.id })</a></td>
			<td>${dto.tel_number}</td>
			<td>${dto.moddate }</td>
			<td>${dto.regdate}</td>

		</tr>
		</c:forEach>
		<tr>
	</table>
	
</body>
<script>
	document.getElementById('searchCondition').value = "<%=searchCondition %>";
</script>
</html>