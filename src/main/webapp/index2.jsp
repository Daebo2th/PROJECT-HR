<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <link rel="stylesheet" href="assets/css/styles.css">
    <%--    <link rel="stylesheet" href="static/css/style.css">--%>
    <title>Document</title>
</head>
<body id="body-pd">
<h1>기타</h1>
<ul>
    <li><a href="/views/user/myPage.jsp">마이페이지</a></li>
    <li><a href="/views/user/registration.jsp">회원가입</a></li>
    <li><a href="/views/user/login.jsp">로그인</a></li>
</ul>
<h1>사용자</h1>
<ul>
    <li><a href="/views/user/userScheduleView.jsp">스케줄</a></li>
    <li><a href="/views/user/workRecord/workRecordView.jsp">출퇴근기록</a></li>
    <li><a href="/views/user/requestHistoryView.jsp">요청내역</a></li>
</ul>
<h2>관리자</h2>
<ul>
    <li><a href="/views/user/dashboard.jsp">대쉬보드</a></li>
    <li><a href="/views/admin/workSchedule/workScheduleView.jsp">근무일정</a></li>
    <li><a href="/views/admin/attendance/attendanceView.jsp">출퇴근기록</a></li>
    <li><a href="/views/admin/vacation/vacationView.jsp">휴가</a></li>
    <li><a href="/views/admin/requestHistory/requestHistoryView.jsp">요청내역</a></li>
    <li><a href="/views/admin/salery/saleryView.jsp">급여</a></li>
    <li><h2>관리</h2>
        <ul>
            <li><a href="/views/admin/employee/employeeView.jsp">직원</a></li>
            <li><a href="/views/admin/duty/dutyView.jsp">부서</a></li>
            <li><a href="/views/admin/rank/rankView.jsp">직급</a></li>
            <li><a href="/views/admin/vacationType/vacationTypeView.jsp">휴가유형</a></li>
            <li><a href="/views/admin/manage/workView.jsp">근로정보</a></li>
            <li><a href="/views/admin/manage/workScheduleView.jsp">근무일정유형</a></li>
            <li><a href="/views/admin/manage/workScheduleTempView.jsp">근무일정템플릿</a></li>
            <li><a href="/views/admin/manage/vacationRulesView.jsp">휴가발생규칙</a></li>
        </ul>
    </li>
</ul>
</body>
</html>