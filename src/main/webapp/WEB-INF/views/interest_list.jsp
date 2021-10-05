<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>

<!-- DataTables 스크립트 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {

		var table = $('#example').DataTable({
			ajax : {
				url : "interest_list",
				type : "POST",
				dataType : "JSON",
			},
			columns : [ {
				data : "centerName"
			}, {
				data : "sportsCode"
			}, {
				data : "usage_fee_min"
			}, {
				data : "interest_cnt"
			}, {
				data : "recommend_cnt"
			}, {
				data : "regDate"
			}, {
				data : null,
				defaultContent : '<a href="" class="remove">삭제</a>'
			}

			]
		});

		$('#example').on('click', 'a.remove', function() {
			var row = $(this).closest('tr');
			var centerCode = table.row(row).data().centerCode;

			$.ajax({
				url : "InterDelete",
				type : "POST",
				data : {
					center : centerCode,
					member : '${userId}'
				},
				success : function() {
					table.row($(this).parents('tr')).remove().draw();
				}
			})

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

			<table id="example" class="type09">
				<thead>
					<tr>
						<th>업체명</th>
						<th>주요종목</th>
						<th>한달 등록비</th>
						<th>관심등록수</th>
						<th>추천수</th>
						<th>등록일</th>
						<th></th>
					</tr>
				</thead>
			</table>
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