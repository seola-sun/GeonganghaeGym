<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>

<link href="./resources/css/login.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous"></script>

<link href="./resources/css/styles.css" rel="stylesheet" />



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
				<center style="position: absolute; top: 110px;">
					<form action="login" method="post">
						<table width="800">
							<tr height="40">
								<td align="center"><b>[로그인]</b></td>
							</tr>
						</table>
						<table width="700" height="200" cellpadding="0"
							style="border-collapse: collapse; font-size: 9pt;">
							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">회원 ID</td>
								<td><input type="text" name="id" size="30" />
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>
							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">비밀번호</td>
								<td><input type="text" name="password" size="30"
									onchange="isSame()" /></td>
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>
						</table>
						<br />
						<div class="submit">
							<input type="submit"
								style="width: 120pt; height: 40pt; position: absolute; left: 600px; top: 250px;"
								value="로그인" />
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
