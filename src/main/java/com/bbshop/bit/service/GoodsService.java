package com.bbshop.bit.service;

import java.util.List;

import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.PagingVO;

public interface GoodsService {
	
	// ī�װ� int > String
	public String category(int category);

	
	/* ����¡ O, ��ǰ ��� */
	public List<GoodsVO> getGoodsList(int category, PagingVO pagingVO, String sorting, String min_amount, String max_amount, 
			List<String> positions, List<Integer> hands, List<String> brands);


	/* ī�װ��� ��ü goods ������ ���� */
	public int getTotalCount(PagingVO pagingVO, int category);
	
	
	/* ��ǰ ��ȸ */
	public GoodsVO getGoodsInfo(Long goods_num);
}
