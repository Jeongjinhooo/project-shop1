package com.jin.shop01.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jin.shop01.member.service.MemberService;
import com.jin.shop01.member.vo.MemberVO;

import javax.inject.Inject;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return "member/insert";
	}
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void insert(MemberVO vo) {
		
		memberService.insert(vo);
	}
}
