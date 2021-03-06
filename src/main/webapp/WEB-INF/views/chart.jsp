<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="header.jsp"%>
<!-- 글꼴을 링크에서 가져옴 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel="stylesheet">

	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>건강해Gym</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="./resources/js/all.min.js" crossorigin="anonymous"></script>

<!-- Google fonts-->
<link rel="stylesheet" href="./resources/css/heading.css">
<link rel="stylesheet" href="./resources/css/body.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/chart-styles.css" rel="stylesheet" />

<!-- 상단 메뉴바 하위 목록들 CSS, css파일로 옮기면 적용이 안됨 -->
<style>
a {
	text-decoration: none;
}

ul li {
	list-style: none;
}

#navbarResponsive>ul>li>ul {
	width: 130px;
	display: none;
	position: absolute;
	font-size: 15px;
	background: #182952;
}

#navbarResponsive>ul>li:hover>ul {
	display: block;
}

.masthead-avatar {
	padding-top: 35px;
	transform: scale(2.0);
	transition: .5s;
}
</style>
</head>
<body id="page-top">
	<section class="page-section portfolio" id="portfolio">
	<div class="chart-container">
			<div class="row">
		
				 <div class="col-md-6 bumper" >
					
				</div>
				<div class="col-md-6 bumper" >
					
				</div>
			<!-- ///////////////////////////////////////////////////////////////// -->
				<div class="col-md-2" >
					
				</div>
			
				<div class="col-md-2 number-box" style="background-color:#9a67ea">
				<span>가입회원</span><br><span class="total-num" id="memberCnt"></span>
				</div>
				
				<div class="col-md-1" >
					
				</div>
				
				<div class="col-md-2 number-box" class="number-box" style="background-color:#75a7ff">
				  <div class="panel panel-primary">
				  <span>등록센터</span> <br> <span class="total-num" id="centerCnt"></span>
				  </div> 
				</div>
				
				<div class="col-md-1" >
					
				</div>
				
				<div class="col-md-2 number-box" class="number-box" style="background-color:#198754">
					<span>관심 수</span> <br> <span class="total-num" id="interestCnt"></span>
				</div>
				
				<div class="col-md-2">
				
					
				</div>
						
<!------------------------------------------------- NEXT LINE ------------------------------->					
				<div class="col-md-1">
				</div>
			
				<div class="col-md-4">
					<canvas id="myChartOne" width="300" height="300"></canvas>
				</div>
				
				<div class="col-md-2">
				</div>
				
				<div class="col-md-4">
					<canvas id="myChartTwo" width="300" height="300"></canvas>
				</div>
	
				<div class="col-md-1">
				</div>
