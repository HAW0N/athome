package com.example.test.controller;

import java.util.Enumeration;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.test.domain.Page;
import com.example.test.model.BoardDTO;
import com.example.test.service.BoardService;
import com.example.test.service.MemberService;



@Controller
public class BoardController{
	@Inject
	BoardService boardService;
	@Inject
	MemberService memberService;
	@RequestMapping("write.do")
	public String write(HttpSession session){
		
		System.out.println("--------------log-------------");
		Enumeration<?> attrName = session.getAttributeNames();
		while (attrName.hasMoreElements()) {
		    String attr = (String) attrName.nextElement();
		    System.out.println(session.getAttribute(attr));
		    
		}
		System.out.println("--------------log-------------");
		return "board/write";
	}
	@RequestMapping("insert.do")
	public String insert(BoardDTO dto,HttpSession session, MemberService memberService){
		String writer=(String)session.getAttribute("username");
		System.out.println("--------------log1-------------");
		dto.setWriter(writer);
		System.out.println("--------------log2-------------");
		boardService.insert(dto);
		System.out.println("--------------log3-------------");
		return "redirect:/listPage";
	}
	
	
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String getListPage(Model model, @RequestParam(value = "num", defaultValue = "1") int num) throws Exception {
		System.out.println("-------- value " + num);
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(boardService.count());  

		List<BoardDTO> list = null; 
		list = boardService.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   

		
		model.addAttribute("page",page);
		model.addAttribute("select", num);
		
		return "/board/listPage";
	}

	
	
	
	
	@RequestMapping("board/detail.do")
	public ModelAndView detail(int idx){
	boardService.increase_hit(idx);//조회수증가처리
	ModelAndView mav=new ModelAndView();
	mav.setViewName("board/view");
	mav.addObject("dto",boardService.detail(idx));

	
	return mav;
	}
	
	
	
	
	@RequestMapping("update.do")
	public String update(BoardDTO dto){
		boardService.update(dto);
		return "redirect:/listPage";
	}
	@RequestMapping("delete.do")
	public String delete(int idx){
		boardService.delete(idx);
		return "redirect:/listPage";
	}
}