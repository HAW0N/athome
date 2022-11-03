package com.example.test.model;

import java.util.List;

public interface BoardDAO {
	
	void insert(BoardDTO dto);
	BoardDTO detail(int idx);
	void update(BoardDTO dto);
	void delete(int idx);
	
	void increase_hit(int idx);
	int count() throws Exception;
	
	// 게시물 목록 + 페이징
	public List<BoardDTO> listPage(int displayPost, int postNum) throws Exception;
	
}

