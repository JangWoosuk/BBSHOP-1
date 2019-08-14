package com.bbshop.bit.mapper;

import java.util.List;
import java.util.Map;

import com.bbshop.bit.domain.Cart_GDVO;
import com.bbshop.bit.domain.GoodsVO;

public interface CartMapper{

	public List<Cart_GDVO> getCartList(long user_key);
	public GoodsVO getGoods(long goodsnum);
	public void modify(Cart_GDVO qnt);
	public void selectDelete(Map<String,Object> deleteMap);
	public void deleteAll();
}