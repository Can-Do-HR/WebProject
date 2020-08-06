
$(document).ready(function(){

	//섬네일 클릭시 파일 업로드 뜨게함
	let lectureInfoImg =  $(".lecture-info-img-input")
	$(".lecture-thumbnail-img").click(function(){
		lectureInfoImg.click();
	})

	lectureInfoImg.change(function(){
		const img = lectureInfoImg
		uploadImgPreview(img)

	})

	// $(".lecture-cover-img").click(function(){
	//     $(".lecture-cover-img-input").click();
	// })

	let qnaBoxNum = 1;
	let contentBoxNum = 1;

	//qna버튼 추가
	$("#qnaAddBtn").click(function(){
		if($('.qna-box-space').children().length > 4){
			alert('질문은 4개까지만 추가 가능합니다');
			return;
		}
		const qnabox = createQNA(qnaBoxNum);
		qnabox.insertBefore($(event.target).parent());
		qnaBoxNum++;
		// $('.qna-box-space').append(qnabox);
	})

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


function createQNA(num){
	const qnabox = $('<div>').attr('class', 'qna-box')
	//질문input생성
	const qInput = $('<div>').text('Q : ')
	.append($('<input>')
			.attr({'type':'text', 'placeholder':'질문을 적어주세요.', 'name':'qnAList[' + num + '].qBox'})
	)
	//답변input생성
	const aInput =  $('<div>').text('A : ')
	.append($('<input>')
			.attr({'type':'text', 'placeholder':'답변을 적어주세요.', 'name':'qnAList[' + num + '].aBox'})
	)                            
	qnabox.append(qInput).append(aInput)

	return qnabox;

}

function uploadImgPreview(input){
}