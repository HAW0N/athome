package com.example.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.test.model.BoardDAO;
import com.example.test.model.BoardDTO;


@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAO boardDao;

	@Transactional
	@Override
	public void insert(BoardDTO dto){
		boardDao.insert(dto);
	}

	@Transactional
	@Override
	public void update(BoardDTO dto){
		boardDao.update(dto);
	}

	@Override
	public void delete(int bno){
		boardDao.delete(bno);
	}

	@Override
	public BoardDTO detail(int idx){
		return boardDao.detail(idx);
	}


	@Override
	public void increase_hit(int idx){
		boardDao.increase_hit(idx);
	}
	@Override
	public int count() throws Exception {
		return boardDao.count();
	}
	// 게시물 목록 + 페이징
	@Override
	public List<BoardDTO> listPage(int displayPost, int postNum) throws Exception {
	 return boardDao.listPage(displayPost, postNum);
	}
}