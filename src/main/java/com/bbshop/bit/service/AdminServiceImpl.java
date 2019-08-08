package com.bbshop.bit.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
