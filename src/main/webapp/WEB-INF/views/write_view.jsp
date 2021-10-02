<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>

<link href="./resources/css/login.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous"></script>

<link href="./resources/css/styles.css" rel="stylesheet" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function registerCheckFunction() {
		var id = $('#id').val();
		$.ajax({
			type : 'POST',
			url : "idCheck",
			data : {
				id : id
			},
			success : function(result) {
				console.log("result : " + result);
				if (result == 1) {
					alert("이미 사용중인 아이디입니다.");
				} else {
					alert("사용 가능한 아이디입니다.");
				}
			}

		})
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
				<center style="position: absolute; top: 110px;">
					<form action="write" method="post">
						<table width="800">
							<tr height="40">
								<td align="center"><b>[회원가입]</b></td>
							</tr>
						</table>
						<table width="700" height="400" cellpadding="0"
							style="border-collapse: collapse; font-size: 9pt;">
							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">회원 ID</td>
								<td><input type="text" id="id" name="id" size="30"
									placeholder="4~12자의 영문 대소문자와 숫자로만 입력" />
									<button onclick="registerCheckFunction();" type="button">중복체크</button>
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>
							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">비밀번호</td>
								<td><input type="password" name="password" size="30"
									onchange="isSame()" placeholder="4~12자의 영문 대소문자와 숫자로만 입력" /></td>
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>


							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">이 름</td>
								<td><input type="text" name="name" size="30" /></td>
							</tr>

							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>

							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">연락처</td>
								<td><input type="text" name="tel_number" size="30" /></td>
							</tr>

							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>

							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">이메일</td>
								<td><input type="text" name="email" size="30"
									placeholder="예)id@domain.com" /></td>
							</tr>
							<tr height="7">
								<td colspan="3"><hr /></td>
							</tr>
						</table>
						<br />
						<div class="submit">
							<input type="submit"
								style="width: 120pt; height: 40pt; position: absolute; left: 600px; top: 450px;"
								value="회원가입" />
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
