<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
    <title>Document</title>
    <style>
        /* 공통옵션 */


/* 페이지 */
.page_wrap {
   text-align:center;
   font-size:0;
 }
.page_nation {
   display:inline-block;
}
.page_nation .none {
   display:none;
}
.page_nation a {
   display:block;
   margin:0 3px;
   float:left;
   border:1px solid #e6e6e6;
   width:28px;
   height:28px;
   line-height:28px;
   text-align:center;
   background-color:#fff;
   font-size:13px;
   color:#999999;
   text-decoration:none;
}
.page_nation .arrow {
   border:1px solid #ccc;
}
.page_nation .pprev {
   background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
   margin-left:0;
}
.page_nation .prev {
   background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
   margin-right:7px;
}
.page_nation .next {
   background:#f8f8f8 url('img/page_next.png') no-repeat center center;
   margin-left:7px;
}
.page_nation .nnext {
   background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
   margin-right:0;
}
.page_nation a.active {
   background-color:#42454c;
   color:#fff;
   border:1px solid #42454c;
}

ul li {list-style:none; }
.fl {float:left; }
.tc {text-align:center; }

/* 게시판 목록 */
.board {width: 950px; }
.w70 {width:70px; }
.w500 {width:500px; }
.w120 {width:120px; }
.w100 {width:100px; }
        .title {
   height: 50px;
   line-height: 50px;
   background:skyblue;
   font-weight: bold;
}
.t_line {border-right:solid 1px gray;}
.lt_line {border-bottom:solid 1px gray;}
.list {
   height: 40px;
   line-height: 40px;
   background: #f3f3f3;
}

    </style>
</head>
<body>
    
    <section style="margin:300px;">
        <div class="board-body">
        
            <div class="board-box">
          
          <!--form select를 가져온다 -->
                    <form action="ReviewBoard">
                <div class="search-wrap">
                   <span>총${ReviewPageVO.total }개</span>
                
                  <button type="submit" class="btn btn-info search-btn">검색</button>
                       <input type="text" class="form-control search-input" name="searchName" value="${pageVO.cri.searchName }" >
                       <select class="form-control search-select" name="searchType">
                            <option value="content" ${ReviewPageVO.cri.searchType eq 'title' ? 'selected' : '' }>제목</option>
                            <option value="title" ${ReviewPageVO.cri.searchType eq 'satisfaction' ? 'selected' : '' } >번호</option>
                            <option value="writer" ${ReviewPageVO.cri.searchType eq 'writer' ? 'selected' : '' }>작성자</option>
                            <option value="titcont" ${ReviewPageVO.cri.searchType eq 'regdate' ? 'selected' : '' }>등록일</option>
                       </select>
                    </div>
                    
                    <input type="hidden" name="pageNum" value="1">
                    <input type="hidden" name="amount" value="${ReviewPageVO.cri.amount }">
                    
                </form>        
              
              <table class="table table-bordered">
               <thead>
                  <tr>
                     <th class="board-title">제목</th>
                     <th>작성자</th>
                     <th>별점</th>
                     <th>등록일</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="vo" items="${list}">
                     <tr>
                        <td><a href="ReviewDetail?rno=${vo.rno }">${vo.title}
                        </a></td>
                        <td>${vo.writer }</td>
                        <td>${vo.satisfaction }</td>
                        <td><fmt:formatDate value="${vo.regdate }"
                              pattern="yy-MM-dd hh:mm:ss" /></td>
                     </tr>

                  </c:forEach>
               </tbody>

            </table>
                
                     <!--페이지 네이션을 가져옴-->
               <form action="ReviewBoard" name="pageForm">
                  <div class="text-center">
                     <hr>
                     <ul class="pagination pagination-sm" id="pagination">
                        <c:if test="${ReviewPageVO.prev }">
                           <li><a href="#" data-pagenum="${ReviewPageVO.startPage-1 }">이전</a></li>
                        </c:if>

                        <c:forEach var="num" begin="${ReviewPageVO.startPage }"
                           end="${ReviewPageVO.endPage }">
                           <li class="${num == ReviewPageVO.pageNum ? 'active' : '' }"><a
                              href="#" data-pagenum="${num}">${num }</a></li>
                        </c:forEach>

                        <c:if test="${ReviewPageVO.next }">
                           <li><a href="#" data-pagenum="${ReviewPageVO.endPage+1 }">다음</a></li>
                        </c:if>

                     </ul>

                     <!-- 페이지 클릭시 숨겨서 보낼 값 -->
                     <input type="hidden" name="pageNum"   value="${ReviewPageVO.cri.pageNum }"> 
                     <input type="hidden" name="amount" value="${ReviewPageVO.cri.amount }">
                     <input type="hidden" name="searchType" value="${ReviewPageVO.cri.searchType }">
                     <input type="hidden" name="searchName" value="${ReviewPageVO.cri.searchName }">
                     <button type="button" class="btn btn-info" onclick="location.href='ReviewWrite' ">글쓰기</button>
                  </div>
               </form>
                

            </div>
            <!-- <div>
                <div class="page_wrap">
                    <div class="page_nation">
                       <a class="arrow pprev" href="#"></a>
                       <a class="arrow prev" href="#"></a>
                       <a href="#" class="active">1</a>
                       <a href="#">2</a>
                       <a href="#">3</a>
                       <a href="#">4</a>
                       <a href="#">5</a>
                       <a href="#">6</a>
                       <a href="#">7</a>
                       <a href="#">8</a>
                       <a href="#">9</a>
                       <a href="#">10</a>
                       <a class="arrow next" href="#">></a>
                       <a class="arrow nnext" href="#">>></a>
                    </div>
                 </div>
            </div> -->
        </div>
    </section>
   
<script>
      window.onload = function() {//화면 로딩이 끝난 직후에 실행
         
         //기록이 변경 되었다면, 함수 종료
         if(history.state === '') {
            return; 
         }
         var msg = '${msg}';
         if(msg !== '') {
            alert(msg);
            //(추가할데이터, 페이지제목, 변경할주소) - 기존기록을 삭제하고 새로운 기록을 추가
            //이렇게 추가된 데이터를 history.state 로 확인이 가능
            history.replaceState('', null, null); 
         }
         
         
      }
      
      //페이저
      /*
      1. 아래 페이지버튼을 a태그에서 ->폼 전송으로 변경
      2. Criteria에 검색 키워드를 추가
      3. 검색폼과, 페이지폼이 동일한 값을 가지고 넘어가도록 hidden값을 추가
      4. sql문을 동적쿼리로 변경, total sql문 동적쿼리로 변경
      5. pageVO에 검색키워드를 저장도록 처리
      6. 화면에서 페이지폼과 검색폼 select박스 키워드처리, input태그 키워드 처리
      7. 페이지를 이동하거나, 검색버튼을 클릭했을 때 검색조건이 유지되도록 처리
      */
      var pagination = document.getElementById("pagination");
      pagination.onclick = function() {
         event.preventDefault(); //버튼의 고유이벤트 속성 중지
         
         var value = event.target.dataset.pagenum; //클릭한 타겟의 데이터셋 
         document.pageForm.pageNum.value = value; //폼에 pageNum에 타겟값 저장
         document.pageForm.submit(); 
      }
      
      
      
      
      
      
   </script>

</body>
</html>