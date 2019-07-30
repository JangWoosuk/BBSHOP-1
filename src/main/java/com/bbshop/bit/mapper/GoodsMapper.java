package com.bbshop.bit.mapper;

import java.util.HashMap;
import java.util.List;

import com.bbshop.bit.domain.GoodsVO;

public interface GoodsMapper {
		
	// ����¡ O
	// ��ǰ ���, sorting���� ���� ��������
	// ���޹��� hashmap[pagingVO(pageNum,amount), category, sorting] */
	public List<GoodsVO> getGoodsList(HashMap<String, Object> map);
	
	
	
	// ī�װ� ��, goods ������ ���� 
	public int getTotalCount(HashMap<String, Object> map);
	
	
	
	// ��ǰ ��ȸ
	public GoodsVO getGoodsInfo(long goods_num);
	
}
