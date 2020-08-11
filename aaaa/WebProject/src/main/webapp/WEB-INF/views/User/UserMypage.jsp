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
                <button type="button" class="point-btn" onclick="location.href='UserUpdate'">회원정보 수정하기</button><br>
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

</body>
</html>