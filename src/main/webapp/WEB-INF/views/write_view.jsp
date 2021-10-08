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
		if (!checkId(id)) {
			return false;
		}
		$('#idRegExp').html('');

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

	function passwordCheckFunction() {

		console.log("passwordCheckFUnction()");

		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		if (password1 != password2) {
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		} else {
			$('#passwordCheckMessage').html('');
		}
	}

	function checkAll() {

		console.log("checkAll()");

		var id = $('#id').val();
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		var name = $('#name').val();
		var tel_number = $('#tel_number').val();
		var email = $('#email').val();
		
		var flag = true;

		if (!checkId(id)) { // ID체크
			flag = false;
		} 
		if (!checkPassword1(password1)) { //비번 입력 체크
			flag = false;
		} 
		if (!checkPassword2(password2)) {
			flag = false;
		}
		if (!checkName(name)) { // 이름 체크
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

	function checkId(id) {

		console.log("checkId()");

		//id가 입력되었는지 확인하기
		if (!checkExistData(id)) {
			$('#idRegExp').html('아이디를 입력해주세요!');
			return false;
		} else {
			$('#idRegExp').html('');
		}

		var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사

		if (!idRegExp.test(id)) {
			$('#idRegExp').html('영문 대소문자와 숫자 4~12자리로 입력해야합니다!');
			return false;
		} else {
			$('#idRegExp').html('');
		}
		return true; // 정상입력되었을떄
	}

	function checkPassword1(password1) {
		console.log("checkPassword1()");

		// 공백 체크
		if (!checkExistData(password1)) {
			// 공백입력시
			$('#passwordCheckMessage').html('비밀번호를 입력해주세요');
			return false;
		} else {
			$('#passwordCheckMessage').html('');
		}
		return true; // 정상 입력
	}

	function checkPassword2(password2) {
		console.log("checkPassword2()");

		// 공백 체크
		if (!checkExistData(password2)) {
			// 공백입력시
			$('#passwordCheckMessage').html('비밀번호확인을 입력해주세요');
			return false;
		} else {
			$('#passwordCheckMessage').html('');
		}
		return true; // 정상 입력
	}

	function checkName(name) {
		console.log("checkName()");

		// 공백 체크
		if (!checkExistData(name)) {
			// 공백입력시
			$('#nameCheckMessage').html('이름을 입력해주세요');
			return false;
		} else {
			$('#nameCheckMessage').html('');
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

		//var tel_numberRegExp = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
		//var tel_numberRegExp = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;

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
					<form action="write" method="post" onsubmit="return checkAll()">
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
								<td style="padding-top:1.5em;"><input type="text" id="id" name="id" size="30"
									placeholder="4~12자의 영문 대소문자와 숫자로만 입력" />
									<button onclick="registerCheckFunction();" type="button">중복체크</button>
									<p style="color: red;" id="idRegExp"></p></td>
							</tr>
							<tr height="7">
								<td colspan="3">
									<hr />
								</td>
							</tr>
							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">비밀번호</td>
								<td><input type="password" name="password" size="30"
									onkeyup="passwordCheckFunction();" id="password1" /></td>
							</tr>

							<tr class="register" height="30">
								<td width="5%" valign="middle" align="center">*</td>
								<td width="15%" valign="middle">비밀번호 확인</td>
								<td style="padding-top:1.5em;"><input type="password" size="30"
									onkeyup="passwordCheckFunction();" id="password2" />
									<p style="color: red;" id="passwordCheckMessage"></p></td>
							</tr>
							<tr height="7">
								<td colspan="3">
									<hr />
								</td>
							</tr>

							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">이 름</td>
								<td style="padding-top:1.5em;"><input type="text" name="name" size="30" id="name" />
									<p style="color: red;" id="nameCheckMessage"></p></td>
							</tr>

							<tr height="7">
								<td colspan="3">
									<hr />
								</td>
							</tr>

							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">연락처</td>
								<td style="padding-top:1.5em;"><input type="text" name="tel_number" size="30" id="tel_number" />
									<p style="color: red;" id="tel_numberRegExp"></p></td>
							</tr>

							<tr height="7">
								<td colspan="3">
									<hr />
								</td>
							</tr>

							<tr class="register" height="30">
								<td width="5%" align="center">*</td>
								<td width="15%">이메일</td>
								<td style="padding-top:1.5em;"><input type="text" name="email" size="30"
									placeholder="예)id@domain.com" id="email" />
									<p style="color: red;" id="emailRegExp"></p>
								</td>
							</tr>
							<tr height="7">
								<td colspan="3">
									<hr />
								</td>
							</tr>
						</table>
						<br />
						<div class="submit">
							<input type="submit" 
								style="width: 120pt; height: 40pt; position: absolute; left: 45%; top: 90%;"
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
