package com.jin.shop01.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.jin.shop01.member.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;
	/* mybatis�� ����� �� �ֵ��� ���� */
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member=(MemberVO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return member;
	}
		
	private final String NS = "mapper.member"; 
	 /* ���� ���ۿ��� ������ sql���� ����ϴ��� ����浹�� ���� ���� */

	@Override
	public void insert(MemberVO vo) {
		sqlSession.insert("insert", vo);
	}
}




	

	
