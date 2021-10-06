<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>

<!-- link href="./resources/css/center_list.css" rel="stylesheet" />
<link href="./resources/css/center_list02.css" rel="stylesheet" />
 -->
<!-- DataTables 스크립트 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>

<script>
	$(document).ready(function() {

		var table = $('#center-list').DataTable({
			ajax : {
				url : "center_list",
				type : "POST",
				dataType : "JSON",
			},
			columns : [ {
				data : "centerName",
		        render : function(data, type, row, meta){
		                if(type === 'display'){
		                      data = '<a href=center_view?centerCode='+ row.centerCode +'>'+ data + '</a>';
		                } 
		                return data;
		             }   
			}, {
				data : "sportsName"
			}, {
				data : "usageFeeMin"
			}, {
				data : "usageFeeMax"
			}, {
				data : "interestCnt"
			}, {
				data : "recommendCnt"
			}
			]
		});
	});
</script>

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
			<table id="center-list" class="type09">
				<thead>
					<tr>
						<td>업체명</td>
						<td>주요 종목</td>
						<td>한달 이용 금액(최소)</td>
						<td>한달 이용 금액(최대)</td>
						<td>관심등록수</td>
						<td>추천수</td>
					</tr>
				</thead><%-- 
				<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td><a href="center_view?centerCode=${dto.centerCode}"
							style="color: black; font-weight: bold; text-decoration: underline;">${dto.centerName}</a></td>
						<td>${dto.sportsName}</td>
						<td>${dto.usageFeeMin}</td>
						<td>${dto.usageFeeMax}</td>
						<td>${dto.interestCnt}</td>
						<td>${dto.recommendCnt}</td>
					</tr>
				</c:forEach>
				</tbody> --%>
			</table>
		</div>
	</div>
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