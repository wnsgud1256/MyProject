<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navar-light bg-light line">
		<a class="navbar-brand ap" href="main.do?page=1">
			<i class="fas fa-cannabis">Park Project</i>
			
		</a>
	
	<a>
			<c:choose>
				<c:when test="${sessionid != null}">
					
					<form action="logOut.do" method="Post">
					어서오세요${sessionid}님
						<input type="submit" value="로그아웃" class="btn btn-outline-success">
					</form>
				</c:when>
				<c:otherwise>
					<button class="btn btn-outline-success" onclick="location.href='Login.jsp'">로그인 페이지로 이동</button>
				</c:otherwise>
			</c:choose>
	</a>
</nav>			
			<br/>