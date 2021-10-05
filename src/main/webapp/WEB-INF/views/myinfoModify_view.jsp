<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/myinfo_view.css" rel="stylesheet" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function checkAll() {

		console.log("checkAll()");
		var password = $('#password').val();
		var tel_number = $('#tel_number').val();
		var email = $('#email').val();
		var flag = true;

		if (!checkPassword(password)) { // 비번 체크
			flag = false;

		}
		if (!checkTel_number(tel_number)) { // 연락처 체크
			flag = false;

		}
		if (!checkEmail(email)) { //이메일
			flag = false;

		}
		if (!flag) {
			return false;
		}

		alert('회원정보가 수정되었습니다.');
		return true;

	}

	//공백확인 함수
	function checkExistData(value) {

		console.log("checkExistData()");

		if (value == "") {
			return false;
		}
		return true;
	}

	function checkPassword(password) {
		console.log("checkPassword()");

		// 공백 체크
		if (!checkExistData(password)) {
			// 공백입력시
			$('#passwordCheckMessage').html('비밀번호를 입력해주세요');
			return false;
		} else {
			$('#passwordCheckMessage').html('');
		}
		return true; // 정상 입력
	}

	function checkTel_number(tel_number) {
		console.log("checkTel_number()");
		//tel_number가 입력되었는지 확인하기
		if (!checkExistData(tel_number)) {
			$('#tel_numberRegExp').html('연락처를 입력해주세요!');
			return false;
		} else {
			$('#tel_numberRegExp').html('');
		}

		tel_number = tel_number.split('-').join('');

		var tel_numberRegExp = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;

		if (!tel_numberRegExp.test(tel_number)) {
			$('#tel_numberRegExp').html('연락처 형식이 올바르지 않습니다!');
			return false;
		} else {
			$('#tel_numberRegExp').html('');
		}
		return true; //확인이 완료되었을 때
	}

	function checkEmail(email) {
		//mail이 입력되었는지 확인하기

		console.log("checkEmail()");

		if (!checkExistData(email)) {
			$('#emailRegExp').html('이메일을 입력해주세요!');
			return false;
		} else {
			$('#emailRegExp').html('');
		}

		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;

		if (!emailRegExp.test(email)) {
			$('#emailRegExp').html('이메일 형식이 올바르지 않습니다!');
			return false;
		} else {
			$('#emailRegExp').html('');
		}
		return true; //확인이 완료되었을 때
	}
	
	
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

			<!-- 내 정보 수정하기 코드 -->
			<center>
				<form action="modify" method="post" onsubmit="return checkAll()">
					<input type="hidden" name="id" value="${infoModify_view.id }" /> <input
						type="hidden" name="name" value="${infoModify_view.name }" />
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
							<td><input type="text" name="password" id="password"
								value="${infoModify_view.password}" />
								<p style="color: red;" id="passwordCheckMessage"></p></td>
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
							<td><input type="text" name="tel_number" id="tel_number"
								value="${infoModify_view.tel_number}" />
								<p style="color: red;" id="tel_numberRegExp"></p></td>
						</tr>

						<tr height="7">
							<td colspan="3"><hr /></td>
						</tr>

						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">이메일</td>
							<td><input type="text" name="email" id="email"
								value="${infoModify_view.email}" />
								<p style="color: red;" id="emailRegExp"></p></td>
						</tr>
						<tr height="7">
							<td colspan="3"><hr /></td>
						</tr>
					</table>
					<br />
					<div class="submit">
						<input type="submit" style="width: 120pt; height: 40pt;"
							value="수정"> &nbsp;&nbsp; <input type="button"
							id="deleteConfirm" onclick="test()" style="color: black;"
							value="회원탈퇴" />

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

