<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Insert title here</title>

<script>
	 function loginCheck() {
		 httpRequest = new XMLHttpRequest();
		 let id = document.getElementById("user_id").value;
		 let pw = document.getElementById("user_pw").value;
		 let param = "id="+id+"&pw="+pw;
		 
		 function callbackFunction(){
			 if(httpRequest.readyState == 4) {
				 let resultText = httpRequest.responseText;
				 
				 if(resultText == 1){
					 alert("성공적으로 로그인 했습니다.");
					 location.href="main.do";
					 console.log(resultText);
				 } else if(resultText == 0){
					 alert("데이터베이스 오류 입니다.");
					 console.log(resultText);
				 } else if(resultText == 2){
					 alert("아이디 또는 비밀번호가 틀립니다.");
					 console.log(resultText);
				 }
			 }
		 }
		 
		 httpRequest.onreadystatechange = callbackFunction;
		 httpRequest.open("POST","login.do",true);
		 httpRequest.setRequestHeader('Content-Type','application/x-www-form-urlencoded;charset=EUC-KR');
		 httpRequest.send(param);
		 
	 }
</script>
</head>
<body class="text-center">
	<a href="main.do">메인으로 가기</a>
		<input type="text"  id="user_id"> 
		<input type="password"  id="user_pw"> 
		<button onclick="loginCheck();"> 로그인 </button>
<div class="success">
	아이디가 없으세요?<button onclick="location.href='signUp.jsp'">회원가입</button>
</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>

</html>