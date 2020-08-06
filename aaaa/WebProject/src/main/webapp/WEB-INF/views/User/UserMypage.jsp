<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userMypage.js"></script>

	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userMypage.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/utilProduct.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

</head>
<body>
<%@include file="../include/header.jsp" %>
    
<section>
    <div class="mypage-info">
        <div class="mypage-info-side">
            <div class="mypage-info-detail">
                <div class="mypage-img"><img src="../img/ic-unknown.png"></div>
                <span class="mypage-info-nickname">닉네임</span><br>
                <span class="mypage-info-email">email@example.com</span>
            </div><hr>
            <div class="mypage-info-btns">
                <button type="button" class="point-btn">회원정보 수정하기</button><br>
                <button type="button" class="simple-btn">회원 탈퇴</button>
            </div>
        </div>
        <div class="mypage-detail-side">
            <div>
                <h3>내가 수강한 클래스</h3><hr>
                <div class="mypage-view-myclass">
								
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                    
                </div>
            </div>
            <div>
                <h3>내가 개설한 클래스</h3><hr>
                <div class="mypage-view-myclass">
                    
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="class-view-minibox swiper-slide create-view-minibox">
                                <a href="#">
                                   <div class="class-minibox-img"><img style="filter: grayscale(70%);" src="../img/absolutvision-82TpEld0_e4-unsplash.jpg" /></div>
                                    <div class="class-minibox-info">
                                        <span class="class-minibox-cartegory">새로운 도전</span><br />
                                        <span class="class-minobox-name">클래스 개설하기</span><br />
                                        <hr />
                                        <span class="class-minibox-price">당신의 재능을 다른 사람과 공유해보세요</span><span></span>
                                    </div>
                                </a>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>

                </div>
            </div>
            <div>
                <h3>내가 작성한 후기</h3><hr>
            </div>
        </div>
    </div>
</section>

	
<div class="modal fade" id="replyModal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="CloseBtn" data-dismiss="modal">닫기</button>
                <h4 class="modal-title">정보수정</h4>
            </div>
            <div class="modal-body">
                <!--수정폼-->
                <div class="ProfileForm">
                    <div class="StyledFormGroup">
                        <label class="LabelName">이름</label>
                        <div class="StyledInputField">
                            <input type="text" name="name" id=""
                                class="StyledInputFieldText" placeholder="이름을 입력해주세요.">
                        </div>
                    </div>
                </div>
                <div class="ProfileForm">
                    <div class="StyledFormGroup">
                        <label class="LabelName">닉네임</label>
                        <div class="StyledInputField">
                            <input type="text" name="nickName" id=""
                                class="StyledInputFieldText" placeholder="">
                        </div>
                    </div>
                </div>
                <div class="ProfileForm">
                    <div class="StyledFormGroup">
                        <label class="LabelName">휴대전화 번호</label>
                        <div class="StyledInputField">
                            <input type="text" name="nickName" id=""
                                class="StyledInputFieldText" placeholder="휴대폰번호를 입력해주세요.">
                        </div>
                    </div>
                </div>
                <div class="updateForm">
                    <button type="submit" class="btn logBtn" id="modalModBtn">
                        <span class="ButtonText">수정하기 </span>
                    </button>
                </div>
                <div class="signOutForm">
                    <button type="submit" class="btn logBtn signOutBtn" id="modalOutBtn">
                        <span class="ButtonText">회원탈퇴</span>
                    </button>
                </div><!--수정폼끝-->
            </div>
        </div>
    </div>
</div>



</body>
</html>