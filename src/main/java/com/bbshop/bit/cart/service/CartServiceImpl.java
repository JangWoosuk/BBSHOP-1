package com.bbshop.bit.cart.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbshop.bit.cart.domain.Cart_PDVO;
import com.bbshop.bit.cart.mapper.CartMapper;

@Service("cartservice")
public class CartServiceImpl implements CartService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Cart_PDVO> getCartList(long user_key) {
		
		System.out.println("����Ű�� ������� �����°�?"+user_key);
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		sqlSession.getMapper(CartMapper.class);
		List<Cart_PDVO> cartList = mapper.getCartList(user_key);
		
		System.out.println(cartList);
		
		// TODO Auto-generated method stub
		return cartList;
	}

}
