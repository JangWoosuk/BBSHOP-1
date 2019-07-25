package com.bbshop.bit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.bbshop.bit.domain.GoodsVO;
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

	@Override
	public List<GoodsVO> getGoodsList_New(int category) {
		log.info("getGoodsList..New..................");
		
		return mapper.getGoodsList_New(category);
	}

	@Override
	public List<GoodsVO> getGoodsList_Best(int category) {
		log.info("getGoodsList..Best..................");
		
		return mapper.getGoodsList_Best(category);
	}

	@Override
	public List<GoodsVO> getGoodsList_LowPrice(int category) {
		log.info("getGoodsList..LowPrice..................");
		
		return mapper.getGoodsList_LowPrice(category);
	}

	@Override
	public List<GoodsVO> getGoodsList_HighPrice(int category) {
		log.info("getGoodsList..HighPrice..................");
		
		return mapper.getGoodsList_HighPrice(category);
	}

}
