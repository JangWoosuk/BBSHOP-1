package com.bbshop.bit.service;

import java.util.List;
import java.util.Map;

import com.bbshop.bit.domain.Cart_GDVO;
import com.bbshop.bit.domain.GoodsVO;

public interface CartService {

	public List<Cart_GDVO> getCartList(long user_key);
	public GoodsVO getGoods(long goodsnum);
	public void modify(Cart_GDVO qnt);
	public void selectDelete(Map<String,Object> deleteMap);
	public void deleteAll();

	// 의정 - 배송비 불러오는 서비스 메서드 추가
	public int calcShipping_fee(int allPrice);
}