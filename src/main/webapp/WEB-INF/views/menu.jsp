<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<div class="tag">
<a href="list.do">게시판</a>


</div>
<div class="log">
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


</body>
</html>