<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        .fieldError {
            color: #bd2130;
        }
    </style>
<script>
        //회원가입 실패시 에러 메시지 출력
        $(document).ready(function(){
            var errorMessage = [[${errorMessage}]];
            if(errorMessage != null){
                alert(errorMessage);
            }
        });
</script>
<body>
	<form id="memberFormDTO"action="/members/new" method="post" >
        <div>
            <label for="name">이름</label>
            <input type="text" name="name" placeholder="이름을 입력해주세요">

        </div>
        <div>
            <label for="email">이메일주소</label>
            <input type="email" name="email" placeholder="이메일을 입력해주세요">
            
        </div>
        <div>
            <label for="password">비밀번호</label>
            <input type="password" name="password" placeholder="비밀번호를 입력해주세요">
            
        </div>
        <div>
            <label for="address">주소</label>
            <input type="text" name="address" placeholder="주소를 입력해주세요">
            
        </div>
        <div style="text-align:center">
            <button type="submit" >Submit</button>
            <button type="button" onclick="history.back();">Cancel</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>
</body>
</html>