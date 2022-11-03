package com.example.test.model;

import java.util.List;

public interface MemberDAO {
	List<MemberDTO> list();
	void insert(MemberDTO dto);
	
	
	
}

