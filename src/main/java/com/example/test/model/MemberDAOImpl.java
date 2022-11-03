package com.example.test.model;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> list(){
		return sqlSession.selectList("member.list");
	}
	
	@Override
	public void insert(MemberDTO dto) {
		sqlSession.insert("member.insert", dto);
	}
	


}