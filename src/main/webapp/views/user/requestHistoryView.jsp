<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <%--jquery--%>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<%--    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">--%>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/assets/css/styles.css">
</head>
<style>
	.title{
	margin: auto;
	margin-top: 20px;
	width: 90%;
	}
	
    .sec-table {
    border-collapse: collapse;
    width: 80%;
    height: 10px;
    text-align: center;
    margin-top: 75px;
    margin-left: 10%;
	}
</style>
<body>
<%@include file="/views/include/header_user.jsp" %>
    <div class="main_title">
    <h1 class="title">요청 내역</h1>
    </div>
    <table class="sec-table table-hover my-table">
        <tr>
            <th>요청종류</th>
            <th>요청 보낸 사람</th>
            <th>요청사항</th>
            <th>요청사유</th>
            <th>상태</th>
            <th>승인권자 노트</th>
            <th>신청일자</th>
            <th>관리</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="requestList">
            <tr>
                <td>${requestList.request_type == 'A' ? '출퇴근 요청' :
                        requestList.request_type == 'W' ? '근무일정 요청' :
                                requestList.request_type == 'V' ? '휴가 요청' :''}</td>
                <td>${requestList.emp_name}</td>
                <td>
                    <c:if test="${requestList.request_type == 'V'}">
                        <fmt:formatDate value="${requestList.start_date}" pattern="yy-MM-dd"/>&nbsp;~&nbsp;
                        <fmt:formatDate value="${requestList.end_date}" pattern="yy-MM-dd"/>/${requestList.special_note!=null?requestList.special_note:""}
                    </c:if>
                    <c:if test="${requestList.request_type != 'V'}">
                        <fmt:formatDate value="${requestList.start_date}" pattern="yy-MM-dd HH:mm"/>&nbsp;~&nbsp;
                        <fmt:formatDate value="${requestList.end_date}" pattern="yy-MM-dd HH:mm"/>${requestList.special_note!=null?"/"+requestList.special_note:""}
                    </c:if>
                </td>
                <td>${requestList.request_reason}</td>
                <td>${requestList.state == 0 ? '대기' : (requestList.state == 1 ? '승인' : (requestList.state == 2 ? '거절' : (requestList.state == 3 ? '취소' : '알 수 없음')))}</td>
                <td>${requestList.approver_note}</td>
                <td>${requestList.application_date}</td>
                <td>
                    <c:if test="${requestList.state == 0}">
                        <button type="button" onclick="approvalBtn(this,'cancle')" data-rqst-num="${requestList.rqst_hstry_num}" class="approve">취소</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    	<div class="pagination">
			<i class='bx bxs-chevron-left'></i>
			<ol id="pagingNumbers">
			</ol>
			<i class='bx bxs-chevron-right'></i>		
		</div>
<script src="/assets/js/main.js"></script>
<script>
    function approvalBtn(btn,approval){
        const rqstNum = $(btn).data("rqst-num");
        if(!confirm("취소하시겠습니까?")) return
        $.ajax({
            url : "/approvalok.do?approval="+approval,
            type : "get",
            data : {"rqstNum":rqstNum},
            dataType : "json",
            success : sucFuncJson,
            error : errFunc
        });

        function sucFuncJson(){
            alert("승인되었습니다.");
            window.location.reload();
        }
        function errFunc(error){
            console.log(error)
        }
    }
    
		
 // 페이징
 const rowsPerPage= 10;
 const rows = document.querySelectorAll('.my-table tbody tr');
 const rowsCount = rows.length;
 const pageCount = Math.ceil(rowsCount/rowsPerPage); 
 const pagingNumbers = document.querySelector('#pagingNumbers');
 // 변수 추가
 const prevPageBtn = document.querySelector('.pagination .bxs-chevron-left');
 const nextPageBtn = document.querySelector('.pagination .bxs-chevron-right');
 let pageActiveIdx = 0; // 현재 보고 있는 페이지그룹 번호
 let currentPageNum = 0; // 현재 보고 있는 페이지네이션 번호
 let maxPageNum = 5; // 페이지 그룹 최대 개수

 for(let i = 1;i <= pageCount; i++){
 /* 	console.log(i); */
  	 pagingNumbers.innerHTML += '<li><a href="">'+i+'</a></li>'; 
  } 
  
 const pagingBtn = pagingNumbers.querySelectorAll('a');
 console.log(pagingBtn);

 // 페이지네이션 번호 감추기
 for(pb of pagingBtn){
 	pb.style.display='none';
 }

 // 클릭 이벤트 처리(active)
 pagingBtn.forEach((item,idx)=>{
  	item.addEventListener('click',(e)=>{
 		e.preventDefault();		
 		// 테이블 출력 함수
 		displayRow(idx);
 	});
 });
 function displayRow(idx){
 	// 배열 만들기
 	let start = idx*rowsPerPage;
 	let end = start+rowsPerPage;
 	let rowsArray = [...rows];
 	
 	for(ra of rowsArray){
 		ra.style.display = 'none';
 	}
 	let newRows = rowsArray.slice(start,end);
 	for(nr of newRows){
 		nr.style.display= '';
 	}
 	for(pb of pagingBtn){
 		pb.classList.remove('active');
 	}
 	pagingBtn[idx].classList.add('active'); 
 	
 } // displayRow

 displayRow(0);
 // 페이지네이션 그룹 표시 함수
 function displayPage(num){
 	// 페이지네이션 번호 감추기
 	for(pb of pagingBtn){
 		pb.style.display='none';
 	}
 	let totalPageCount = Math.ceil(pageCount/maxPageNum);
 	
 	let pageArr = [...pagingBtn];
 	let start = num*maxPageNum;
 	let end = start+maxPageNum;
 	let PageListArr = pageArr.slice(start, end);
 	
 	
 	for(let item of PageListArr){
 		item.style.display = 'block';
 	}
 	if(pageActiveIdx == 0){
 		prevPageBtn.style.display = 'none';
 	} else{
 		prevPageBtn.style.display = 'block';
 	}
 	if(pageActiveIdx == totalPageCount - 1){
 		nextPageBtn.style.display = 'none';
 	} else{
 		nextPageBtn.style.display = 'block';
 	}
 }
 displayPage(0);

 nextPageBtn.addEventListener('click',()=>{
 	let nextPageBtn = pageActiveIdx*maxPageNum+maxPageNum;
 	displayRow(nextPageBtn);
 	++pageActiveIdx;
 	displayPage(pageActiveIdx);
 });
 prevPageBtn.addEventListener('click',()=>{
 	let nextPageBtn = pageActiveIdx*maxPageNum-maxPageNum;
 	displayRow(nextPageBtn);
 	--pageActiveIdx;
 	displayPage(pageActiveIdx);
 });
</script>
</body>
</html>