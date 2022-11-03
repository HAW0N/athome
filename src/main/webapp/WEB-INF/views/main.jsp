<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>게시판</title>
	
</head>
<body>

<div class="wrap">
	<div class="header">
	<h1>
		<a href="/">메인</a> 
	</h1>
		<div class="menu">
		<a href="/listPage">게시판</a>
			
		
<c:choose>
	<c:when test="${sessionScope.userid == null }">
		<a href="/member/login.do">로그인</a>
		<a href="/member/write.do">회원가입</a>
	</c:when>
	<c:otherwise>
	${sessionScope.name}님이로그인중입니다.
		<a href="/member/logout.do">로그아웃</a>
	</c:otherwise>
</c:choose>

			
		</div>
	</div>
	<div class="body"></div>
	<div class="footer"></div>
</div>

</body>
</html>