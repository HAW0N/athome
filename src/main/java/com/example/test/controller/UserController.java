package com.example.test.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.test.model.UserDAO;
import com.example.test.model.UserDTO;

@Controller

public class UserController{
	@Inject
	UserDAO userDao;
	@RequestMapping("member/login.do")
	public String login(){
		return"member/login";//login.jsp페이지로이동
	}
	@RequestMapping("member/login_check.do")
	public ModelAndView login_check(UserDTO dto,HttpSession session){
		String name=userDao.login(dto);//로그인체크
		ModelAndView mav=new ModelAndView();
		if(name!=null){//로그인성공하면세션변수등록
			session.setAttribute("userid",dto.getUserid());
			session.setAttribute("name",name);
			mav.setViewName("redirect:/");//main.jsp로이동
		}else{//로그인실패하면
			mav.setViewName("member/login"); // login.jsp로 이동
			mav.addObject("message","error");
		}
		return mav;
	}
	@RequestMapping("member/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav){
		session.invalidate();
		mav.setViewName("redirect:/");
		mav.addObject("message","logout");
		return mav;
	}
}
