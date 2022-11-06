<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
			<sec:authorize access="isAnonymous()">
				<a href="/members/login">로그인</a>
				<a href="/members/new">회원가입</a>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<a href="/members/logout">로그아웃</a>
			</sec:authorize>
		</div>
		<h2>게시판</h2>

		<div class="container">

			<sec:authorize access="isAuthenticated()">
				<button type="button" id="btnWrite">글쓰기</button>
			</sec:authorize>
			<table class="QA" width="600px">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="row" items="${list}">
					<tr>
						<td>${row.idx}</td>
						<td><a href="board/detail.do?idx=${row.idx}">${row.title}</a></td>
						<td>${row.writer}</td>
						<td><fmt:formatDate value="${row.regdate}"
								pattern="yyyy-MM-dd  HH:mm" /></td>
						<td>${row.hit}</td>
					</tr>
				</c:forEach>


			</table>
			<div>
				<c:if test="${page.prev}">
					<span>[ <a href="/listPage?num=${page.startPageNum - 1}">이전</a></span>
						] 
				</c:if>

				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
					var="num">
					<span> <c:if test="${select != num}">
							<a href="/listPage?num=${num}">${num}</a>
						</c:if> <c:if test="${select == num}">
							<b>${num}</b>
						</c:if>
					</span>
				</c:forEach>

				<c:if test="${page.next}">
					<span>[ <a href="/listPage?num=${page.endPageNum + 1}">다음</a></span>
						] 
				</c:if>
			</div>



		</div>
	</div>
</body>
</html>