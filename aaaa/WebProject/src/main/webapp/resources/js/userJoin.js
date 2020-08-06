///////////////////////폼 양식 체크하는 부분////////////////////////
$("#userName").keyup(function(){
    if($("#userName").val()==''){
        $("#userName").css("borderColor", "red");
        $("#msgName").text("이름을 입력하세요");
    }

})
$("#userEmail").keyup(function(){
    if($("#userEmail").val()==''){
        $("#userEmail").css("borderColor", "red");
        $("#sgEmail").text("이메일을 입력하세요");
    }

})
$("#phone").keyup(function(){
    if($("#phone").val()==''){
        $("#phone").css("borderColor", "red");
        $("#msgPhone").text("휴대폰번호를 입력하세요");
    }

})
$("#userPw").keyup(function(){
    if($("#userPw").val().length<8){
        $("#userPw").css("borderColor", "red");
        $("#msgPw").text("비밀번호는 8자이상입니다");
    }

})
$("#pw-confrim").keyup(function(){
    if($("#pw-confrim").val()==''){
        $("#pw-confrim").css("borderColor", "red");
        $("#msgPwC").text("비밀번호를 한번더 입력하세요");
    }else if($("#pw-confrim").val()==$("#userPw").val()){
        $("#pw-confrim").css("borderColor", "orange");
        $("#msgPwC").text("비밀번호가 일치합니다");
    }else{
        $("#pw-confrim").css("borderColor", "red");
        $("#msgPwC").text("비밀번호가 틀렸습니다");
    }

})

/*주소팝업창*/ //TODO: 수정하기...
function goPopup(){
    let pop = window.open("../popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadAddrPart1,addrDetail, zipNo){
        //팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
        
        document.getElementById("addrZipNum").value = zipNo;
        document.getElementById("addrBasic").value=roadAddrPart1;
        document.getElementById("addrDetail").value=addrDetail;
}

///////////////////로그인 폼 전체 체크 해주세요//////////////////////////
$("#joinFormBtn").click(function(){

    //if else if 구문으로 비어있진 않은지. 폼 양식맞춰 작성해주세여!
    if(confirm("가입하시겠습니까?") ) {
        
        document.regForm.submit();
    }
})
    
    
