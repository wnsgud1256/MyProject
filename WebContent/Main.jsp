<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Insert title here</title>

</head>
<body>
	<jsp:include page="header.jsp" />


	<div class="container" id="contents">
		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="image/1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/3.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<div class="row">
			<table class="table table-bordered text-center" style="margin-top: 50px">
				<thead class="thead-dark">
					<tr>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일자</th>
						<th>최근에 수정된 시간</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="board">
						<tr>
							<td>${board.boardWriter}</td>
							<td><a href="oneselect.do?number=${board.boardNumber}">${board.boardTitle}</a></td>
							<td>${board.boardDate}</td>
							<td><c:if test="${board.boardLmd == null}">없음</c:if>${board.boardLmd}</td>
							<td>${board.boardCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${sessionid != null}">
				
				<button class="btn btn-info pull-right" onclick="location.href='boardInsert.jsp'">글쓰기</button>

			</c:if>
		</div>
		
		<div>
			<ul class="pagination justify-content-center">
				<li class="page-item">
				<a class="page-link" href="main.do?page=${page=1}">
					<i class="fas fa-angle-double-left"></i>
				</a>
				</li>
				<c:if test="${startPage > 1 }"> <!-- startPage가 1보다 클때만 활성화. 즉 6페이지 이상부터 활성화됨. -->
					<li class="page-item">
					<a class="page-link" href="main.do?page=${startPage-1}">
						<i class="fas fa-angle-left"></i>
					</a></li>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
					<li id="page${i}" class="page-item">
						<a class="page-link" href="main.do?page=${i}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${endPage < totalPage }"> <!-- endPage가 총 페이지보다 작을때만 활성화. 즉 총 페이지가 블럭이 끝나는 페이지보다 클때 해당 if문이 쓰임. -->
				<li class="page-item">
				<a class="page-link" href="main.do?page=${endPage+1}">
					<i class="fas fa-angle-right"></i>
				</a></li>
				</c:if>
				<li class="page-item">
					<a class="page-link" href="main.do?page=${page=totalPage}">
						<i class="fas fa-angle-double-right"></i>
					</a>
				</li>
			</ul>
		</div>
	</div>

	
	<jsp:include page="bootstrap4.jsp" />

	<jsp:include page="footer.jsp" />
	<script>
	$(function(){
		var urr = location.href;
		var insertUrl ='boardinsert.do'; //해당 url로 접속시
		var changeUrl='main.do?page=1';//변경할 url
		//insert작업이 이루어진후 새로 고침을 하면 재목과 내용이 null값인 상태로 계속 삽입이 되는데
		//그 부분을 막기 위해 새로고침을해도 삽입이 되지 않게 할려고 만듬.
		if(urr.match(insertUrl)){
			window.location.replace(urr.replace(insertUrl,changeUrl));
		}else{
			
		}
		$.urlParam = function(name){
		    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
		    if (results==null){ //?와&를 사용하지 않아서 넘어온 파라미터 값이 없을때의 null 값처리
		        return null;
		     }
		     else{
		        return results[1] || 0;
		     }
		 }
		
		
		
		console.log($.urlParam('page'));


/* 		var url = window.location.search.substring(1).split('=')[0];//window.location은 url을 가져오고 search를 쓰면 ?전까지 url을지우고 파라미터만 가지고옴
		var url2 = window.location.search.substring(1).split('=')[1]; //split로 =을 사용하는 파라미터의 값을 가져옴.
		console.log(url) */;
		$("#page"+$.urlParam('page')).addClass('active');
	});
	</script>
</body>
</html>