package com.jin.shop01.mypage.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jin.shop01.member.vo.MemberVO;
import com.jin.shop01.order.vo.OrderVO;

public interface MyPageService{
	public List<OrderVO> listMyOrderGoods(String userid) throws Exception;
	public List findMyOrderInfo(String order_id) throws Exception;
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception;
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception;
	public void cancelOrder(String order_id) throws Exception;
	public MemberVO myDetailInfo(String userid) throws Exception;

}
