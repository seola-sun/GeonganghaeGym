<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link href="./resources/css/center_view02.css" rel="stylesheet" />
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
	<table class= "type03" style="position:absolute; left:25%;">
		<form action="manager_center_modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="centerCode" value="${manager_center_modify_view.centerCode}">			
		<tr>
			<th>센터명</th>
			<td> <input type="text" name="centerName" value="${manager_center_modify_view.centerName}"></td>			
		</tr>
		<tr>
			<th>주요 종목</th>
			<td> <input type="text" name="sportsName" value="${manager_center_modify_view.sportsName}"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td> <input type="text" name="telNumber" value="${manager_center_modify_view.telNumber}"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input id="center_addr" name = "address" type="text" value ="${manager_center_modify_view.address }" readonly>  </td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input id="center_post" name = "zipCode" type="text" value ="${manager_center_modify_view.zipCode }" readonly >
				<input type="button" onclick="findAddress()" value="우편번호검색"> </td>
		</tr>		
		<input id="center_latitude" type="hidden" name="latitude" size = "50" value="${manager_center_modify_view.latitude }" > 
		<input id="center_longitude" type="hidden" name="longitude" size = "50" value="${manager_center_modify_view.longitude }" > 
		<tr>
			<th>썸네일 이미지 </th>
			<td>${manager_center_modify_view.thumbnail}<input type="file" name="thumbnail" size = "50"></td>
		</tr>
		<tr>
			<th>센터 이미지</th>
			<td>${manager_center_modify_view.image}<input type="file" name="image" size = "50"></td>
		</tr>
		<tr>
			<th>운영 시간</th>
			<td><input type="text" name="operatingTime" value="${manager_center_modify_view.operatingTime}"></td>
		</tr>
		<tr>
			<th>휴무일</th>
			<td> <input type="text" name="dayoff" value="${manager_center_modify_view.dayoff}"></td>
		</tr>
		<tr>
			<th>등록비</th>
			<td> <input type="text" name="regFee" value="${manager_center_modify_view.regFee}"></td>
		</tr>
		<tr>
			<th>한달 이용 금액(최소)</th>
			<td> <input type="text" name="usageFeeMin" value="${manager_center_modify_view.usageFeeMin}"></td>
		</tr>
		<tr>
			<th>한달 이용 금액(최대)</th>
			<td> <input type="text" name="usageFeeMax" value="${manager_center_modify_view.usageFeeMax}"></td>
		</tr>	
		<tr>
			<th>설명</th>
			<td><input type="text" name="detail" value="${manager_center_modify_view.detail}"></td>
		</tr>
		<tr>
				<td colspan="2"> <input type="submit" value="수정 완료"> &nbsp;&nbsp; <a href="manager_center_list" style="color: black; font-weight:bold; text-decoration: underline;">목록보기</a> &nbsp;&nbsp; <a href="manager_center_delete?centerCode=${manager_center_modify_view.centerCode}" style="color: black; font-weight:bold; text-decoration: underline;">삭제</a> &nbsp;&nbsp;</td>
		</tr>
		</form>
	</table>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea6b489f7ee062bcd91d58f83c338576&libraries=services"></script>

</html>