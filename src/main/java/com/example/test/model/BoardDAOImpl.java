package com.example.test.model;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	SqlSession sqlSession;

	@Override
	public void update(BoardDTO dto) {
		sqlSession.update("board.update",dto);
	}
	@Override
	public void delete(int idx){
		sqlSession.delete("board.delete",idx);
	}

	@Override
	public void insert(BoardDTO dto){
		sqlSession.insert("board.insert",dto);
	}
	@Override
	public void increase_hit(int idx){
		sqlSession.update("board.increase_hit",idx);
	}
	
	@Override
	public BoardDTO detail(int idx){
		return sqlSession.selectOne("board.detail",idx);
	}
	@Override
	public int count() throws Exception {
		return sqlSession.selectOne("board.count");
	}
	// 게시물 목록 + 페이징
	@Override
	public List<BoardDTO> listPage(int displayPost, int postNum) throws Exception {

	 HashMap<String, Integer> data = new HashMap<String, Integer>();
	  
	 data.put("displayPost", displayPost);
	 data.put("postNum", postNum);
	  
	 return sqlSession.selectList("board.listPage", data);
	}
}
