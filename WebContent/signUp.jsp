<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name="userInfo" method="post" action="SignUp.do" onsubmit="return checkValue();">
<table>
	<tr>
		<th>아이디</th> 
		<td><input type="text" name="id" onkeydown="inputIdChk();">
		<input type="button"  value="중복확인 " onclick="openIdChk();">
		<input type="hidden" name="idVal" value="idNoCheck">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th> 
		<td><input type="password" name="pw" id="pw"></td>
	</tr>
	<tr>
		<th>비밀번호 확인 </th>
		<td><input type="password" id="pwCheck"></td>
	</tr>
	<tr>
		<th>이름</th> 
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>생년월일</th> 
		<td><input type="text" name="birth" placeholder="ex)20001030"></td>
	</tr>
	<tr>
		<th>이메일</th> 
		<td><input type="text" name="email"></td>
	</tr>
</table>
	<input type="submit" value="가입">
	<input type="reset" value="취소" onclick="location.href='Login.jsp'">
</form>
<script>
	function checkValue() {
		let form = document.userInfo;
		let emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let Check = /^[a-zA-Z0-9]{4,12}$/; // 아이디 비번유효성 검사 정규식
		let birthCheck =/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		
		
		if(!form.id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(form.idVal.value !="idCheck"){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		if(!Check.test(form.id.value)){
			alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력 해주세요.")
			return false;
		}
		if(!form.pw.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if(!Check.test(form.pw.value)){
			alert("비밀번호는  4~12자의 영문 대소문자와 숫자로만 입력 해주세요.")
			return false;
		}
		if(form.pw.value != form.pwCheck.value){
			alert("비밀번호와 비밀번호확인란을 동일하게 입력하세요.");
			return false;
		}
		if(!form.name.value){
			alert("이름을 입력하세요.");
			return false;
		}
		if(form.email.value==""){
			alert("이메일을 입력해 주세요.");
			return false;
		}
		if(!emailCheck.test(form.email.value)){
			alert("적합하지 않은 이메일 형식입니다.");
			return false;
		}
		if(isNaN(form.birth.value)){
			alert("생년월일의 양식에 맞지 않습니다. ex)2000년 10월 30일생  ->20001030");
			return false;	
		}if(!birthCheck.test(form.birth.value)){
			alert("생년월일의 양식에 맞지 않습니다. ex)2000년 10월 30일생  ->20001030");
			return false;
		} 
	
	}
	function openIdChk(){
		window.name = "parentForm"; //부모창 이름
		window.open("idCheckForm.jsp","checkForm","width=500, height=300 resizable=no, scrollbars=no");
	}
	function inputIdChk(){ //아이디 중복체크 여부
		document.userInfo.idVal.value ="idNoCheck";
	}
	
</script>
</body>
</html>