<!------------------------------------------------- NEXT LINE ------------------------------->		
				<div class="col-md-1">
				</div>
	
				<div class="col-md-4">
					<canvas id="myChartThree" width="300" height="300"></canvas>
				</div>
				
				<div class="col-md-2">
				</div>
				
				<div class="col-md-4">
					<canvas id="myChartFour" width="300" height="300"></canvas>
				</div>
				
				<div class="col-md-1">
				</div>
				
			</div>
		</div>	
	</section>


	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2021</small>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script>
	var myChartOne = document.getElementById('myChartOne').getContext('2d');
	var myChartTwo = document.getElementById('myChartTwo').getContext('2d');
	var myChartThree = document.getElementById('myChartThree').getContext('2d');
	var myChartFour = document.getElementById('myChartFour').getContext('2d');
	
		var memberCountList = new Array();
		var centerCountList = new Array();
		var sportsCountList = new Array();
		var interestCountList = new Array();


	var memberCountList = new Array();
	var centerCountList = new Array();
	var sportsCountList = new Array();
	var interestCountList = new Array();
	
	var memberCnt = 0;
	var centerCnt = 0;
	var interestCnt = 0;
	
	
	/*배열 연산  */

	<c:forEach var = "member" items="${memberChart}" >
	memberCountList.push("${member.value}");
	</c:forEach>
	
	console.log(memberCountList);
	

	<c:forEach var = "center" items="${centerChart}" >
	centerCountList.push("${center.value}");
	</c:forEach>
	
	
	console.log(centerCountList);
	
	<c:forEach var = "sports" items="${sportsChart}" >
	sportsCountList.push("${sports.value}");
	</c:forEach>
	
	console.log(sportsCountList);
	
	<c:forEach var = "interest" items="${interestChart}" >
	interestCountList.push("${interest.value}");
	</c:forEach>

	
	console.log(interestCountList);
 
	/* 총 합계 */	
	
	for(var i=0; i<memberCountList.length;i++){
		memberCnt += parseInt(memberCountList[i]);
	}
	
	
	for(var i=0; i<sportsCountList.length;i++){
		centerCnt += parseInt(sportsCountList[i]);
	}

	for(var i=0; i<interestCountList.length;i++){
		interestCnt += parseInt(interestCountList[i]);
	}

	
	console.log("memberCnt:"+memberCnt);
	console.log("centerCnt:"+centerCnt);
	console.log("interestCnt:"+interestCnt);
	

	
	document.getElementById('memberCnt').innerHTML=memberCnt;
	document.getElementById('centerCnt').innerHTML=centerCnt;
	document.getElementById('interestCnt').innerHTML=interestCnt;
	
	
	
	
	
	 barChart = new Chart(myChartOne,{
			type:'bar',//pie,line,doughnut,polarArea
			data:{
				labels :['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				datasets : [{
					label:'회원등록 추이',	
					
					data:  memberCountList,
					
					backgroundColor:[
						'#4caf50'
					],
					
					borderColor:'#263238',
					hoverBorderWidth:2 }]} ,
					
					options	: {
						 plugins: {
							title : {
								display : true,
								text : '월별 회원수 증가 추이',
								fontSize : 40,
								fontColor: 'black'},
								
							legend : {
								display : true,
								position : 'bottom'} } },
								
								layout:	{
									padding :{
										
										top : 30,
										bottom:30 }}
							 
							});
	
	
	var BarChart = new Chart(myChartTwo,{
		type:'bar',//pie,line,doughnut,polarArea
		data:{
			labels :['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			datasets : [{
				label:'index',	
				
				data: centerCountList,
				
				backgroundColor:[
					'#03a9f4'
				],
				borderColor:'#263238',
				hoverBorderWidth:2,}] },
				
				options	: {
					 plugins: {
						title : {
							display : true,
							text : '월별 등록센터 증가 추이',
							fontSize : 40,
							fontColor: 'black'}, 
				
				
						legend : {
							display : true,
							position : 'bottom'}}},
							
							
					layout:	{
						padding :{
							
							top : 30,
							bottom:30 }}	
				
				
	});
	
	
	
	
	
	var LineChart = new Chart(myChartThree,{
		type:'line',//pie,line,doughnut,polarArea
		data:{
			labels :['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			datasets : [{
				label:'index',	
				
				data: interestCountList,
				
				backgroundColor:[
					'#ffc400',
					'#ff6f00'					
				],
				borderWidth:2}] },
				
				options	: {
					 plugins: {
						title : {
							display : true,
							text : '월별 관심등록 증가 추이',
							fontSize : 70,
							fontColor: 'black'},
							
							legend : {
								display : true,
								position : 'bottom'}} },
								
					layout:	{
						padding :{
							
							top : 50,
							bottom:50 }}
								
				});					

	
	
	var PolarAreaChart = new Chart(myChartFour,{
		type:'polarArea',//pie,line,doughnut,polarArea
		data:{
			labels :['Health','Pilates','Yoga'],
			datasets : [{
				label:'index',	
				
				data: sportsCountList	,
				backgroundColor:[
					'#fbc02d',
					'#e53935',
					'#283593'	
					], }, ]},
					
					options	: {
						 plugins: {
							title : {
								display : true,
								text : '센터등록비율',
								fontSize : 70,
								fontColor: 'black'},
								
								legend : {
									display : true,
									position : 'bottom'}} },
									
						layout:	{
							padding :{
								
								top : 50,
								bottom:50 }}

					
				
			
		});
		
		
		

	
	</script>
</body>
</html>
