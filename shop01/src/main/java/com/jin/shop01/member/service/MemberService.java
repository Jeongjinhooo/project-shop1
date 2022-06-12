package com.jin.shop01.member.service;

import java.util.Map;

import com.jin.shop01.member.vo.MemberVO;

public interface MemberService {

	public MemberVO login(Map  loginMap) throws Exception;
	public void insert(MemberVO vo);
	
}

	



