<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>

/* 페이지 */
.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}
</style>
</head>
<body>

	<section style="margin: 300px;">
		<div class="board-body">
			<div class="board-box">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>번호</th>
							<th class="board-title">제목</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${enrollList}">
							<tr>
								<td>${vo.eno}</td>
								<td><a href="freeDetail?pno=${pno }&eno=${vo.eno }">${vo.title}
								</a></td>
								<td>${vo.writer }</td>
								<td><fmt:formatDate value="${vo.regdate }"
										pattern="yy-MM-dd hh:mm:ss" /></td>
							</tr>

						</c:forEach>
					</tbody>

				</table>
			</div>
			<div>
				<div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#"><<</a> <a class="arrow prev"
							href="#"><</a> <a href="#" class="active">1</a> <a href="#">2</a>
						<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a
							class="arrow next" href="#">></a> <a class="arrow nnext" href="#">>></a>
					</div>
				</div>
			</div>
		</div>


	</section>

</body>
</html>