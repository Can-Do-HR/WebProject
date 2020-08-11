<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/all.css">
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/ReviewDetailUtil.js"></script>
<%-- <link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/star.css"> --%>
   
</head>
<body>
   <section style="margin: 300px;">
      <div class="board-title">
         <span class="board-title-span">제목제목</span>
      </div>
      <!--    <div class="board-star">
         별별별
         alternate codepen version https://codepen.io/mad-d/pen/aJMPWr?editors=0010
         <h1>Star Rating System</h1>
         <div class="stars" data-rating="3">
            <span class="star">&nbsp;</span> <span class="star">&nbsp;</span> <span
               class="star">&nbsp;</span> <span class="star">&nbsp;</span> <span
               class="star">&nbsp;</span>
         </div>

      </div> -->
      <!-- <hr> -->
      <form action="ReviewModify" method="post">
         <div class="board-content">
            <div>
               <label>DATE</label>
               <p>
                  <fmt:formatDate value="${reviewVO.regdate }" pattern="yyyy-MM-dd" />
               </p>
            </div>
            <div class="form-group">
               <label>번호</label> <input class="form-control" name='rno'
                  value="${reviewVO.rno }" readonly>
            </div>
            <div class="form-group">
               <label>작성자</label> <input class="form-control" name='writer'
                  value="${reviewVO.writer }" readonly>
            </div>

            <div class="form-group">
               <label>내용</label>
               <textarea class="form-control" rows="10" name='content' readonly>${reviewVO.content }</textarea>
            </div>
            <div class="form-group">
               <label>별점</label> <input class="form-control" name='satisfaction'
                  value="${reviewVO.satisfaction }" readonly>
            </div> 
            
         </div>
         <div class="board-detail-btns">
            <button type="button" class="point-btn" id="reviewModifyBtn">수정하기</button>
            <button type="button" href="ReviewBoard">목록으로</button>
         </div>
      </form>
   </section>
   <%-- <script src="${pageContext.request.contextPath}/js/stars.js"></script> --%>
</body>
</html>