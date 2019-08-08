package com.bbshop.bit.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbshop.bit.domain.Gd_ballVO;
import com.bbshop.bit.domain.Gd_batVO;
import com.bbshop.bit.domain.Gd_gloveVO;
import com.bbshop.bit.domain.Gd_shoesVO;
import com.bbshop.bit.domain.Gd_uniformVO;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.mapper.AdminMapper;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<GoodsVO> getGoodsList() {
		System.out.println("��ǰ ����� �޾ƿ��ڽ��ϴ�.");
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<GoodsVO> goodsList = mapper.getGoodsList();
		System.out.println(goodsList);
		
		return goodsList;
	}
	
	
	//��ǥ��ǰ�� �ɼǵ��� �������� �޼ҵ�.
	@Override
	public List<Object> getGdList(int category, long goods_num) {
		// TODO Auto-generated method stub
		System.out.println("��ǰ �ɼ� ����� �޾ƿ��ڽ��ϴ�.");
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<Object> goodsList = new ArrayList<Object>();
		//ī�װ��� ���ڿ� ���� mapper���� ���Ǵ� �޼ҵ尡 �ٸ���.
		switch(category) {
		//�۷���
		case 1: {
			goodsList = mapper.getGloveList(goods_num);	
			System.out.println(goodsList);
			break;
		}//�����
		case 2: {
			goodsList = mapper.getBatList(goods_num);	
			System.out.println(goodsList);
			break;
		}//������
		case 3: {
			goodsList = mapper.getUniformList(goods_num);	
			System.out.println(goodsList);
			break;
		}//�߱�ȭ
		case 4: {
			goodsList = mapper.getShoesList(goods_num);	
			System.out.println(goodsList);
			break;
		}//�߱���
		case 5: {
			goodsList = mapper.getBallList(goods_num);	
			System.out.println(goodsList);
			break;
		}
		}
		
		
		return goodsList;
	}
}

	
	


	