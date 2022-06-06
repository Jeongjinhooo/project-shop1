package com.jin.shop01.member.service;

import com.jin.shop01.member.dto.LoginDTO;
import com.jin.shop01.member.vo.MemberVO;

public interface MemberService {

	MemberVO login(LoginDTO dto);
	
	public void insert(MemberVO vo);
	
	
}

	



