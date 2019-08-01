package com.bbshop.bit.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbshop.bit.cart.domain.Cart_PDVO;
import com.bbshop.bit.cart.service.CartService;


/*1. ��� Ű�� �޾Ƽ� īƮ����Ʈ�� �޾ƿ���
 *2. īƮ����Ʈ���� ���� ���� �޾Ƽ� ��ǰ ������ ��������
 *3. ���� ����Ʈ���� �ʿ��� �׸��� �޾ƿ���.
 *4. �ʿ��� �׸��� �������� jsp�� model�� �־ ��������.*/
@Controller
@RequestMapping("*.do")
public class CartController {
	
	
	@Autowired
	CartService cartservice;
	
	@RequestMapping("cart.do")
	public String cart(HttpSession session, Model model) {
		System.out.println("cart������");
		long user_key = 1;
		Cart_PDVO vo = new Cart_PDVO();
		vo.setUSER_KEY(user_key);
		List<Cart_PDVO> cartList = cartservice.getCartList(user_key);
		
		return "shoppingMall/cart/cart";
	}
}
