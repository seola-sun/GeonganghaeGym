<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/myinfo_view.css" rel="stylesheet" />


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

				<!-- 내 정보 수정하기 코드 -->
				<center>
					<form action="modify" method="post">
						<input type="hidden" name="id" value="${infoModify_view.id }" />
						<input type="hidden" name="name" value="${infoModify_view.name }" />
						<table width="800">
							<tr height="40">
								<td align="center"><b>[내 정보 수정]</b></td>
							</tr>
						</table>
						<table width="700" height="400" cellpadding="0"
							style="border-collapse: collapse; font-size: 9pt;">
							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">회원 ID</td>
								<td>${infoModify_view.id}
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>
							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">비밀번호</td>
								<td><input type="text" name="password"
									value="${infoModify_view.password}" /></td>
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>


							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">이 름</td>
								<td>${infoModify_view.name}</td>
							</tr>

							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>

							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">연락처</td>
								<td><input type="text" name="tel_number"
									value="${infoModify_view.tel_number}" /></td>
							</tr>

							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>

							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">이메일</td>
								<td><input type="text" name="email"
									value="${infoModify_view.email}" /></td>
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>
						</table>
						<br />
						<div class="submit">
							<input type="submit" style="width: 120pt; height: 40pt;"
								value="수정" onclick="alert('회원정보가 수정되었습니다.');">
							&nbsp;&nbsp; <a href="delete?id=${infoModify_view.id}"
								style="color: black;onclick=" alert('회원탈퇴완료되었습니다.');"> 회원탈퇴</a>
							&nbsp;&nbsp;

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

