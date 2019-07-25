package com.bbshop.bit.mapper;

import java.util.List;

import com.bbshop.bit.domain.GoodsVO;

public interface GoodsMapper {

	// ��ǰ ��� ��� - ���� - �Ż�ǰ �� (default)
	public List<GoodsVO> getGoodsList_New(int category);
	
	// ��ǰ ��� ��� - ���� - �α��ǰ
	public List<GoodsVO> getGoodsList_Best(int category);
	
	// ��ǰ ��� ��� - ���� - ���� ����
	public List<GoodsVO> getGoodsList_LowPrice(int category);
	
	// ��ǰ ��� ��� - ���� - ���� ����
	public List<GoodsVO> getGoodsList_HighPrice(int category);

	
}
