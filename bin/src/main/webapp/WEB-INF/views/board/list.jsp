<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#btnWrite").click(function() {
			location.href = "/write.do";
		});
	});
	
</script>
</head>
<body>
	<div class="wrap">

		<h1>
			<a href="/">메인</a>
		</h1>
		<div class="header">
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
		<h2>게시판</h2>

		<div class="container">

			<c:if test="${sessionScope.userid != null}">
				<button type="button" id="btnWrite">글쓰기</button>
			</c:if>

			<table class="QA" width="600px">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="row" items="${map.list}">
					<tr>
						<td>${row.idx}</td>
						<td><a href="/detail.do?idx=${row.idx}">${row.title}</a></td>
						<td>${row.writer}</td>
						<td><fmt:formatDate value="${row.regdate}"
								pattern="yyyy-MM-dd  HH:mm" /></td>
						<td>${row.hit}</td>
					</tr>
				</c:forEach>


			</table>



		</div>
	</div>
</body>
</html>