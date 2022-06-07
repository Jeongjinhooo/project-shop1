package com.jin.shop01.member.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jin.shop01.member.dao.MemberDAO;
import com.jin.shop01.member.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(Map  loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	@Override
	public void insert(MemberVO vo) {
		
		memberDAO.insert(vo);
	}

}
