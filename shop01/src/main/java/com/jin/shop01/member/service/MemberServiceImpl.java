package com.jin.shop01.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jin.shop01.member.dao.MemberDAO;
import com.jin.shop01.member.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public void insert(MemberVO vo) {
		
		memberDAO.insert(vo);
	}

}
