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
$(function(){
	$("#btnList").click(function(){
		location.href="/board/listPage";
	});
	$("#btnUpdate").click(function(){
		var str="";
	$("#form1").append(str);
	document.form1.action="update.do";
	document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="delete.do";
			document.form1.submit();
			}
		});
	});

</script>
</head>
<body>

	<a href="/listPage">게시판으로 돌아가기</a>
	<h2>게시물보기</h2>
	<form id="form1" name='form1' method="post">
		<div>
			작성일자 :
			<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-ddaHH:mm:ss" />
		</div>
		<div>조회수 : ${dto.hit}</div>
		<div>이름 : ${dto.writer}</div>
		<div>
			제목 : <input name="title" value="${dto.title}">
		</div>
		<div style="width: 80%">
			내용 :
			<textarea rows="3" cols="80" name="contents" id="contents">${dto.contents}</textarea>
		</div>
		<div>
			<input type="hidden" name="idx" value="${dto.idx}">
			<c:if test="${sessionScope.userid==dto.writer}">
				<button type="button" id="btnUpdate">수정</button>
				<button type="button" id="btnDelete">삭제</button>
			</c:if>

		</div>
	</form>

</body>
</html>