package com.jin.shop01.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jin.shop01.member.dao.MemberDAO;
import com.jin.shop01.member.dto.LoginDTO;
import com.jin.shop01.member.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(LoginDTO dto) {
		return memberDAO.login(dto);
	}
        /* 구현되지 않은 추상메서드를 구현 + dao와 연결해준다 */
		
	@Override
	public void insert(MemberVO vo) {
		
		memberDAO.insert(vo);
	}

}
