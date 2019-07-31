package com.bbshop.bit.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor // �ڵ����� ������̼�
public class GoodsServiceImpl implements GoodsService {
	
	private GoodsMapper mapper;

	// ī�װ� int > String
	@Override
	public String category(int category) {
		switch(category) {
			case 1: return "�۷���";
			case 2: return "��Ʈ";
			case 3: return "������";
			case 4: return "�߱�ȭ";
			default: return "�߱���";
		}
	}



	/* ����¡ O */
	@Override
	public List<GoodsVO> getGoodsList(int category, PagingVO pagingVO, String sorting, String min_amount, String max_amount) {
		log.info("getGoodsList...Ajax..With Paging................");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("pagingVO", pagingVO);
		map.put("sorting", sorting);
		map.put("min_amount", Integer.parseInt(min_amount));
		map.put("max_amount", Integer.parseInt(max_amount));
		
		return mapper.getGoodsList(map);
	}



	
	
	/* ī�װ���  goods ������ ���� */
	@Override
	public int getTotalCount(int category) {
		log.info("get Total Count - " + category);
		
		return mapper.getTotalCount(category);
	}

	
	
	/* ��ǰ ��ȸ */
	@Override
	public GoodsVO getGoodsInfo(Long goods_num) {
		log.info("getGoodsInfo....goods_num : "+goods_num+"............");
		
		return mapper.getGoodsInfo(goods_num);
	}








	
	
}
