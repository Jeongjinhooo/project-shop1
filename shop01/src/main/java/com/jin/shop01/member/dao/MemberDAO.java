package com.jin.shop01.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.jin.shop01.member.vo.MemberVO;

public interface MemberDAO {
	
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
}