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

	document.getElementById("searchBtn").onclick = function() {

		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;

		console.log(searchType)
		console.log(keyword)
	};

	location.href = "/listPageSearch?num=1" + "&amp;searchType=" + searchType
			+ "&amp;keyword=" + keyword;
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
			<div>
				<select name="searchType">
					<option value="title"
						<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
					<option value="contents"
						<c:if test="${page.searchType eq 'contents'}">selected</c:if>>내용</option>
					<option value="title_contents"
						<c:if test="${page.searchType eq 'title_contents'}">selected</c:if>>제목+내용</option>
					<option value="writer"
						<c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
				</select> <input type="text" name="keyword" value="${page.keyword}" />

				<button type="button" id="searchBtn">검색</button>
			</div>

		</div>
	</div>
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
				<td><a href="/detail.do?idx=${row.idx}">${row.title}</a></td>
				<td>${row.writer}</td>
				<td><fmt:formatDate value="${row.regdate}"
						pattern="yyyy-MM-dd  HH:mm" /></td>
				<td>${row.hit}</td>
			</tr>
		</c:forEach>


	</table>
	<div>
		<c:if test="${page.prev}">
			<span><a
				href="/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>

			</span>
		</c:if>

		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
			var="num">
			<span> <c:if test="${select != num}">
					<a href="/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${page.next}">
			<span><a
				href="/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>

			</span>
		</c:if>
	</div>




</body>
</html>