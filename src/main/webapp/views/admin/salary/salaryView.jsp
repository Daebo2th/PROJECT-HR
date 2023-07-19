<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet"> -->
    <!-- CSS -->
    <link rel="stylesheet" href="/assets/css/modal.css">
    <link rel="stylesheet" href="/assets/css/styles.css">
    <%--jquery--%>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- datepicker -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>급여</title>

    <style type="text/css">

        .salery-emp {
            font-size: 15px;
            padding: 5px 0;
        }

        .salery-table {
            width: 500px;
        }

        .salery-table tr td {
            border: 1px solid black;
            padding: 7px;
            font-size: 15px;
        }

        .salery-table2 {
            width: 500px;
            margin-bottom: 10px;
        }

        .salery-table2 tr td {
            border: 1px solid black;
            padding: 7px;
            font-size: 15px;
        }

        #select {
            border: 1px solid black;
            margin-left: 20px;
            padding: 0 7px;
            width: 100px;
            height: 25px;
        }
    </style>

</head>
<body>

<%@include file="/views/include/header.jsp" %>

<section id="body-pd" class="body-pd">

    <div class="main_title">
        <h2>급여</h2>
        <input type="text" id="datepicker1"> -
        <input type="text" id="datepicker2">
        <nav class="plusinfo">
            <select class="searchtype searchs">
                <option>전체</option>
                <option>사원번호</option>
                <option>귀속연월</option>
                <option>이름</option>
                <option>기본금</option>
                <option>상여금</option>
                <option>직책수당</option>
                <option>연차수당</option>
                <option>국민연금</option>
                <option>건강보험</option>
                <option>장기요양보험</option>
                <option>고용보험</option>
                <option>소득세</option>
                <option>지방소득세</option>
                <option>실수령액</option>
            </select>
            <input type="text" class="search searchs">
            <input type="button" class="searchbtn" value="검 색">
            <input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
            급여명세서</label>
            <div class="modal">
                <div>
                    <label for="popup">X</label>
                    <h1>급여명세서</h1>
                    <hr>

                    <div class="salery-emp">
                        <p>직원 : <select name="select" id="select">
                            <option value="lee">이재경</option>
                            <option value="song">송기석</option>
                            <option value="gun">권지연</option>
                            <option value="seo">서지효</option>
                        </select>
                    </div>
                    <hr>

                    <table class="salery-table">
                        <tr>
                            <td>성명</td>
                            <td>
                                <div id="name" onChange="getselect()">이재경</div>
                            </td>
                        </tr>
                        <tr>
                            <td>지급일</td>
                            <td>2023.07.02</td>
                        </tr>
                    </table>
                    <br>
                    <table class="salery-table2">
                        <tr>
                            <td colspan="2">임금지급내역</td>
                            <td colspan="2">공제내역</td>
                        </tr>
                        <tr>
                            <td>임금항목</td>
                            <td>지급금액(원)</td>
                            <td>공제항목</td>
                            <td>지급금액(원)</td>
                        </tr>
                        <tr>
                            <td>기본금</td>
                            <td>5,000,000</td>
                            <td>소득세</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>상여금</td>
                            <td>1,000,000</td>
                            <td>국민연금</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>직책수당</td>
                            <td>0</td>
                            <td>건강보험</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>연차수당</td>
                            <td>0</td>
                            <td>고용보험</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>지급액 계</td>
                            <td>6,000,000</td>
                            <td>공제액 계</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>실지급액</td>
                            <td colspan="3">6,000,000</td>
                        </tr>
                    </table>
                    <hr>
                    <div class="bottom-btn">
                        <div class="right-btn">
                            <button class="custom-btn btn-10">추가하기</button>
                            <button type="button" class="btn_close custom-btn btn-10" onclick="btnClose();">닫기</button>
                        </div>
                    </div>
                </div>
                <label for="popup"></label>
            </div>
    </div>
    </nav>
    <table class="table sec-table table-hover my-table">
        <thead>
        <tr>
            <th style="width: 30px"><input type='checkbox' id="chkAll"
                                           onclick="allCheckboxes('chk[]', this.checked)"></th>
            <th>사원번호</th>
            <th>귀속연월</th>
            <th>이름</th>
            <th>기본금</th>
            <th>상여금</th>
            <th>직책수당(팀장이상)</th>
            <th>연차수당</th>
            <th>지급액 계</th>
            <th>국민연금(4.5%)</th>
            <th>건강보험(3.99%)</th>
            <th>장기요양보험</th>
            <th>고용보험</th>
            <th>공제액 계</th>
            <th>실수령액</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${list}">
            <tr
                    data-emp-name="${list.emp_name}"
                    data-emp-name="${list.emp_name}"
                    data-basic='<fmt:formatNumber type="currency" value="${list.basic}" pattern="###,###"/>'
                    data-bonus='<fmt:formatNumber type="currency" value="${list.bonus}" pattern="###,###"/>'
                    data-direct-benefits='<fmt:formatNumber type="currency" value="${list.directBenefits}" pattern="###,###"/>'
                    data-annual-allowance='<fmt:formatNumber type="currency" value="${list.annualAllowance}" pattern="###,###"/>'
                    data-payment='<fmt:formatNumber type="currency" value="${list.payment}" pattern="###,###"/>'
                    data-national-pension='<fmt:formatNumber type="currency" value="${list.national_pension}" pattern="###,###"/>'
                    data-health-insurance='<fmt:formatNumber type="currency" value="${list.health_insurance}" pattern="###,###"/>'
                    data-lncr-insurance='<fmt:formatNumber type="currency" value="${list.lncr_insurance}" pattern="###,###"/>'
                    data-empl-insurance='<fmt:formatNumber type="currency" value="${list.empl_insurance}" pattern="###,###"/>'
                    data-total-deduction='<fmt:formatNumber type="currency" value="${list.totalDeduction}" pattern="###,###"/>'
                    data-total-pay='<fmt:formatNumber type="currency" value="${list.totalPay}" pattern="###,###"/>'>
                <th><input type='checkbox' name='chk[]'
                           onclick="isAllCheck(this.name, 'chkAll');"></th>
                <td>${list.sal_num}</td>
                <td>7/1</td>
                <td>${list.emp_name}</td>
                <td><fmt:formatNumber type="currency" value="${list.basic}" pattern="###,###"/>원</td>
                <td><fmt:formatNumber type="currency" value="${list.bonus}" pattern="###,###"/>원</td>
                <td>
                    <c:if test="${list.directBenefits == 1}">
                        <fmt:formatNumber type="currency" value="${0}" pattern="###,###"/>원
                    </c:if>
                    <c:if test="${list.directBenefits != 1}">
                        <fmt:formatNumber type="currency" value="${list.directBenefits}" pattern="###,###"/>만원
                    </c:if>
                </td>
                <td>
                    <fmt:formatNumber type="currency" value="${list.annualAllowance}" pattern="###,###"/>원
                </td>
                <td><fmt:formatNumber type="currency" value="${list.payment}" pattern="###,###"/>원</td>
                <td><fmt:formatNumber type="currency" value="${list.national_pension}" pattern="###,###"/>원</td>
                <td><fmt:formatNumber type="currency" value="${list.health_insurance}" pattern="###,###"/>원</td>
                <td><fmt:formatNumber type="currency" value="${list.lncr_insurance}" pattern="###,###"/>원</td>
                <td><fmt:formatNumber type="currency" value="${list.empl_insurance}" pattern="###,###"/>원</td>
                <td><fmt:formatNumber type="currency" value="${list.totalDeduction}" pattern="###,###"/>원</td>
                <td><fmt:formatNumber type="currency" value="${list.totalPay}" pattern="###,###"/>원</td>
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
</section>
<dialog >

    <h1>급여 수정하기</h1>
    <hr>
    <table class="salery-table2" style="width: 90%; height:480px; margin: 0 auto">

    </table>
    <hr>
    <div class="bottom-btn">
        <div class="right-btn">
            <button class="dialogbtn custom-btn btn-10" type="button" onclick="dialogClose();">닫기</button>
        </div>
    </div>
