package com.bbshop.bit.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbshop.bit.cart.domain.Cart_PDVO;
import com.bbshop.bit.cart.domain.GoodsVO;
import com.bbshop.bit.cart.service.CartService;


/*1. ��� Ű�� �޾Ƽ� īƮ����Ʈ�� �޾ƿ���
 *2. īƮ����Ʈ���� ���� ���� �޾Ƽ� ��ǰ ������ ��������
 *3. ���� ����Ʈ���� �ʿ��� �׸��� �޾ƿ���.
 *4. �ʿ��� �׸��� �������� jsp�� model�� �־ ��������.*/
@Controller
@RequestMapping("*.do")
public class CartController {
	
	
	@Autowired(required=true)
	CartService cartService;
	
	@RequestMapping("cart.do")
	public String cart(HttpSession session, Model model) {
		System.out.println("cart������");
		long user_key = 1;
		Cart_PDVO vo = new Cart_PDVO();
		vo.setUSER_KEY(user_key);
		
		List<Cart_PDVO> cartList = cartService.getCartList(user_key);
		List<GoodsVO> goodsList=new ArrayList<GoodsVO>();
		for(int i = 0; i<cartList.size();i++) {
		long goodsnum = cartList.get(i).getGOODS_NUM();
		int price =cartList.get(i).getPRICE();
		System.out.println("price:"+price);
		
		goodsList = cartService.getGoodsList(goodsnum);
		
		}
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("cartList",cartList);
		
		return "shoppingMall/cart/cart";
	}
}
