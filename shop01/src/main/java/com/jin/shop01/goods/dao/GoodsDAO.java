package com.jin.shop01.goods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.jin.shop01.goods.vo.GoodsVO;
import com.jin.shop01.goods.vo.ImageFileVO;



public interface GoodsDAO {
	public List<GoodsVO> selectGoodsList(String goodsStatus ) throws DataAccessException;
}
