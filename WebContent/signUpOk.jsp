<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="SignUpOk.do" method="POST" onsubmit="return signCheck();">
	아이디 : <input type="text" name="id" id="id" value="${sign.memberId}" readonly="readonly">
	비밀번호  : <input type="password" name="pw" id="pw" value="${sign.memberPw}" readonly="readonly">
	이름 : <input type="text" name="name" id="name" value="${sign.memberName}" readonly="readonly">
	생년월일 : <input type="text" name="birth" id="birth" value="${sign.memberBirth}" readonly="readonly">
	이메일  : <input type="text" name="email" id="email" value="${sign.memberEmail}" readonly="readonly">
	
	<input type="submit" value="회원가입" >
	<input type="reset" onclick="history.go(-1)">
</form>	

<script>
	function signCheck() {
		let siCheck = confirm("입력한 정보가 확실합니까?"); 
			if(siCheck){
				alert("회원가입을 축하합니다.");
			} else {
				alert("입력된 정보를 다시한번 확인해주시기 바랍니다.");
				return false;
			}
	}
</script>
</body>
</html>