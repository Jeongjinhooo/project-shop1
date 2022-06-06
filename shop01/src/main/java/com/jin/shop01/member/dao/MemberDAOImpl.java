package com.jin.shop01.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jin.shop01.member.dto.LoginDTO;
import com.jin.shop01.member.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	/* mybatis를 사용할 수 있도록 해줌 */
	private final String NS = "mapper.member"; 
	 /* 여러 매퍼에서 동일한 sql문을 사용하더라도 기능충돌이 없게 해줌 */
	@Override
	public MemberVO login(LoginDTO dto) {
		return sqlSession.selectOne(NS+".login", dto);
	}
        /* id&pw로 가져올 수 있는 데이터는 많으면 하나 : selectOne 을 사용한다 */
        /* namespace + .mapper에서 설정한 id : kr.co.member.login */
	@Override
	public void insert(MemberVO vo) {
		sqlSession.insert("insert", vo);
	}
}




	

	
