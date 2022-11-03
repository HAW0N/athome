<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPEhtml>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$("#btnSave").click(function(){
	var title=document.form1.title.value;
	if(title==""){
	alert("제목을입력하세요.");
	document.form1.title.focus();
	return;
	}
	document.form1.submit();
	});
});

</script>
<style>
.fileDrop{
width:600px; height:100px; border:1pxdottedgray; background-color:gray;
}
</style>
</head>
<body>
<a href="/listPage">게시판으로 돌아가기</a>
<h2>게시물작성</h2>
<form id="form1" name="form1" method="post" action="/insert.do">
<div><input name="title" id="title" size="80" placeholder="제목을입력하세요."></div>
<div style="width:800px">
<textarea rows="5"cols="80"id="contents"name="contents" placeholder="내용을입력하세요"></textarea>
</div>

<div style="width:700px;text-align:center;">
<button style="button" id="btnSave">확인</button>
</div>
</form>
</body>
</html>