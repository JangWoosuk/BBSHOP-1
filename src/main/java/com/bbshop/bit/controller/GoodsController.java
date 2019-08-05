package com.bbshop.bit.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbshop.bit.domain.GoodsQnaVO;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.MoreDetailVO;
import com.bbshop.bit.domain.PageDTO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.service.GoodsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class GoodsController {
	
	private GoodsService service;
	
	// ��ǰ ��� ������
	@RequestMapping(value="/goods_list.do", method=RequestMethod.GET)
	public String goods_list(@RequestParam int category, PagingVO pagingVO, Model model) {
		log.info("Controller...goods_list.jsp");
		
		model.addAttribute("categoryInt", category);
		model.addAttribute("categoryString", service.category(category));
		
		int total = service.getTotalCount(category);
		
		model.addAttribute("pageMaker", new PageDTO(pagingVO, total));
		
		return "shoppingMall/goods/goods_list";
	}

	// ��ǰ ��� ������ - ajax ������ �ѷ��ֱ� 
	@RequestMapping(value="/getGoodsList_Ajax.do", consumes="application/json")
	@ResponseBody
	public List<GoodsVO> getGoodsList_Ajax(@RequestBody Map<String, Object> map){
		log.info("Controller...goods_list.jsp...goodsListAjax");
		
		// service�޼ҵ� ȣ���ϸ�.. ������ map�� �� parameter..
		// service��ü�� ������ �ٲ㺼��..
		int category = (int) map.get("category");
		
		PagingVO pagingVO = new PagingVO();
		pagingVO.setPageNum((int) map.get("pageNum"));
		pagingVO.setAmount((int) map.get("amount"));
		
		
		String sorting = (String) map.get("sorting");
		
		String min_amount = (String) map.get("min_amount");
		String max_amount = (String) map.get("max_amount");
		
		
		List<GoodsVO> goodsList = service.getGoodsList(category, pagingVO, sorting, min_amount, max_amount);

		return goodsList;
	}
	
	// ��ǰ ��ȸ ������ 
	@RequestMapping(value="/goods_info.do", method=RequestMethod.GET)
	public String getGoodsInfo(@RequestParam long goods_num, @RequestParam int category, Model model) {
		log.info("Controller..getGoodsList..goods_num:" + goods_num + ".....");
		
		model.addAttribute("goods", service.getGoodsInfo(goods_num));
		model.addAttribute("categoryInt", category);
		model.addAttribute("categoryString", service.category(category));
		
		
		return "shoppingMall/goods/goods_info";
	}
	
	
	
	
	
	
	/* ��ǰ QNA ��� */
	@RequestMapping(value="/registerGoodsQna.do", method=RequestMethod.GET)
	public String registerGoodsQna(GoodsQnaVO qna, int category, HttpSession session, Model model) {
		log.info("Controller..insertGoodsQna...!");
		
		/* ���� user_key �� �޾ƿ��� 
		long user_key = (long)session.getAttribute("user_key");
		String nickname = (String)session.getAttribute("nickname");
		
		// ��ȸ���� ���, 
		if(nickname.substring(0,9).equals("noAccount")) {
			// alert("�α����� �ʿ��մϴ�") or �α��θ�� or �ε����� ����
		}
		// ȸ���� ���,.
		else {
			long user_key = (long)session.getAttribute("user_key");
			qna.setUser_key(user_key);
		}			
		*/
		
		// ��ġ�� �� �ӽ� user_key
		long user_key = 950131l;
		qna.setUser_key(user_key);
		
		service.insertGoodsQna(qna);
		
		model.addAttribute("goods", service.getGoodsInfo(qna.getGoods_num()));
		model.addAttribute("categoryInt", category);
		model.addAttribute("categoryString", service.category(category));
		
		return "shoppingMall/goods/goods_info";
	}
	
	// ��ǰQNA ��� ������ - ajax ������ �ѷ��ֱ� 
	@RequestMapping(value="/getQnaList_Ajax.do", consumes="application/json")
	@ResponseBody
	public List<GoodsQnaVO> getQnaList_Ajax(@RequestBody Map<String, Object> map){
		log.info("Controller...QNA_list.jsp...qnaListAjax");
		
		PagingVO pagingVO = new PagingVO();
		pagingVO.setPageNum((int) map.get("pageNum"));
		pagingVO.setAmount((int) map.get("amount"));
		
		long goods_num = (long) ((int)map.get("goods_num") * 1.0);
		
		List<GoodsQnaVO> qnaList = service.getQnaList(pagingVO, goods_num);

		return qnaList;
	}

	
	
	
	
	// ���� ���� - ��õ��ǰ
	@RequestMapping(value="/shopping_main.do", method=RequestMethod.GET)
	public String shopping_main(HttpSession session, Model model) {
		log.info("Controller...shopping_main.jsp");
		
//		// ���� user_key �� �޾ƿ��� 
//		String nickname = (String)session.getAttribute("nickname");
//		
//		// ��ȸ���� ���, 
//		if(nickname.substring(0,9).equals("noAccount")) {
//			List<GoodsVO> recommendList = service.recommendBestList();
//		
//			model.addAttribute("recommendList", recommendList);
//		}
//		// ȸ���� ���,.
//		else {
//			long user_key = (long)session.getAttribute("user_key");
		
			// ��ġ�� �� �ӽ� user_key
			long user_key = 950131l;
			
			MoreDetailVO moredetail = service.findDetail(user_key);
			List<GoodsVO> recommendList = service.recommendGoodsList(moredetail);
			
			model.addAttribute("recommendList", recommendList);
//		}			
		
		return "shoppingMall/main/shopping_main";
	}

}
