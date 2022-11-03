package com.example.test.service;

import java.util.List;

import com.example.test.model.BoardDTO;

public interface BoardService{
	void insert(BoardDTO dto);
	BoardDTO detail(int bno);
	void update(BoardDTO dto);
	void delete(int bno);
	
	void increase_hit(int bno);
	public int count() throws Exception;
	// 게시물 목록 + 페이징
	public List<BoardDTO> listPage(int displayPost, int postNum) throws Exception;

}