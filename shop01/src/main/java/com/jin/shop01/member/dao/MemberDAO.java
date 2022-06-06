package com.jin.shop01.member.dao;

import com.jin.shop01.member.dto.LoginDTO;
import com.jin.shop01.member.vo.MemberVO;

public interface MemberDAO {
	
	MemberVO login(LoginDTO dto);
	/* 반환형이 MemberVO인 login 추상메서드 
	 * loginDTO 클래스를 별도로 만들어 사용한다  */
	void insert(MemberVO vo);
}