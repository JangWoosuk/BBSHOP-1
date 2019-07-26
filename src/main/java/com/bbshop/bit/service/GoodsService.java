package com.bbshop.bit.service;

import java.util.List;

import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.PagingVO;

public interface GoodsService {
	// ī�װ� int > String
	public String category(int category);

	
	/* ����¡ X 
	public List<GoodsVO> getGoodsList_New(int category);
	public List<GoodsVO> getGoodsList_Best(int category);
	public List<GoodsVO> getGoodsList_LowPrice(int category);
	public List<GoodsVO> getGoodsList_HighPrice(int category);
	*/


	/* ����¡ O */
	public List<GoodsVO> getGoodsList_New(PagingVO pagingVO, int category);
	public List<GoodsVO> getGoodsList_Best(PagingVO pagingVO, int category);
	public List<GoodsVO> getGoodsList_LowPrice(PagingVO pagingVO, int category);
	public List<GoodsVO> getGoodsList_HighPrice(PagingVO pagingVO, int category);


	/* ī�װ��� ��ü goods ������ ���� */
	public int getTotalCount(PagingVO pagingVO, int category);
}
