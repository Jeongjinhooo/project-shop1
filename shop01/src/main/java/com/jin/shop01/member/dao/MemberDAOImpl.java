package com.jin.shop01.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jin.shop01.member.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	/* mybatis�� ����� �� �ֵ��� ���� */
	private final String NS = "mapper.member"; 
	 /* ���� ���ۿ��� ������ sql���� ����ϴ��� ����浹�� ���� ���� */
	@Override
	public void insert(MemberVO vo) {
		sqlSession.insert("insert", vo);
	}
}

