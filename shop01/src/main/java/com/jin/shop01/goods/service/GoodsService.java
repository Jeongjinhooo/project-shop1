package com.jin.shop01.goods.service;

import java.util.List;
import java.util.Map;

import com.jin.shop01.goods.vo.GoodsVO;



public interface GoodsService {
	
	public Map<String,List<GoodsVO>> listGoods() throws Exception;
}
