<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/myinfo_view.css" rel="stylesheet" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function test() {
		var result = confirm('정말 탈퇴 하시겠습니까?');

		if (result) {
			$.ajax({
				url : "delete",
				type : "POST",
				data : {
					id : '${userId}'
				},
				success : function() {
					location.href = "index"
				}
			})
		}
	}
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

			<!-- 내 정보 코드 -->
			<center>
				<form action="myinfoModify_view" method="post">
					<table width="800">
						<tr height="40">
							<td align="center"><b>[회원정보]</b></td>
						</tr>
					</table>
					<table width="700" height="400" cellpadding="0"
						style="border-collapse: collapse; font-size: 9pt;">
						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">회원 ID</td>
							<td>${member.id}
						</tr>
						<tr height="7">
							<td colspan="3"><hr /></td>
						</tr>
						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">비밀번호</td>
							<td>${member.password}</td>
						</tr>
						<tr height="7">
							<td colspan="3"><hr /></td>
						</tr>


						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">이 름</td>
							<td>${member.name}</td>
						</tr>

						<tr height="7">
							<td colspan="3"><hr /></td>
						</tr>

						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">연락처</td>
							<td>${member.tel_number}</td>
						</tr>

						<tr height="7">
							<td colspan="3"><hr /></td>
						</tr>

						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">이메일</td>
							<td>${member.email}</td>
						</tr>
						<tr height="7">
							<td colspan="3"><hr /></td>
						</tr>
					</table>
					<br />
					<div class="submit">
						<td><input type="submit" style="width: 120pt; height: 40pt;"
							value="수정" /> &nbsp;&nbsp; <input type="button" style="width: 120pt; height: 40pt; color: black;"
							id="deleteConfirm" onclick="test()" value="회원탈퇴" /></td>
					</div>
				</form>
			</center>
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


