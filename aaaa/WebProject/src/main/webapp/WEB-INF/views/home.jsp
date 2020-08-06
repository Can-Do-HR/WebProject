<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
request.setCharacterEncoding("UTF-8");

session = request.getSession(true); 


//HttpSession session2 = request.getSession();
String name = (String)session.getAttribute("name");
//String k_name = (String)session.getAttribute("k_name");
%>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Document</title>

		<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
		<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/js/home.js"></script>

		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css" />
	</head>

	<body>
		<%@include file="include/header.jsp" %>

		d<br>
		d<br>
		d<br>
		d<br>
		

		<div class="menu">
			<a href="${pageContext.request.contextPath}/">전체</a>
			<a href="#">크리에이티브</a>
			<a href="#">음..</a>
			<a href="#">으음...</a>
		</div>
		
		
		
		<c:set var="name" value='<%=name %>'/>
		<%-- <c:set var="k_name" value='<%=k_name %>'/> --%>
		
		ㅋㅋ ${name } ㅋㅋ<br>
		ㅎㅎ <span id="k_name"></span> ㅎㅎ<br>
		<%-- <%= k_name %><br> --%>
		
	<c:choose>
		<c:when test="${name == null }">
			<a href="${pageContext.request.contextPath}/User/Login">로그인</a>
			<a href="${pageContext.request.contextPath}/User/Join">회원가입</a>
		</c:when>
		<c:when test="${name != null }">
			<h3>${name }님 환영합니다</h3><br>
			<a href="${pageContext.request.contextPath}/User/LogOut">로그아웃</a>
			<a href="${pageContext.request.contextPath}/User/Mypage">마이페이지</a>
		</c:when>
	</c:choose>
		
		<%-- 
		<a href="${pageContext.request.contextPath}/User/Login">로그인</a>
		<a href="${pageContext.request.contextPath}/User/Join">회원가입</a>
		<a href="${pageContext.request.contextPath}/User/Mypage">마이페이지</a> --%>

		<!--배너-->
		<div class="banner">
			<div class="banner-class">
				<div class="banner-img">
					<img src="img/banner3.jpg" />
				</div>
				<a href="#">
					<h3 class="banner-class-name">안상욱 선생님의 API특강</h3>
					<br />
					<span class="banner-class-content">이 특강 한번이면 초간단하게 만드는 api!</span>
				</a>
			</div>
			<div class="banner-background">
				dd
			</div>
		</div>

		<section>
			<h3>모든 클래스</h3>
			<hr />
			<div class="swiper-container">
				<div class="swiper-wrapper">
				
				
				
					<div class="class-view-minibox swiper-slide">
						<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
						<div class="class-minibox-info">
							<span class="class-minibox-cartegory">요리</span><br />
							<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
							<hr />
							<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
						</div>
					</div>
					
					
					
					<div class="class-view-minibox swiper-slide">
						<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
						<div class="class-minibox-info">
							<span class="class-minibox-cartegory">요리</span><br />
							<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
							<hr />
							<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
						</div>
					</div>
					<div class="class-view-minibox swiper-slide">
						<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
						<div class="class-minibox-info">
							<span class="class-minibox-cartegory">요리</span><br />
							<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
							<hr />
							<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
						</div>
					</div>
					<div class="class-view-minibox swiper-slide">
						<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
						<div class="class-minibox-info">
							<span class="class-minibox-cartegory">요리</span><br />
							<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
							<hr />
							<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
						</div>
					</div>
					<div class="class-view-minibox swiper-slide">
						<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
						<div class="class-minibox-info">
							<span class="class-minibox-cartegory">요리</span><br />
							<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
							<hr />
							<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
						</div>
					</div>
					<div class="class-view-minibox swiper-slide">
						<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
						<div class="class-minibox-info">
							<span class="class-minibox-cartegory">요리</span><br />
							<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
							<hr />
							<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
						</div>
					</div>
					<div class="class-view-minibox swiper-slide">
						<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
						<div class="class-minibox-info">
							<span class="class-minibox-cartegory">요리</span><br />
							<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
							<hr />
							<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
						</div>
					</div>
					<div class="class-view-minibox swiper-slide">
						<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
						<div class="class-minibox-info">
							<span class="class-minibox-cartegory">요리</span><br />
							<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
							<hr />
							<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
						</div>
					</div>
					<div class="class-view-minibox swiper-slide">
						<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
						<div class="class-minibox-info">
							<span class="class-minibox-cartegory">요리</span><br />
							<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
							<hr />
							<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
						</div>
					</div>
					<div class="class-view-minibox swiper-slide">
						<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
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

			<h3>지금 인기 top10</h3>
			<hr />
			<div class="class-view-box">
				<div class="class-view-minibox">
					<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
					<div class="class-minibox-info">
						<span class="class-minibox-cartegory">요리</span><br />
						<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
						<hr />
						<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
					</div>
				</div>
				<div class="class-view-minibox">
					<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
					<div class="class-minibox-info">
						<span class="class-minibox-cartegory">요리</span><br />
						<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
						<hr />
						<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
					</div>
				</div>
				<div class="class-view-minibox">
					<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
					<div class="class-minibox-info">
						<span class="class-minibox-cartegory">요리</span><br />
						<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
						<hr />
						<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
					</div>
				</div>
				<div class="class-view-minibox">
					<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
					<div class="class-minibox-info">
						<span class="class-minibox-cartegory">요리</span><br />
						<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
						<hr />
						<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
					</div>
				</div>
			</div>
			<h3>신규 클래스</h3>
			<hr />
			<div class="class-view-box">
				<div class="class-view-minibox">
					<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
					<div class="class-minibox-info">
						<span class="class-minibox-cartegory">요리</span><br />
						<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
						<hr />
						<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
					</div>
				</div>
				<div class="class-view-minibox">
					<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
					<div class="class-minibox-info">
						<span class="class-minibox-cartegory">요리</span><br />
						<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
						<hr />
						<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
					</div>
				</div>
				<div class="class-view-minibox">
					<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
					<div class="class-minibox-info">
						<span class="class-minibox-cartegory">요리</span><br />
						<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
						<hr />
						<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
					</div>
				</div>
				<div class="class-view-minibox">
					<div class="class-minibox-img"><img src="img/banner3.jpg" /></div>
					<div class="class-minibox-info">
						<span class="class-minibox-cartegory">요리</span><br />
						<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
						<hr />
						<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
					</div>
				</div>
			</div>
		</section>
		
		<script>
			var asd = document.getElementById("k_name");
			asd.innerHTML = sessionStorage.getItem('k_name');
		</script>

		<footer>
			<div class="footer-menu">
				<div>
					<div>팀 이름 정해용</div>
					<a> 홈 </a>
				</div>
				<div>
					<div>크리에이터</div>
					<a>지원하기</a>
				</div>
			</div>

			<div class="footer-copyright">
				<div>
					이용약관 | 개인정보처리방침 | 사업자 정보 확인 | 제휴/협력 문의<br />
					단체/기업 교육 문의 | 정기구독 서비스 이용약관
				</div>
				<div>
					(주)클래스101 | 대표 고지연 | 서울특별시 중구 통일로 10 세브란스빌딩 18층 | 사업자등록번호 : 457-81-00277 | 통신판매업신고 : 2019-서울중구-0087 | 주식회사 클래스101은 전자상거래 등에서의 소비자보호에 관한 법률에 따른 통신판매업과
					통신판매중개업을 영위하고 있습니다. 주식회사 클래스101은 통신판매중개자로서 중개하는 통신판매에 관하여서는 통신판매의 당사자가 아니므로 어떠한 책임도 부담하지 아니합니다.
				</div>
			</div>
		</footer>
	</body>
</html>
