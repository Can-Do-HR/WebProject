<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/all.css">
</head>
<body>
    <section>
        <div class="form-box">
            <form action="EnrollBoardRegist" enctype="multipart/form-data" method="POST" name="creatorRegForm" style="margin:300px;">
            	<input type="text" disabled="disabled" name="pno" value="${pno }">
                <div class="input-box">
                    <input type="text" placeholder="제목을 적어주세요" name="title">
                </div>
                
                
                <div class="summary-box-space">
                    <div class="lecture-summary">
                        <div class="lecture-summary-img">
                        </div>
                        <input type="file"  name="contentImg">
                        <textarea cols="30" rows="7" name="enrollBoardList[0].contentText"></textarea>
                    </div>
                    <div class="add-write-button">
                        <button id="summatyAddBtn" type="button">추가하기</button>
                    </div>
                </div>
    
    
                <div class="form-btn-box">
                    <button type="submit" class="point-btn">작성하기</button><!-- TODO: 수정하세요 -->
                    <button type="button" class="btn">목록으로</button>
                </div>
            </form>
        </div>
    
    </section>
    
    <script>
    $(document).ready(function(){

    	// $(".lecture-cover-img").click(function(){
    	//     $(".lecture-cover-img-input").click();
    	// })

    	let contentBoxNum = 1;

    	//소개버튼 추가
    	$("#summatyAddBtn").click(function(){
    		if($('.summary-box-space').children().length > 6){
    			alert('소개글은 6개까지만 추가 가능합니다');
    			return;
    		}
    		const summaryBox = createSummary(contentBoxNum);
    		summaryBox.insertBefore($(event.target).parent());
    		if($('.summary-box-space').children().length > 7){
    			$(event.target).remove('.add-write-button');

    		}
    		contentBoxNum++;
    		// $('.summary-box-space').append(summaryBox)
    	})
    	
    	

    })

    function createSummary(num){
    	const summaryBox = $('<div>').attr('class', 'lecture-summary');
    	const imgArea = $("<div>").attr('class', 'lecture-summary-img');
    	const textArea = $('<textarea>').attr({'cols':'30', 'rows':'7', 'name': 'enrollBoardList[' + num + '].contentText'});

    	
    	
    	summaryBox.append(imgArea)
    	.append($('<input>').attr({'type': 'file',  'name': 'contentImg'}))
    	.append(textArea);
    	return summaryBox;
    }
    </script>
</body>
</html>