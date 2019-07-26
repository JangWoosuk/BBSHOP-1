package com.bbshop.bit.mapper;

import java.util.HashMap;
import java.util.List;

import com.bbshop.bit.domain.GoodsVO;

public interface GoodsMapper {

	/* ����¡ X
	// ��ǰ ��� ��� - ���� - �Ż�ǰ �� (default)
	public List<GoodsVO> getGoodsList_New(int category);
	
	// ��ǰ ��� ��� - ���� - �α��ǰ
	public List<GoodsVO> getGoodsList_Best(int category);
	
	// ��ǰ ��� ��� - ���� - ���� ����
	public List<GoodsVO> getGoodsList_LowPrice(int category);
	
	// ��ǰ ��� ��� - ���� - ���� ����
	public List<GoodsVO> getGoodsList_HighPrice(int category);
	*/
	
	
	
	
	/* ����¡ O , map[pagingVO, category] */
	// ��ǰ ��� ��� - new -> paging (default)
	public List<GoodsVO> getGoodsList_New(HashMap<String, Object> map);
	
	// ��ǰ ��� ��� - best -> paging
	public List<GoodsVO> getGoodsList_Best(HashMap<String, Object> map);
		
	// ��ǰ ��� ��� - lowPrice -> paging
	public List<GoodsVO> getGoodsList_LowPrice(HashMap<String, Object> map);
		
	// ��ǰ ��� ��� - highPrice -> paging
	public List<GoodsVO> getGoodsList_HighPrice(HashMap<String, Object> map);
	
	
	
	
	/* ī�װ��� ��ü goods ������ ���� */
	public int getTotalCount(HashMap<String, Object> map);
	
}
