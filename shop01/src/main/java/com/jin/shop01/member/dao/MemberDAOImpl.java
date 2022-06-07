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
	/* mybatis를 사용할 수 있도록 해줌 */
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member=(MemberVO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return member;
	}
		
	private final String NS = "mapper.member"; 
	 /* 여러 매퍼에서 동일한 sql문을 사용하더라도 기능충돌이 없게 해줌 */

	@Override
	public void insert(MemberVO vo) {
		sqlSession.insert("insert", vo);
	}
}




	

	
