<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/all.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
</head>
<body>
    <section>
        <div class="board-title">
            <span class="board-title-span">${enrollBoardVO.title }</span>
        </div>
        <hr>
        <c:forEach var="i" begin="0" end="${fn:length(enrollBoardVO.fileNameList) - 1}">
        
        <div class="board-content">
        	<div class="img-box">
        		<img src="EnrollBoardImg?eno=${enrollBoardVO.eno }&fileName=${enrollBoardVO.fileNameList[i]}">
        	</div>
            <span class="board-content-span">${enrollBoardVO.contentList[i]}</span>
        </div>
        </c:forEach>
        <div class="board-detail-btns">
            <button type="button" class="point-btn" id="modifyBtn">수정하기</button>
            <button type="button" id="deleteBtn">삭제하기</button>
            <button type="button" id="listBtn">목록으로</button>
        </div>
    </section>
    
   	<script>
   		$(document).ready(function(){
   			let modifyBtn = $("#modifyBtn")
   			let deleteBtn = $("#deleteBtn")
   			let listBtn = $("#listBtn")
   			
   			
   			modifyBtn.click(function(){
   				location.href="/EnrollBoardModify?eno=${enrollBoardVO.eno}";
   			})
   			
   			deleteBtn.click(function(){
   				if(confirm("게시물을 비공개처리 하시겠습니까?")){
   					
   				} else{
   					return;
   				}
   			})
   			
   			listBtn.click(function(){
   				location.href="/EnrollBoard?eno=${enrollBoardVO.eno}&pno=${enrollBoardVO.pno}";
   			})
   		})
   	</script>
</body>
</html>