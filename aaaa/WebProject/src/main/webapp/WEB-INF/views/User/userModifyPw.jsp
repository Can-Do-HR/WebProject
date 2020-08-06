<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/stayle2.css">
</head>
<body>
<%@include file="../include/header.jsp" %>

    <div class="container">
        <div class="row">
               <div class="pg">
                   <div class="pageMessege">
                    <h1>
                    새로운 비밀번호를
                    <br>
                    설정해주세요
                    </h1>
                    <div class="pageMessege2">
                        계정에 연결된 이메일 주소를 입력하면 암호를 재설정할 수 있는 링크를 이메일로 보내드릴게요.
                    </div>
                    <form>
                        <div class="form-group resetPw-form">
							<label for="email">이메일</label> <input type="text"
								class="form-control" id="email" name="email"
								placeholder="example@naver.com">
                        <button type="submit" class="btn btn-lg btn-info btn-block sendMail">인증 메일 전송하기</button>
                        </div>
                    </form>
                   </div>
                   
            </div> 
        </div>           
    </div>
        
</body>
</html>