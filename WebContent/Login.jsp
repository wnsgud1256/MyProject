<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css/login.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/header.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/footer.css?ver=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<title>Insert title here</title>
<script>
$(document).ready(function(){
	$("#loginBtn").click(function(){
		let id = $("#user_id").val();
		let pw = $("#user_pw").val();
		$.ajax({
			type:"POST",
			url:"login.do",
			data:{"id" : id,
				  "pw" : pw
				 },
				 success:function(res){
					 if(res == 1){
						 location.href="main.do?page=1";
						alert("성공적으로 로그인 했습니다.");
					 } else if(res == 0){
						 alert("데이터베이스 오류입니다.")
					 } else if(res == 2){
						 alert("아이디나 비밀번호가 틀립니다.")
					 }
				 },
				 error:function(){
					 alert("에러입니다.")
				 }
		});
		
	})
});
/* function Loginfun(){ //자바스크립트용 로그인 아작스
		httpRequest = new XMLHttpRequest();
		 let id = document.getElementById("user_id").value;
		 let pw = document.getElementById("user_pw").value;
		 let param = "id="+id+"&pw="+pw;
		 
		 function callbackFunction(){
			 if(httpRequest.readyState == 4) {
				 let resultText = httpRequest.responseText;
				 
				 if(resultText == 1){
					 alert("성공적으로 로그인 했습니다.");
					 location.href="main.do?page=1";
					 console.log(resultText);
				 } else if(resultText == 0){
					 alert("데이터베이스 오류 입니다.");
					 console.log(resultText);
				 } else if(resultText == 2){
					 alert("아이디 또는 비밀번호가 틀립니다.");
					 console.log(resultText);
				 }
			 }
		 };
		 
		 httpRequest.onreadystatechange = callbackFunction;
		 httpRequest.open("POST","login.do",true);
		 httpRequest.setRequestHeader('Content-Type','application/x-www-form-urlencoded;charset=UTF-8');
		 httpRequest.send(param);
}; */
	 
</script>
</head>
<body class="text-center" id="wrap">
<jsp:include page="header.jsp"/>


<form>
	<svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
		<input type="text" id="user_id" autocomplete="off" placeholder="아이디를 적어주세요" >
		
		<input type="password"  id="user_pw" autocomplete="off" placeholder="비밀번호를 적어주세요" >	

<h4>아이디가 없으세요?</h4>
		<button class="btn btn-primary" id="loginBtn"> 로그인 </button>
		<input type="button" class="btn btn-primary" onclick="location.href='signUp.jsp'" value="회원가입">
	
</form>
	
			
		

	<jsp:include page="footer.jsp"/>
</body>

</html>