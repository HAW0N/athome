package com.example.test.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.test.model.MemberDAO;
import com.example.test.model.MemberDTO;

@Controller
public class MemberController {
	
	@Inject
	MemberDAO memberDao;
	
	
	
	@RequestMapping("member/list.do")
	public String memberList(Model model) {
		List<MemberDTO> list = memberDao.list();
		model.addAttribute("list", list);
		return "member/list";
	}
	
	@RequestMapping("member/write.do")
	public String write() {
		return "member/join";
	}
	
	@RequestMapping("member/insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		memberDao.insert(dto);
		return "redirect:/member/login.do";
	}
	
	
	
	
	

}