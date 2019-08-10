package com.bbshop.bit.cart.mapper;

import java.util.List;
import java.util.Map;

import com.bbshop.bit.cart.domain.Cart_GDVO;
import com.bbshop.bit.cart.domain.GoodsVO;

public interface CartMapper {

	public List<Cart_GDVO> getCartList(long user_key);
	public GoodsVO getGoods(long goodsnum);
	public void modify(Cart_GDVO qnt);
	public void selectDelete(Map<String,Object> deleteMap);
	public void deleteAll();
}
