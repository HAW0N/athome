package com.example.test.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {
	
	

	
	 @Override
	    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
	        String username = request.getParameter("username");
		 	
	          // 로그인 실패 시 처리할 내용을 작성하여 확장할 수 있다.

	        response.sendRedirect("/members/login/error");     // 응답으로 리다이렉트를 보낸다.
	          // 이 예제에서는 간단히 failLogin.html로 리다이렉션을 해주었다.
	    }
	}