<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userPayment.css">
</head>
<body>
	<%@include file="../include/header.jsp" %>
    <header>
        럴럴ㄹ러~~
    </header>

    <section>
        <div>
            <form>
                <h2>주문정보</h2>
                <img>
                <hr>
                <h2>연락처 정보</h2><br>
                *받으시는 분 <input type="text"><br><br>
                *휴대폰 번호 <input type="text">
                <hr>
                <h2>결제금액</h2><br>
                <span>원</span>
                <hr>
                <h2>결제 방식</h2><br>
                <div class="btns">
                    <button class="module" type="button">결제 모듈</button><br>
                    <button class="module" type="button">무통장 입금</button><br>
                    <button class="payment" type="button">결제하기</button>
                </div>
            </form>
        </div>
    </section>
</body>
</html>