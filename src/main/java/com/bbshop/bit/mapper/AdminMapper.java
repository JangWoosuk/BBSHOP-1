package com.bbshop.bit.mapper;

import java.util.List;

import com.bbshop.bit.domain.Gd_ballVO;
import com.bbshop.bit.domain.Gd_batVO;
import com.bbshop.bit.domain.Gd_gloveVO;
import com.bbshop.bit.domain.Gd_shoesVO;
import com.bbshop.bit.domain.Gd_uniformVO;
import com.bbshop.bit.domain.GoodsVO;

public interface AdminMapper {

	public List<GoodsVO> getGoodsList();
	public List<Object> getGloveList(long goods_num);
	public List<Object> getBatList(long goods_num);
	public List<Object> getUniformList(long goods_num);
	public List<Object> getShoesList(long goods_num);
	public List<Object> getBallList(long goods_num);
	public void insertGoods(GoodsVO vo);
	public void insertGoodsGlove(Gd_gloveVO glove);
	public void insertGoodsBat(Gd_batVO bat);
	public void insertGoodsBall(Gd_ballVO ball);
	public void insertGoodsShoes(Gd_shoesVO shoes);
	public void insertGoodsUniform(Gd_uniformVO uniform);
	public int getGoodsNum(GoodsVO vo);
}