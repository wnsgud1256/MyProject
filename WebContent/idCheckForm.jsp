<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script>
$(document).ready(function() { 
	pValue();
			
			});
 function pValue(){
	 document.getElementById("userId").value = opener.document.userInfo.id.value;
 }
 
 window.onload = pValue;
</script>
</head>
<title>아이디중복체크</title>
<body>
	<div id="wrap">
		<br> <b><font size="4" color="gray">아이디 중복 체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="idinput" id="userId"> <input
					type="button" value="중복확인" onclick="idCheck()">
			</form>
			<div id="msg"></div>
			<br> <input id="cancelBtn" type="button" value="취소"
				onClick="window.close()"> <br> <input id="userBtn"
				type="button" value="사용하기" onClick="sendCheckValue()" style="visibility:hidden">
		</div>
	</div>
	<script>
		function idCheck(){
			let id = document.getElementById("userId").value;
			let valueCut = /^[a-zA-Z0-9]{4,12}$/;
			console.log(id);
			
			if(!valueCut.test(id)) {
				alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력 해주세요.");
				return false;
			} else {
				
				httpRequest = new XMLHttpRequest();
				let param = "id=" + id; //id를 하고 뒤에 =을 붙여야 id값이 제대로 입력이 되는상태가됨.
				httpRequest.onreadystatechange = callback;
				httpRequest.open("POST", "SignIdCheck.do", true);
				httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR');
				httpRequest.send(param);
			}
		}
		
		function callback(){
			if(httpRequest.readyState == 4){
				let resultText = httpRequest.responseText;
				if(resultText == 1){
					document.getElementById("userBtn").style.visibility='hidden';
					document.getElementById("msg").innerHTML ="중복된 아이디 입니다 다시 입력하세요";			}
				else if(resultText == 0){
					document.getElementById("cancelBtn").style.visibility='visible';
					document.getElementById("userBtn").style.visibility='visible';
					document.getElementById("msg").innerHTML ="사용 가능한 아이디 입니다.";
				}
			}
		}
		
		function sendCheckValue(){
			opener.document.userInfo.idVal.value="idCheck";
			opener.document.userInfo.id.value = document.getElementById("userId").value;
			
			if(opener != null){
				opener.checkForm = null;
				self.close();
			}
		}
	</script>
</body>
</html>
