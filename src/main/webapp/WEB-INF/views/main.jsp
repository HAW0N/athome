<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

			


	<sec:authorize access="isAnonymous()">
		<a href="/members/login">로그인</a>
		<a href="/members/new">회원가입</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<a href="/members/logout">로그아웃</a>
	</sec:authorize>

			
		</div>
	</div>
	<div class="body"></div>
	<div class="footer"></div>
</div>

</body>
</html>