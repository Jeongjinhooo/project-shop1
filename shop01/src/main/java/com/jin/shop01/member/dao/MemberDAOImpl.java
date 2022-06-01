package com.jin.shop01.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jin.shop01.member.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	/* mybatis를 사용할 수 있도록 해줌 */
	private final String NS = "mapper.member"; 
	 /* 여러 매퍼에서 동일한 sql문을 사용하더라도 기능충돌이 없게 해줌 */
	@Override
	public void insert(MemberVO vo) {
		sqlSession.insert(NS+".insert", vo);
	}
}

