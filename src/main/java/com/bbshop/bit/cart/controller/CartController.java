package com.bbshop.bit.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	List<Cart_PDVO> cartList ;
	List<GoodsVO> goodsList;
	
	@Autowired(required=true)
	CartService cartService;
	
	@RequestMapping("cart.do")
	public String cart(HttpSession session, Model model) {
		System.out.println("cart������");
		long user_key = 1;
		Cart_PDVO vo = new Cart_PDVO();
		vo.setUSER_KEY(user_key);
		
		cartList = cartService.getCartList(user_key);
		goodsList = new ArrayList<GoodsVO>();
		
		for (int i = 0; i < cartList.size(); i++) {
			long goodsnum = cartList.get(i).getGOODS_NUM();
			Cart_PDVO temp = cartList.get(i);
			temp.setTOTALPRICE(temp.getPRICE());
			cartList.set(i, temp);
			int price = cartList.get(i).getPRICE();
			goodsList.add(cartService.getGoods(goodsnum));

		}

		for(int i = 0 ; i<goodsList.size();i++) {
			System.out.println("�����Ʈ �ٵ����°�?"+goodsList.get(i));
			System.out.println("īƮ����Ʈ ��Ż�� �����Ǿ���?"+cartList.get(i));
		}
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("cartList",cartList);
		
		return "shoppingMall/cart/cart";
	}
	@ResponseBody
	@RequestMapping(value="QnttyUp.do" , method=RequestMethod.GET)
	public int qnttyUp(@RequestParam("QNTTY") int qnt, @RequestParam("index") int index) {
		Cart_PDVO temp =cartList.get(index);
		System.out.println(index);
		System.out.println(qnt);
		temp.setQNTTY(qnt);
		temp.setTOTALPRICE(temp.getPRICE()*qnt);
		System.out.println(temp.getTOTALPRICE());
		cartList.set(index, temp);
		return temp.getTOTALPRICE();
	}
}
