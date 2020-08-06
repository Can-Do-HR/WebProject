<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <form action="CreatorBoardRegist" method="POST" name="creatorRegForm" style="margin:300px;">
                <div class="input-box">
                    <input type="text" placeholder="">
                </div>
                <div class="summary-box-space">
                    <div class="lecture-summary">
                        <div class="lecture-summary-img">
                        </div>
                        <input type="file"  name="ContentImg">
                        <textarea cols="30" rows="7" name="ContentList[0].ContentTextBox"></textarea>
                    </div>
                    <div class="add-write-button">
                        <button id="summatyAddBtn" type="button">추가하기</button>
                    </div>
                </div>
    
                <div class="form-btn-box">
                    <button type="button" id="" class="point-btn">작성하기</button>
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
    	const textArea = $('<textarea>').attr({'cols':'30', 'rows':'7', 'name': 'ContentList[' + num + '].ContentTextBox'});

    	
    	
    	summaryBox.append(imgArea)
    	.append($('<input>').attr({'type': 'file',  'name': 'ContentImg'}))
    	.append(textArea);
    	return summaryBox;
    }
    </script>
</body>
</html>