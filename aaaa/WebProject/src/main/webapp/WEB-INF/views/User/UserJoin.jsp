<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/stayle2.css">

</head>
<body>
<%@include file="../include/header.jsp" %>
	<section>
		<div class="container">
			<div class="Joinrow">
				<div class="JoinContainer">

					<div class="JoinFormContainer">
						<h1>회원가입</h1>

						

						<form action="JoinForm" method="post" name="regForm">
							<div class="StyledFormGroup">
								<label class="LabelName">이름</label> <input type="text"
									class="StyledInputFieldText" name="name" id="name"
									placeholder="홍길동">
								<h6 class="msgt">
									<span id="msg-n"></span>
								</h6>
							</div>
							<div class="StyledFormGroup">
								<label class="LabelName">이메일</label> <input type="text"
									class="StyledInputFieldText" id="email" name="email"
									placeholder="example@naver.com">
								<h6 class="msgt">
									<span id="msg-e"></span>
								</h6>
							</div>
							<div class="StyledFormGroup">
								<label class="LabelName">휴대폰번호</label> <input
									class="StyledInputFieldText" placeholder="-제외하고 입력하세요."
									name="phone" id="phone">
								<h6 class="msgt">
									<span id="msg-ph"></span>
								</h6>
							</div>

							<div class="StyledFormGroup">
								<label class="LabelName">비밀번호(8자이상)</label> <input
									type="password" class="StyledInputFieldText" id="pw" name="pw"
									placeholder="********">
								<h6 class="msgt">
									<span id="msg-pw"></span>
								</h6>
							</div>
							<div class="StyledFormGroup">
								<label class="LabelName">비밀번호 확인</label> <input type="password"
									class="StyledInputFieldText" name="pw-confrim" id="pw-confrim"
									placeholder="********">
								<h6 class="msgt">
									<span id="msg-pwc"></span>
								</h6>
							</div>


							<div class="form-group">
								<label for="addr-num">주소</label>
								<div class="input-group">
									<input type="text" class="form-control" id="postal_code"
										name="postal_code" placeholder="우편번호" readonly>
									<div class="input-group-addon">
										<button type="button" class="btn btn-primary"
											onclick="goPopup()">주소찾기</button>
									</div>
								</div>
							</div>


							<div class="StyledFormGroup">
								<label class="LabelName">주소</label> <input type="text"
									class="StyledInputFieldText" name="address1" id="address1"
									placeholder="기본주소">
							</div>
							<div class="StyledFormGroup">
								<input type="text" class="StyledInputFieldText" name="address2"
									id="address2" placeholder="상세주소">
							</div>

							<button type="button"
								class="btn btn-lg btn-info btn-block logBtn" onclick="check()">
								<span class="ButtonText">회원가입하기</span>
							</button>

						</form>
						<hr>
						<div>
							<!--카카오로그인 버튼-->
							<a id="custom-login-btn" href="javascript:loginWithKakao()">
								<img
								src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
								width="100%" />
							</a>
						</div>
					</div>


				</div>
			</div>
		</div>


	</section>


	<script>
	var name = document.getElementById("name");
	name.onkeyup=function(){
		console.log("dd")
		if(document.regForm.name.value.length < 5){
			name.style.borderColor="red";
			name.style.color="red";
			document.getElementById("msg-n").innerHTML="이름을 입력하세요";
		}
	}
	var email = document.getElementById("email");
	email.onkeyup=function(){
		if(document.getElementById("email").value===''){
			email.style.borderColor="red";
			email.style.color="red";
			document.getElementById("msg-e").innerHTML="이메일을 입력하세요";
		}
	}
	var phone = document.getElementById("phone");
	phone.onkeyup=function(){
		if(document.getElementById("phone").value===''){
			phone.style.borderColor="red";
			phone.style.color="red";
			document.getElementById("msg-ph").innerHTML="휴대폰번호를 입력하세요";
		}
	}
	var pw = document.getElementById("pw");
	pw.onkeyup=function(){
		if(document.getElementById("pw").value.length<8){
			pw.style.borderColor="red";
			pw.style.color="red";
			document.getElementById("msg-pw").innerHTML="비밀번호는 8자이상입니다";
		} else {
			pw.style.borderColor="green";
			pw.style.color="green";
			document.getElementById("msg-pw").innerHTML="";
		}
		
	}
	var pwC = document.getElementById("pw-confrim");
	pwC.onkeyup=function(){
		if(document.getElementById("pwC").value===''){
			pwC.style.borderColor="red";
			pwC.style.color="red";
			document.getElementById("msg-pwc").innerHTML="비밀번호를 한번더 입력하세요";
		}else if(document.getElementById("pwC").value==document.getElementById("pw").value){
			document.getElementById("msg-pwc").innerHTML="비밀번호가 일치합니다";
		}
	}


	function goPopup(){
        // 주소검색을 수행할 팝업 페이지를 호출합니다.
        // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
        var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
        
        // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
         //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
     }
	
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
        
        document.getElementById("postal_code").value = zipNo;
        document.getElementById("address1").value = roadAddrPart1;
        document.getElementById("address2").value = addrDetail;
        
        
        
        /*    document.form.roadAddrPart1.value = roadAddrPart1;//도로명주소
           document.form.addrDetail.value = addrDetail; //고객입력상세주소
           document.form.addrZipNum.value = zipNo; //우편번호 */
           
           // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
           /* document.form.roadFullAddr.value = roadFullAddr; */
           /* document.form.roadAddrPart2.value = roadAddrPart2; */
           /* document.form.engAddr.value = engAddr;
           document.form.jibunAddr.value = jibunAddr; */
   /*         document.form.admCd.value = admCd;
           document.form.rnMgtSn.value = rnMgtSn;
           document.form.bdMgtSn.value = bdMgtSn;
           document.form.detBdNmList.value = detBdNmList;
            2017년 2월 추가제공 
           document.form.bdNm.value = bdNm;
           document.form.bdKdcd.value = bdKdcd;
           document.form.siNm.value = siNm;
           document.form.sggNm.value = sggNm;
           document.form.emdNm.value = emdNm;
           document.form.liNm.value = liNm;
           document.form.rn.value = rn;
           document.form.udrtYn.value = udrtYn;
           document.form.buldMnnm.value = buldMnnm;
           document.form.buldSlno.value = buldSlno;
           document.form.mtYn.value = mtYn;
           document.form.lnbrMnnm.value = lnbrMnnm;
           document.form.lnbrSlno.value = lnbrSlno;
            2017년 3월 추가제공
           document.form.emdNo.value = emdNo; */
           
     }
	

	function check() {
		
		if(confirm("가입하시겠습니까?") ) {
			
			document.regForm.submit();
		}
		
	}
	</script>

</body>
</html>