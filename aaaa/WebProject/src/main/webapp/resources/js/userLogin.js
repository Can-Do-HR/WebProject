    
    //TO DO: 제이쿼리식으로 바꾸기
    //1.카카오 초기화
    Kakao.init('e7c5f56d6ac8b317e5d0980730e2c24a');//키등록
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
                var id = res.id;
                //이메일
                var email = res.kakao_account_email;
                //이름
                var name = res.kakao_account.profile.nickname;
                //프로필사진
                var profile_img=res.kakao_account.profile.profile_image_url;

                console.log(id,email,name,profile_img);

                //폼요청 url변경
                document.loginForm.action = "xxx";
                //폼 id의 value값 변경 
                document.loginForm.id.value=id;
                
                document.loginForm.name.value=name;

                document.loginForm.submit();//서브밋
                
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