</dialog>

<!-- js -->
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
<script type="text/javascript">
    const dialog = document.querySelector("dialog");
    $(document).on("click", ".table tbody tr", function () {
        dialog.showModal();
        console.log(this);
    });

    function dialogClose() {
        dialog.close();
    }

    $(document).on("click", ".table tbody tr", function () {
        $empName = $(this).data("emp-name")
        $basic = $(this).data("basic")
        $bonus = $(this).data("bonus")
        $directBenefits = $(this).data("direct-benefits")
        $annualAllowance = $(this).data("annual-allowance")
        $payment = $(this).data("payment")
        $nationalPension = $(this).data("national-pension")
        $healthInsurance = $(this).data("health-insurance")
        $lncrInsurance = $(this).data("lncr-insurance")
        $emplInsurance = $(this).data("empl-insurance")
        $totalDeduction = $(this).data("total-deduction")
        $totalPay = $(this).data("total-pay")


        let str = `
         <tr>
                <td colspan="2">임금지급내역</td>
                <td colspan="2">공제내역</td>
            </tr>
            <tr>
                <td>임금항목</td>
                <td>지급금액(원)</td>
                <td>공제항목</td>
                <td>지급금액(원)</td>
            </tr>
            <tr>
                <td>기본금</td>
                <td>` + $basic + `</td>
                <td>국민연금</td>
                <td>` + $nationalPension + `</td>

            </tr>
            <tr>
                <td>상여금</td>
                <td>` + $bonus + `</td>
                <td>건강보험</td>
                <td>` + $healthInsurance + `</td>
            </tr>
            <tr>
                <td>직책수당</td>
                <td>` + $directBenefits + `</td>
                <td>장기요양보험</td>
                <td>` + $lncrInsurance + `</td>

            </tr>
            <tr>
                <td>연차수당</td>
                <td>` + $annualAllowance + `</td>
                 <td>고용보험</td>
                <td>` + $emplInsurance + `</td>
            </tr>
            <tr>
                <td>지급액 계</td>
                <td>` + $payment + `</td>
                <td>공제액 계</td>
                <td>` + $totalDeduction + `</td>
            </tr>
            <tr>
                <td>실지급액</td>
                <td colspan="3">` + $totalPay + `</td>
            </tr>
        `;

        $('dialog table').html(str)
    })

    updateRowsPerPage(10);
</script>
</body>
</html>