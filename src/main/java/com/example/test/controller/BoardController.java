package com.example.test.controller;

import java.util.Enumeration;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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



@Controller()

public class BoardController{
	@Inject
	BoardService boardService;
	@RequestMapping("write.do")
	public String write(HttpSession session){
		
		Enumeration<?> attrName = session.getAttributeNames();
		while (attrName.hasMoreElements()) {
		    String attr = (String) attrName.nextElement();
		    System.out.println(session.getAttribute(attr));
		}
		return "board/write";
	}
	@RequestMapping("insert.do")
	public String insert(BoardDTO dto,HttpServletRequest request,String writer){
		//String writer=(String)session.getAttribute("email");
		//HttpSession session = request.getSession();
//		String writer=(String)session.getAttribute("Username");
		System.out.println(writer);
		
		dto.setWriter(writer);
		System.out.println(dto.toString());
		boardService.insert(dto);
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