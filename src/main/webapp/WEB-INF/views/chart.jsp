<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="row">
			
			<div class="col-md-6">
				<canvas id="myChartOne" width="300" height="300"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="myChartTwo" width="300" height="300"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="myChartThree" width="300" height="300"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="myChartFour" width="300" height="300"></canvas>
			</div>
		</div>
	</div>
	<script>
		var myChartOne = document.getElementById('myChartOne').getContext('2d');
		var myChartTwo = document.getElementById('myChartTwo').getContext('2d');
		var myChartThree = document.getElementById('myChartThree').getContext('2d');
		var myChartFour = document.getElementById('myChartFour').getContext('2d');
		
	
		var memberCountList = new Array();
		var centerCountList = new Array();
		var sportsCountList = new Array();
		var interestCountList = new Array();

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
	 
		var barChart = new Chart(myChartOne,{
			type:'bar',//pie,line,doughnut,polarArea
			data:{
				labels :['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				datasets : [{
					label:'회원등록 추이',	
					
					data:  memberCountList
				}]
			}
		});
		
		var BarChart = new Chart(myChartTwo,{
			type:'bar',//pie,line,doughnut,polarArea
			data:{
				labels :['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				datasets : [{
					label:'센터등록 추이',	
					
					data: centerCountList
				}]
			}
		});
		
		var LineChart = new Chart(myChartThree,{
			type:'line',//pie,line,doughnut,polarArea
			data:{
				labels :['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				datasets : [{
					label:'관심센터추가 추이',	
					
					data: interestCountList
				}]
			}
		});
		
		var PolarAreaChart = new Chart(myChartFour,{
			type:'polarArea',//pie,line,doughnut,polarArea
			data:{
				labels :['Health','Pilates','Yoga'],
				datasets : [{
					label:'회원등록 추이',	
					
					data: sportsCountList	
				}]
			}
		});
	
	</script>
</body>
</html>