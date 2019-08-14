package com.bbshop.bit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbshop.bit.domain.Cart_GDVO;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.service.CartService;

@Controller
@RequestMapping("*.do")
public class CartController {
	
	List<Cart_GDVO> cartList ;
	List<GoodsVO> goodsList;
	
	@Autowired(required=true)
	CartService cartService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("cart.do")
	public String cart(HttpSession session, Model model) {
		System.out.println("cart페이지");
		int allPrice=0;
		int shipping_fee=0;
		long user_key = (long)session.getAttribute("member");
		Cart_GDVO vo = new Cart_GDVO();
		vo.setUSER_KEY(user_key);
		
		cartList = cartService.getCartList(user_key);
		goodsList = new ArrayList<GoodsVO>();
		
		for (int i = 0; i < cartList.size(); i++) {
			long goodsnum = cartList.get(i).getGOODS_NUM();
			Cart_GDVO temp = cartList.get(i);
			temp.setTOTALPRICE(temp.getPRICE()*temp.getQNTTY());
			cartList.set(i, temp);
			int price = cartList.get(i).getPRICE();
			goodsList.add(cartService.getGoods(goodsnum));

		}

		for(int i = 0 ; i<goodsList.size();i++) {
			System.out.println("굿즈리스트 다들어오는가?"+goodsList.get(i));
			System.out.println("카트리스트 토탈이 수정되었낭?"+cartList.get(i));
		}
		
		
		for(int i = 0 ; i<cartList.size();i++) {
			allPrice +=cartList.get(i).getTOTALPRICE(); 
			
		}
		
		shipping_fee=calcShipping_fee(allPrice);
		model.addAttribute("shipping_fee", shipping_fee);
		model.addAttribute("allPrice", allPrice);
		
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("cartList",cartList);
		
		return "shoppingMall/cart/cart";
	}
	@ResponseBody
	@RequestMapping(value="QnttyUp.do" , method=RequestMethod.GET)
	public String qnttyUp(@RequestParam("QNTTY") int qnt, @RequestParam("index") int index,Model model) {
		Cart_GDVO temp =cartList.get(index);
		int allPrice=0;
		int shipping_fee=0;
		
		System.out.println(index);
		System.out.println(qnt);
		temp.setQNTTY(qnt);		
		temp.setTOTALPRICE(temp.getPRICE()*qnt);
		
		System.out.println(temp.getTOTALPRICE());
		cartService.modify(temp);
		cartList.set(index, temp);
		System.out.println(temp);
		
		for(int i = 0 ; i<cartList.size();i++) {
			allPrice +=cartList.get(i).getTOTALPRICE(); 
		}
		shipping_fee=calcShipping_fee(allPrice);
		System.out.println(allPrice);
		
		return ""+temp.getTOTALPRICE()+","+allPrice+","+shipping_fee;
	}
	@ResponseBody
	@RequestMapping(value="QnttyDown.do" , method=RequestMethod.GET)
	public String qnttyDown(@RequestParam("QNTTY") int qnt, @RequestParam("index") int index ,Model model) {
		Cart_GDVO temp =cartList.get(index);
		int allPrice=0;
		int shipping_fee=0;

		temp.setQNTTY(qnt);
		temp.setTOTALPRICE(temp.getPRICE()*qnt);
		
		cartList.set(index, temp);
		shipping_fee=calcShipping_fee(allPrice);
		
		cartService.modify(temp);
		System.out.println(temp);
		for(int i = 0 ; i<cartList.size();i++) {
			allPrice +=cartList.get(i).getTOTALPRICE(); 
		}

		return ""+temp.getTOTALPRICE()+","+allPrice+","+shipping_fee;
	}
	
	public int calcShipping_fee(int allPrice) {
		int shipping_fee=0;
		if(allPrice>=2000000) {
			shipping_fee=0;
		}
		else {
			shipping_fee=2500;
			allPrice+=2500;
		}
		return shipping_fee;
	}
	@RequestMapping(value="selectDelete.do" , method=RequestMethod.POST)
	public String selectDelete(HttpServletRequest request) {
		String[] listindex =request.getParameterValues("listindex");
		if(!listindex[0].equals("0")) {
		List<Integer> deleteList = new ArrayList<Integer>();
		List<Integer> deleteListResult = new ArrayList<Integer>();
		Map<String,Object> deleteMap = new HashMap<String,Object>();
		for(int i = 0 ; i<listindex.length;i++) {
			deleteList.add(i, Integer.parseInt(listindex[i]));
			System.out.println(listindex[i]);
		}
		//체크박스에서 받은 인자의 인덱스가 cartlist에서 pk가 몇번인지 받아와야한다.
		for(int i = 0; i<deleteList.size();i++) {
			System.out.println("deletetemp에 있는값:"+deleteList.get(i));
			//cart리스트는 0 부터 시작하고 받아온것은 1부터 시작하기때문에 -1을 넣어줬다.
			deleteListResult.add(i,(int) cartList.get(deleteList.get(i)-1).GD_CT_KEY);
			System.out.println("deleteResult에 있는값:"+deleteListResult.get(i));
		}
		deleteMap.put("deleteListResult", deleteListResult);
		cartService.selectDelete(deleteMap);
		}
		else {
			cartService.deleteAll();
		}
		return "cart.do";
	}
	
	// 헤더의 장바구니 버튼을 클릭시 ajax 요청을 응답하는 컨트롤러
	@RequestMapping("getCartList.do")
	@ResponseBody
	public Map<String, Object> getCartList() {
		
		long user_key = (long)session.getAttribute("member");
		Map<String, Object> result = new HashMap<>();
		int allPrice = 0;

		List<Cart_GDVO> cart_list = cartService.getCartList(user_key);
		System.out.println("cart_list : " + cart_list.toString());
		
		List<GoodsVO> goods_list = new ArrayList<GoodsVO>();
		
		// 장바구니 리스트에 담긴 상품들의 상품 정보를 담은 리스트를 만든다.
		for (int i = 0; i < cart_list.size(); i++) {
			
			long goodsnum = cart_list.get(i).getGOODS_NUM();
			Cart_GDVO temp = cart_list.get(i);
			temp.setTOTALPRICE(temp.getPRICE()*temp.getQNTTY());
			cart_list.set(i, temp);
			goods_list.add(cartService.getGoods(goodsnum));
		}
		
		// 총 금액 구하기.
		for (int i = 0 ; i < cart_list.size(); i++) {
			
			allPrice += cart_list.get(i).getTOTALPRICE();
		}
		
		result.put("allPrice", allPrice);
		result.put("goods_list",goods_list);
		result.put("cart_list", cart_list);
		
		return result;
	}
}