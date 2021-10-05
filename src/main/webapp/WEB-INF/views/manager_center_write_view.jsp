<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link href="./resources/css/center_list02.css" rel="stylesheet" /> 
<script>
function findAddress(){

	
	 new daum.Postcode({ // 우편번호를 구하는 함수다
       oncomplete: function(data) {
       	
       	console.log(data);
       	
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
           // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var addr = '';
           
           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           
           if(data.userSelectedType === 'R'){ // 도로명 주소가 클릭 됐을 때 R을 반환한다.
           	addr = data.roadAddress;
           } 
           else {
           	addr = data.jibunAddress; // 지번 주소
           }
           
           document.getElementById('center_post').value = data.zonecode; //우편번호
           document.getElementById("center_addr").value = addr;		   // 주소
           findCoordinate(addr);	// 위도 경도 구하는 함수
           document.getElementById("center_addr").focus();
       }
   }).open();
}


function findCoordinate(address) {
	//console.log(address);
	 var gap = address; // 주소검색어
	 
	 // 주소-좌표 변환 객체를 생성
	 var geocoder = new daum.maps.services.Geocoder();



	 // 주소로 좌표를 검색
	 geocoder.addressSearch(gap, function(result, status) {
	  
	  // 정상적으로 검색이 완료됐으면,
	  if (status == daum.maps.services.Status.OK) {
	   y = result[0].x; //가로 위도 세로 경도 y축 = 위도
	   x = result[0].y;


		//console.log(x);
		document.getElementById("center_latitude").value = x;
       document.getElementById("center_longitude").value = y;
       }
	  
	 });
	}


</script>
</head>
<body>
	<table class="type03" style="position:absolute; left:0px; top:100px;" >
		<form action="manager_center_write" method="post" enctype="multipart/form-data">
			<tr>
				<th> 센터코드 </th>
				<td> <input type="text" name="centerCode" size = "50"> </td>
			</tr>
			<tr>
				<th> 센터명 </th>
				<td> <input type="text" name="centerName" size = "50"> </td>
			</tr>
			<tr>    
				<th> 종목이름 </th>
				<td> <input type="text" name="sportsName" size = "50"> </td>
			</tr>
			<tr>
				<th> 연락처 </th>
				<td> <input type="text" name="telNumber" size = "50"> </td>
			</tr>
			<tr>
				<th> 주소 </th>
				<td> <input id="center_addr" name = "address" type="text" placeholder="Address" readonly>  </td>
			</tr>
			<tr>
				<th> 우편번호 </th>
				<td> <input id="center_post" name = "zipCode" type="text" placeholder="Zip Code" readonly >
					 <input type="button" onclick="findAddress()" value="우편번호검색"> </td>

			</tr>

			<tr>
				<th> 위도 </th>
				<td> <input id="center_latitude" type="text" name="latitude" size = "50" readonly> </td>
			</tr>
			<tr>
				<th> 경도 </th>
				<td> <input id="center_longitude" type="text" name="longitude" size = "50" readonly> </td>
			</tr>
			<tr>
				<th> 휴무일 </th>
				<td> <input type="text" name="dayoff" size = "50"> </td>
			</tr>
			<tr>
				<th> 운영시간 </th>
				<td> <input type="text" name="operatingTime" size = "50"> </td>
			</tr>
			<tr>
				<th> 월 최소 이용료 </th>
				<td> <input type="text" name="usageFeeMin" size = "50"> </td>
			</tr>
			<tr>
				<th> 월 최대 이용료 </th>
				<td> <input type="text" name="usageFeeMax" size = "50"> </td>
			</tr>
			<tr>
				<th> 등록비 </th>
				<td> <input type="text" name="regFee" size = "50"> </td>
			</tr>
			<tr>
				<th> 오픈일 </th>
				<td> <input type="text" name="openDate" size = "50"> </td>
			</tr>
			<tr>
				<th> 썸네일 이미지명 </th>
				<td> <input type="file" name="thumbnail" size = "50"> </td>
			</tr>
			<tr>
				<th> 이미지명 </th>
				<td> <input type="file" name="image" size = "50"> </td>
			</tr>
			<tr>
				<th> 설명 </th>
				<td> <textarea name="detail" rows="10" ></textarea> </td>
			</tr>			
			<tr>
				<td colspan="2"> <input type="submit" value="입력"> &nbsp;&nbsp; <a href="manager_center_list" style="color: black; font-weight: bold; text-decoration: underline;">목록보기</a></td>
			</tr>
		</form>
	</table>
</body> 

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea6b489f7ee062bcd91d58f83c338576&libraries=services"></script>

</html>