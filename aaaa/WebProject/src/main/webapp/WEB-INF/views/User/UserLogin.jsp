<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stayle2.css">


</head>
<body>
<%@include file="../include/header.jsp" %>
    <section>
		<div class="container">
			<div class="Loginrow">				
                <div class="FormContainer">

                    <div class="LoginFormContainer">
                            <div class="LoginFormTop">
                                <h2 class="LoginTitleText">로그인</h2></div>
    
                        <form action="LoginForm" method="post" name="LoginForm">
                            <div class="StyledFormGroup">
                                <label class="LabelName">이메일</label> 
                                <div class="StyledInputField">
                                    <input type="email" name="email" id="email"
                                    class="StyledInputFieldText" placeholder="example@naver.com">
                                    <h6 class="msgt">
                                        <span id="msg">이메일을 입력해주세요.</span>
                                    </h6>
                                </div>
                            </div>
    
                            <div class="StyledFormGroup">
                                <label class="LabelName">비밀번호</label> 
                                <div class="StyledInputField">
                                    <input type="password" name="pw"
                                    class="StyledInputFieldText" name="pw" id="password" placeholder="********">
                                    <h6 class="msgt">
                                        <span id="msg">비밀번호를 입력해주세요.</span>
                                    </h6>
                                </div>
                            </div>
                            <div class="buttonWrap">
                                <a class="resetPwButton" href="resetPw.html">비밀번호를 잊으셨나요?</a>
                                <a class="joinButton" href="Join">회원가입하기</a>
    
                            </div>
                            
                            <input type="hidden" name="hiddenInput" id="hiddenInput" value="">
                           
                            <button type="submit" class="btn btn-lg btn-info btn-block logBtn">
                                <span class="ButtonText">로그인</span>
                            </button>
                        </form>
                        <hr>
    
                        <div>
                            
                            <!--카카오로그인 버튼-->
                            <a id="custom-login-btn" href="javascript:loginWithKakao()" class="kakaologin" > <img
                                src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
                                width="100%" />
                            </a>
                        </div>	
                    </div>    
                </div>     
                <div class="LoginFormBackground"><img src="${pageContext.request.contextPath}/img/login-bg.png" style="width:150%"></div>
            </div>
			<!-- ${pageContext.request.contextPath}/ -->
	    </div>


	</section>
	
	<script>
        //1.카카오 초기화
        Kakao.init('21dacd05a4f6f56d008ee3ba02ad3564');//키등록
        console.log(Kakao.isInitialized());

        function loginWithKakao() {
             Kakao.Auth.login({
              success: function(authObj) {
                getInfo();//2.사용자 정보요청 함수 호출
                },
            fail: function(err) {
                alert(JSON.stringify(err))
                }, 
            })
        }
        //3.사용자 정보 얻기
        function getInfo(){
            Kakao.API.request({
                url: '/v2/user/me',
                success: function(res) {
                    console.log(res);
                    //다음 코드로 id 추출
                    //아이디
                    var k_id = res.id;
                    //이메일
                    var k_email = res.kakao_account.email;
                    //이름
                    var k_name = res.kakao_account.profile.nickname;
                    //프로필사진
                    var k_profile_img=res.kakao_account.profile.profile_image_url;

                    console.log(k_id,k_email,k_name,k_profile_img);

                    //폼요청 url변경
                    console.log("k_email : " + res.kakao_account.email);
                    console.log("k_name : " + k_name);
                    
                    document.LoginForm.action = "/project/User/KakaoLogin?email=" + res.kakao_account.email + "&name=" + k_name;
                    //폼 id의 value값 변경 
                    //document.LoginForm.id.value=id;
                    
                    //document.LoginForm.name.value=name;
                    
                    sessionStorage.setItem('k_name',k_name);
                    
                    console.log(sessionStorage.getItem('k_name'));

                    document.LoginForm.email.value=k_email;
                    
                    
                    document.LoginForm.hiddenInput.value=k_name;
                    document.LoginForm.submit();//서브밋
                    
                },
                fail: function(error) {
                alert("사용자 요청 정보에 실패했습니다. 동의 항목을 확인")
                },
            })
        }

        //4.로그아웃 
        function kakaoLogout() {
            if (!Kakao.Auth.getAccessToken()) {
            alert('Not logged in.')
            return
            }
            Kakao.Auth.logout(function() {
            alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
            })
        }

        $(".logBtn").click(function(){
		
        if($("#email").val() == ''){
               alert("이메일 입력하시오");
               $("#email").focus();
            return;
            }else if($("#password").val() == ''){
                   alert("비번입력하시오");
                   $("#password").focus();
               return;
            }else{
                document.LoginForm.submit();
                alert(msg)
            }
   })
    
    </script>
   
    
</body>
</html>