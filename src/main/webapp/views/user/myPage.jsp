<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="../../assets/css/myPage.css">
<title>My Page</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
</head>
  <style type="text/css">
  @charset "UTF-8";

body, div {
	margin: 0;
	padding: 0;
	
	align-content: center;
}

table {
	margin: auto;
	margin-top: 40px;
    margin-bottom: 40px;
	width: 80%;
	heignt: 20%;
 	align-content: center;
	border-style: solid;
	border-radius: 5px;
	padding: 30px;
	}
	
th {
	text-align: right;
	width: 200px
}

td {
	text-align: left;
}
/* tr{
	text
} */
img{
	width: 200px;
}
/* -----------------------------------------------------------------*/
.tabs {

	border-bottom:1px solid #777;
}
.tabs a{
	float: left;
	width: 100px;
	height: 32px;
	text-align: center;
	line-height: 32px; 
	cursor:pointer
	}

.tabs a:hover{
	background-color: lightgray;
}

.tabs a:active {
	background-color: red;
}
.tabs a:focus {
	color: red;
}
  
  </style>
<body>
		<div>
			<h3>내 인사정보</h3>
			<hr>
			<table>
				<tr>
					<td rowspan="5" width="300px"> <img src=#></td>
					<th>사원명</th> 	<td> </td>
					<th>직원구분</th> 	<td>  </td>
					<th>부서</th> 	<td>  </td>
				</tr>
				<tr>
					<th>직위</th> 	<td> </td>
					<th>입사일자</th> 	<td> </td>
					<th>사원번호</th> 	<td> </td>
					
				</tr>
				<tr>
					<th>직책</th> 	<td> </td>
					<th>ID</th> 	<td></td>
					<th>직통번호</th> 	<td> </td>
				
				</tr>
				<tr>
					<th>직급</th> 	<td> </td> 
					<th>이메일</th> 	<td> </td>
					<th>휴대전화</th> 	<td> </td>
					
				</tr>
				<tr>
					<th>FAX</th> <td> </td>
					<th>메신저</th> <td> </td>
					<!-- <th>FAX</th> <td> </td> -->
				</tr>
			</table>
		</div>
		<!-- ///////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- 탭 메뉴--><!-- 인사정보 개인정보 인사발령 경력·학력 포상·징계 인사평가 -->
<div class="tabs">
  <a data-tab="tab-1">인사정보</a>
  <a data-tab="tab-2">개인정보</a>
  <a data-tab="tab-3">인사발령</a>
  <a data-tab="tab-4">경력·학력</a>
  <a data-tab="tab-5">포상·징계</a>
  <a data-tab="tab-6">인사평가</a>
</div>
<br>

<!-- 내용 -->

<div class="modal_nav" id="tab-1" style="display: block;">
<table>
					<tr>
						<td colspan="6"><h3>직원 정보</h3></td>
					</tr>     
					<tr>
						<td>성별</td> 		<td></td>
						<td>사번</td> 		<td></td>
						<td>##</td> 		<td></td>
					</tr>
					<tr>
						<td>생년월일</td> 	<td></td>
						<td>입사일</td> 		<td></td>
						<td>##</td> 		<td></td>
					</tr>
					<tr>
						<td>주소</td> 		<td></td>
						<td>최종발령일</td> 	<td></td>
						<td>##</td> 		<td></td>
					</tr>
				</table>   
</div>

<div class="modal_nav" id="tab-2" style="display: none;"></div>
<div class="modal_nav" id="tab-3" style="display: none;"></div>
<div class="modal_nav" id="tab-4" style="display: none;"></div>
<div class="modal_nav" id="tab-5" style="display: none;"></div>
<div class="modal_nav" id="tab-6" style="display: none;"></div>

	
<script>
	  // 버튼 눌렀을때 해당하는 form 의 ajax 통신
	  function testfn(){
	  }
	  $('.tabs a').click(function(){
	    let $tabId = $(this).data('tab')
	    $('.modal_nav').hide()

	    $('#'+$tabId).show()
	    $('input[type="submit"]').attr('form',$('#'+$tabId).children('form').attr("id"))
	  })
</script>
	</body>	
</html>