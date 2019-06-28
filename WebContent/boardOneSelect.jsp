<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
html,body {height: 100%;}
</style>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Insert title here</title>
<script>
//TypeError : $ .ajax is not a function 에러가 계속 떳던 이유. jquery3.4.1.slim.min.js 제이쿼리 cdn중에서 ajax 모듈을 생략한 slime 경량 판이 저 코드다 slim 코드 때문에
//작동이 되지 않았던것. slim을 제거 후 경량판이 아닌 cdn을 쓰니 작동을 햇음.
	$(document).ready(function() {
		$("#CommantBtn").click(function(){
			let content = $("#commantText").val();
			let session = $("#sessionVal").val();
			let number = $("#boardNum").val();
			let lo = window.location;
			console.log(content);
			console.log(session);
			console.log(number);
			console.log(lo);
			
			$.ajax({
				type:"POST",
				url:"insertcommant.do",
				data:{ "Content" : content,
					    "Writer" : session,
					    "Number" : number
					 },
				success:function(res){
					location.reload();
				},
				error:function(){
					alert("에러입니다.");
				}
				
			});
		});
		
			function commantDel(){
				let CoNum = $("commantNum").val();
				$.ajax({
					type:"POST",
					url:"deletecommant.do",
					data:{ "CommantNum" : CoNum},
					success:function(res){
						location.reload();
					},
					error:function(){
						alert("에러떳습니다.");
					}
				});
			};
			
			function commantUpdate(){
				$.ajax({
					type:"POST",
					url:"updatecommant.do",
					data:{"Content" : content
						  "Number"},
					success:function(){
						location.reload();
					},
					error:function(){
						alert("에러뜸.");
					}
				});
			};
			function reCommant(){
				$.ajax({
					type:"POST",
					url:"recommant.do",
					data:{"Content" : content,
						  "Writer" : writer,
						  "Number" :number,
						  },
					success:function(){
						location.reload();
					},
					error:function(){
						alert("에러뜸");
					}
				});
			};
			function boardAction(value) {
				if(value == 0) 
					location.href="boardUpdate.do?number=${oneBoard.boardNumber}";
				else if(value == 1) {
				let delCheck = confirm("해당 글을 정말 삭제하시겠습니까?");
					if(delCheck) {
						alert("삭제되었습니다.");
						location.href="boardDelete.do?number=${oneBoard.boardNumber}&page=1";
					} else {
						alert("삭제가 취소 되었습니다.")
					}
				
				}
			};
			
		let changeStyle = $("#footer-basic"); //푸터 css 변경법
		changeStyle.css('position', 'relative');
	});
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container" style="margin:100px auto auto auto;">
<div class="row justify-content-md-center" style="margin-bottom:150px;">
<form>
	<table class="table table-sm">
		<tr>
			<th>작성자</th>
			<td>${oneBoard.boardWriter}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${oneBoard.boardCount}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${oneBoard.boardTitle}</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${oneBoard.boardDate}</td>
		</tr>
		<tr>
			<th>최근 수정된 날짜</th>
			<td><c:if test="${oneBoard.boardLmd == null}">없음</c:if>${oneBoard.boardLmd}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" cols="100" rows="10" placeholder="내용을 입력하세요" autocomplete="off" id="content" style="border:0;" readonly>${oneBoard.boardContent}</textarea></td>
		</tr>
	</table>
	
	<input type="button"class="btn btn-primary" onclick="location.href='main.do?page=1'" value="목록으로">
	<c:if test="${sessionid !=null && sessionid == oneBoard.boardWriter}">
	<input type="button" class="btn btn-success"value="글 수정" onclick="boardAction(0)" style="right:0; bottom:0; position:relative;">
	<input type="button" class="btn btn-danger" value="글 삭제" onclick="boardAction(1)">
	</c:if>
</form>
</div>
<!-- 댓글 쓰는곳 -->
<div class="row justify-content-md-center">
	<c:if test="${sessionid != null}">
	<textarea rows="5" cols="130" id="commantText"></textarea>
	<input type="button" class="btn btn-dark" value="댓글 쓰기" id="CommantBtn">
	</c:if>
</div>
<!-- 댓글을 보여주는 부분. -->
<div class="row justify-content-md-center" id="commantBox">
	<table class="table table-sm">
		<c:forEach items="${onecommantlist}" var="commant">
			<tr style="margin-left:${20*commant.commantRedepth}">
				<c:choose>
				<c:when test="${commant.commantReid == null}">
				<td>${commant.commantWriter}</td>
				</c:when>
				<c:otherwise>
				<td class="">${commant.commantReid}${commant.commantWriter}</td>
				</c:otherwise>
				</c:choose>
				<td class="CommantCon">${commant.commantContent}</td>
				<td>${commant.commantDate}</td>
				<td>
				<button onclick="commantDel();"></button>/<a onclick="commantUpdate">수정</a>/<a onclick="reCommant">댓글</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</div>
<input type="hidden" value="${sessionid}" id="sessionVal">
<input type="hidden" value="${param.number}" id="boardNum">
<input type="hidden" value="${commant.commantNumber}" id="commantNum">
	
	<jsp:include page="bootstrap4.jsp" />
	<jsp:include page="footer.jsp"/>
	
</body>
</html>