package com.jin.shop01.member.dao;

import com.jin.shop01.member.dto.LoginDTO;
import com.jin.shop01.member.vo.MemberVO;

public interface MemberDAO {
	
	MemberVO login(LoginDTO dto);
	/* ��ȯ���� MemberVO�� login �߻�޼��� 
	 * loginDTO Ŭ������ ������ ����� ����Ѵ�  */
	void insert(MemberVO vo);
}